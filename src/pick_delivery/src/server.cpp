#include <ros/ros.h>
#include <stdlib.h>
#include <list>
#include "users.h"
#include "robot.h"
#include "aula.h"
#include "pick_delivery/login.h"
#include "/home/me/labiagi_2020_21/workspaces/srrg2_labiagi/devel/include/srrg2_core_ros/PlannerStatusMessage.h"
#include "pick_delivery/invio.h"
#include "pick_delivery/s_to_c.h"
#include "pick_delivery/c_to_s.h"
#include <fstream>
#include <geometry_msgs/PoseStamped.h>

list<user>					userlist;
list<aula>					aulelist;
user*						sender;
user*						receiver;
aula*						auladest;
int							broadcast;
int							need_to_serve = 0;
pick_delivery::s_to_c		msc;
geometry_msgs::PoseStamped	goal;
robot						rob = robot("idle", 1);

bool	handle_client(pick_delivery::login::Request &req, pick_delivery::login::Response &res)
{
	if (req.type_service == 0)
	{
		int	rem;
		rem = 0;
		for (auto& u : userlist)
		{
			if (u.hash == req.name && u.can_logout == 1)
			{
				cout << u.hash << " " << u.can_logout << endl;
				userlist.remove(u);
				rem = 1;
				res.serv_resp = "bye bye!";
				break ;
			}
		}
		return (rem);
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

void	block_all_users(aula a)
{
	for (auto& u : userlist)
	{
		if (u.x == a.x && u.y == a.y)
			u.can_logout = 0;
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
		block_all_users(*auladest);
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
					if (u.name == req.receiver && a.x == u.x && a.y == u.y)
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
			need_to_serve = 1;
		}
	}
	return (true);
}

void	check_robot(const srrg2_core_ros::PlannerStatusMessage::ConstPtr& info)
{
	rob.distance = info->distance_to_global_goal;
	cout << "[INFO] la distanza dal goal è: " << rob.distance << endl;
	if (rob.distance < 0.5)
	{
		cout << "[INFO] Il robot è arrivato a destinazione" << endl;
	}
}

void	callback_Server(const pick_delivery::c_to_s& msg)
{
	return ;
}

int	main(int argc, char **argv)
{
	ros::init(argc, argv, "server");
	
	ros::NodeHandle		node;
	ros::ServiceServer	servLog;
	ros::ServiceServer	servSend;
	ros::Publisher		pub_client;
	ros::Subscriber		sub_client;
	ros::Publisher		pub_robot;
	ros::Subscriber		sub_robot;

	servLog = node.advertiseService("/newclient", handle_client);
	servSend = node.advertiseService("/invio", handle_invio);

	pub_client = node.advertise<pick_delivery::s_to_c>("/s_to_c", 1000);
	sub_client = node.subscribe("/c_to_s", 1000, callback_Server);

	pub_robot = node.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal", 1000);
	sub_robot = node.subscribe("/planner_status", 1000, check_robot);
	aulelist = get_aule();

	while (ros::ok())
	{
		if (need_to_serve == 1)
		{
			cout << "[INFO] Devo servire " << (*sender).hash << endl;
			goal.header.stamp = ros::Time::now();
			goal.header.frame_id = "map";
			goal.pose.position.x = (*sender).x;
			goal.pose.position.y = (*sender).y;
			pub_robot.publish(goal);
			ros::spinOnce();
			need_to_serve = 0;
			rob.arrived = 0;
			rob.has_pack = !rob.has_pack;
		}
		if (rob.arrived == 1 && rob.has_pack == 0)
		{
			msc.sender = (*sender).hash;
			msc.receiver = (*receiver).hash;
			msc.msgs = "il robot ha preso in consegna il pacco";
			msc.msgr = "sta arrivando un pacco per te";
			pub_client.publish(msc);
			ros::spinOnce();
			need_to_serve = 1;
			sender = receiver;
			receiver = NULL;
			rob.has_pack = 1;
		}
		else if (rob.arrived == 1)
		{
			msc.sender = (*sender).hash;
			msc.receiver = "";
			msc.msgs = "é arrivato il pacco per te";
			pub_client.publish(msc);
			ros::spinOnce();
			sender = NULL;
			receiver = NULL;
			rob.has_pack = 0;
		}
		ros::spinOnce();
	}
	return (0);
}
