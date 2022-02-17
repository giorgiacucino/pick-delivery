#include <ros/ros.h>
#include "pick_delivery/login.h"
#include "pick_delivery/invio.h"
#include "pick_delivery/notifica.h"
#include <list>
#include "aula.h"
#include <cstdlib>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;
string					name;
string					aulaclient;
string					aulainvio;
string					receiver;
int						reserved = 0;
list<aula>				aulelist;
int						scelta;
string					in;
pick_delivery::login	msglog;
pick_delivery::invio	msg2send;
ros::ServiceClient		SClog;
ros::ServiceClient		SCsend;
ros::ServiceServer		notifyServer;
int 					logged = 0;

void	mostra_aule(list<aula> aulelist)
{
	for (auto& a : aulelist)
	{
		cout << a.name << endl;
	}	
}
bool	handle_notifica(pick_delivery::notifica::Request &req, pick_delivery::notifica::Response &res)
{
	if ((req.auladest == "") && (req.user == name))
	{
		cout << req.msg << endl;
		scelta = 0;
		res.picked = 2;
	}
	else if (req.auladest == aulaclient)
	{
		cout << req.msg  << "(ENTER per ritiralo)" << endl;
		scelta = 0;
		res.picked = 0;
	}
	return (true);
}

void	scegli()
{
	cout << endl;
	cout << "Cosa vuoi fare?" << endl;
	cout << "(1) Inviare un pacco ad un'altra aula" << endl;
	cout << "(2) Spostarti in un'altra aula" << endl;
	cout << "(3) Controllare se è arrivato un pacco" << endl;
	cout << "(4) Uscire" << endl;
	cout << "inserisci qui il numero: ";
	cin >> scelta;
	if (scelta == 1)
	{
		cout << endl;
		cout << "Le aule a cui puoi inviare un pacco sono:" << endl;
		mostra_aule(aulelist);
		cout << endl;
		cout << "A quale aula vuoi inviarlo?" << endl;
		cin >> aulainvio;
		cout << "Vuoi inviarlo a qualcuno in particolare nell'"<< aulainvio << "? (0 per non specificare)" << endl;
		cin >> receiver;
		msg2send.request.sender = name;
		msg2send.request.aula = aulainvio;
		msg2send.request.receiver = receiver;
		int ok;

		ok = 0;
		while (!ok)
		{
			if (SCsend.call(msg2send))
			{
				if (msg2send.response.serv_resp == 1)
				{
					ok = 1;
					cout << "Il pacco può essere inviato, aspetta che il robot lo venga a ritirare" << endl;
				}
				else if (msg2send.response.serv_resp == 2)
				{
					cout << "Il servizio è momentaneamente occupato, riprova più tardi" << endl;
					ok = 2;
				}
				else if (msg2send.response.serv_resp == 3)
					cout << "L'aula che hai inserito non è valida, riprova" << endl;
				else if (msg2send.response.serv_resp == 4)
					cout << "L'utente a cui vuoi inviare il pacco non esiste o non si trova nell'" << aulainvio << ", riprova"<< endl;
				if (ok == 0)
				{
					cout << "A quale aula vuoi inviarlo?" << endl;
					cin >> aulainvio;
					cout << "Vuoi inviarlo a qualcuno in particolare nell'"<< aulainvio << "? (0 per non specificare)" << endl;
					cin >> receiver;
					msg2send.request.sender = name;
					msg2send.request.aula = aulainvio;
					msg2send.request.receiver = receiver;
				}
			}
			else 
				ROS_INFO("Failed to call service");
		}
	}
	else if (scelta == 2)
	{
		int	ok;
		
		ok = 0;
		while (!ok)
		{
			cout << endl;
			cout << "Attualmente sei nell'"<< aulaclient << ". Le aule disponibili sono" << endl;
			mostra_aule(aulelist);
			cout << "Dove vuoi andare? ";
			cin >> aulaclient;
			msglog.request.name = name;
			msglog.request.aula = aulaclient;
			msglog.request.type_service = 2;
			if (SClog.call(msglog))
			{
				cout << "Ti sei spostat* nell'"<< msglog.response.serv_resp <<"." << endl;
				ok = 1;
			}
			else
				ROS_INFO("Sembra che ci sia stato un errore. Controlla il nome dell'aula!");
		}
	}
	else if (scelta == 3)
	{
		return ;
	}
	else if (scelta == 4)
	{
		msglog.request.name = name;
		msglog.request.type_service = 0;
		if (SClog.call(msglog))
		{
			cout << endl;
			cout << "Ciao "<< name <<"." << msglog.response.serv_resp << endl;
			return ;
		}
		else
		{
			ROS_INFO("Aspetta! Sembra che ci sia un pacco per te in arrivo");
			//scelta = 3;
		}
	}
	else
		{
			cout << endl;
			cout << "Scelta non valida! Controlla il numero che hai inserito" << endl;
		}
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "client", ros::init_options::AnonymousName);

	ros::NodeHandle		node;

	SClog = node.serviceClient<pick_delivery::login>("/newclient");
	SCsend = node.serviceClient<pick_delivery::invio>("/invio");
	notifyServer = node.advertiseService("/notifica", handle_notifica);

	aulelist = get_aule();

	cout << "Benvenuto al Diag! Digita il tuo username: ";
	cin >> name;
	msglog.request.name = name;
	msglog.request.type_service = 1;
	if (SClog.call(msglog))
	{
		cout << "Ciao " << msglog.response.serv_resp << "! Attualmente sei nell'atrio. Le aule disponibili sono:" << endl;
		mostra_aule(aulelist);
		name = msglog.response.serv_resp;
	}
	else
	{
		ROS_ERROR("Failed to call service");
		return (1);
	}

	while (!logged)
	{
		cout << "Per accedere ai nostri servizi devi fare il login in una delle stanze. Dove vuoi andare?" << endl;
		cin >> aulaclient;
		msglog.request.name = name;
		msglog.request.aula = aulaclient;
		msglog.request.type_service = 2;
		if (SClog.call(msglog))
		{
			cout << "Attualmente sei nell'"<< msglog.response.serv_resp <<"." << endl;
			logged = 1;
		}
		else
		{
			ROS_INFO("Sembra che ci sia stato un errore. Controlla il nome dell'aula!");
		}
	}
	scegli();
	while (scelta == 3 || scelta == 1)
	{
		cout << endl;
		cout << "Aspettando il robot..." << endl;
		ros::Duration(10).sleep();
		ros::spinOnce();
		if (scelta == 3)
		{
			cout << "Vuoi ancora aspettare? (y/n)" << endl;
			cin >> in;
			if (in == "n")
				scelta = 0;
		}
		if (scelta == 0)
			scegli();
	}
	return (0);
}