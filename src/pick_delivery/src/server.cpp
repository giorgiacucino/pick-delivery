#include <ros/ros.h>
#include <stdlib.h>
#include <list>
#include "users.h"
#include "robot.h"
#include "aula.h"
#include "pick_delivery/login.h"
#include "/home/me/labiagi_2020_21/workspaces/srrg2_labiagi/devel/include/srrg2_core_ros/PlannerStatusMessage.h"
#include "pick_delivery/invio.h"
#include "pick_delivery/notifica.h"
#include <fstream>
#include <geometry_msgs/PoseStamped.h>

list<user>					userlist;
list<aula>					aulelist;
user*						sender;
user*						receiver;
aula*						auladest;
int							broadcast;
int							client_called = 0;
pick_delivery::notifica		n;
geometry_msgs::PoseStamped	goal;
robot						rob = robot(0, 1);
ros::ServiceServer			servLog;
ros::ServiceServer			servSend;
ros::ServiceClient			notifyClient;
ros::Publisher				pub_robot;
ros::Subscriber				sub_robot;

bool	handle_client(pick_delivery::login::Request &req, pick_delivery::login::Response &res)
{
	if (req.type_service == 0)
	{
		for (auto& u : userlist)
		{
			if (u.hash == req.name && u.can_logout == 1)
			{
				userlist.remove(u);
				res.serv_resp = "bye bye!";
			}
		}
	}
	if (req.type_service == 1)
	{
		int	count;

		count = 0;
		for (auto& u : userlist)
		{
			if (u.name==req.name)
			{
				count++;
			}
		}
		user us = user(req.name, count);
		userlist.push_back(us);
		res.serv_resp = us.hash;
	}
	if (req.type_service == 2)
	{
		int	valid;

		valid = 0;
		for (auto& u : userlist)
		{
			if (u.hash == req.name)
			{
				for (auto& a : aulelist)
				{
					if (a.name == req.aula)
					{
						valid = 1;
						u.x = a.x;
						u.y = a.y;
						break ;
					}
				}
			}
		}
		if (valid == 1)
			res.serv_resp = req.aula;
		else
			return (0);
	}
	return (true);
}

void	log_all_users(aula a, int log)
{
	for (auto& u : userlist)
	{
		if (u.x == a.x && u.y == a.y)
			u.can_logout = log;
	}
}

void	get_infos(string sen, string recv, string auladst)
{
	broadcast = 0;
	if (recv == "0")
		broadcast = 1;
	for (auto& u : userlist)
	{
		if (u.hash == sen)
		{
			sender = &u;
			(*sender).can_logout = 0;
		}
		if (broadcast == 0 && u.hash == recv)
		{
			receiver = &u;
			(*receiver).can_logout = 0;
		}
	}

	for (auto& a : aulelist)
	{
		if (a.name == auladst)
			auladest = &a;
	}
	if (broadcast == 1)
		log_all_users(*auladest, 0);
}

void callClient()
{
	client_called = 1;
	if (rob.status == 0)
		return ;
	else if (rob.status == 1)
	{
		n.request.user = (*sender).hash;
		n.request.auladest = "";
		n.request.msg = "è arrivato il robot, consegna il pacco";
	}
	else if (rob.status == 2)
	{
		if (broadcast == 1)
			n.request.user = "";
		else
			n.request.user = (*receiver).hash;
		n.request.auladest = (*auladest).name;
		n.request.msg = "c'è un pacco per te, ritiralo";
	}
	while (notifyClient.call(n) == 0);
	rob.status = n.response.picked;
}

void	set_goal()
{
	int	coordx;
	int coordy;
	if (rob.status == 0)
		//log_all_users(*auladest, 1);
		return ;
	if (rob.status == 1)
	{
		coordx = (*sender).x;
		coordy = (*sender).y;
	}
	if (rob.status == 2)
	{
		//(*sender).can_logout = 1;
		coordx = (*auladest).x;
		coordy = (*auladest).y;
	}
	goal.header.stamp = ros::Time::now();
	goal.header.frame_id = "map";
	goal.pose.position.x = coordx;
	goal.pose.position.y = coordy;
	pub_robot.publish(goal);
	client_called = 0;
	ros::spinOnce();
}

bool	handle_invio(pick_delivery::invio::Request &req, pick_delivery::invio::Response &res)
{
	res.serv_resp = 0;
	if (rob.free == 0)
		res.serv_resp = 2;
	else
	{
		rob.free = 0;
		int	room;
		int person;

		room = 0;
		person = 0;
		for (auto& a : aulelist)
		{
			if (a.name == req.aula)
			{
				room = 1;
				if (req.receiver == "0")
				{
					person = 1;
					break ;
				}
				for (auto& u : userlist)
				{
					if (u.hash == req.receiver && a.x == u.x && a.y == u.y)
					{
						person = 1;
						break ;
					}
				}
			}
		}
		if (room == 0 && person == 1)
		{
			rob.free = 1;
			res.serv_resp = 3;
		}
		else if (person == 0)
		{
			rob.free = 1;
			res.serv_resp = 4;
		}
		else if (room == 1 && person == 1)
		{
			res.serv_resp = 1;
			get_infos(req.sender, req.receiver, req.aula);
			cout << "[INFO] Richiesta di pick&delivery accettata" << endl;
			cout << "sender: " << (*sender).hash << endl;
			cout << "sender: " << req.receiver << endl;
			cout << "sender: " << (*auladest).name << endl;
			rob.status = 1;
			cout << "[INFO] Settando un nuovo goal..." << endl;
			set_goal();
			cout << "[INFO] Nuovo goal settato" << endl;
		}
	}
	return (true);
}

void	check_robot(const srrg2_core_ros::PlannerStatusMessage::ConstPtr& info)
{
	rob.distance = info->distance_to_global_goal;
	cout << "[INFO] La distanza dal goal è: " << rob.distance << endl;
	if (rob.distance < 0.7)
	{
		if (rob.distance == rob.prevdist && rob.distance != 0)
		{
			cout << "[INFO] Il robot è arrivato a destinazione" << endl;
			if (client_called == 0)
			{
				callClient();
				cout << "[INFO] Settando un nuovo goal..." << endl;
				set_goal();
			}
		}
	}
	rob.prevdist = info->distance_to_global_goal;
}

int	main(int argc, char **argv)
{
	ros::init(argc, argv, "server");
	
	ros::NodeHandle		node;

	servLog = node.advertiseService("/newclient", handle_client);
	servSend = node.advertiseService("/invio", handle_invio);

	notifyClient = node.serviceClient<pick_delivery::notifica>("/notifica");

	pub_robot = node.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal", 1000);
	sub_robot = node.subscribe("/planner_status", 1000, check_robot);
	aulelist = get_aule();

	ros::spin();

	return (0);
}
