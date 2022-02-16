#include <ros/ros.h>
#include "pick_delivery/login.h"
#include "pick_delivery/invio.h"
#include "pick_delivery/c_to_s.h"
#include "pick_delivery/s_to_c.h"
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
pick_delivery::login	msglog;
pick_delivery::invio	msg2send;
pick_delivery::c_to_s	msc;
int 					logged = 0;

void	mostra_aule(list<aula> aulelist)
{
	for (auto& a : aulelist)
	{
		cout << a.name << endl;
	}	
}

void	callback_Client(const pick_delivery::s_to_c& msg)
{
	return ;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "client", ros::init_options::AnonymousName);

	ros::NodeHandle		node;
	ros::ServiceClient	SClog;
	ros::ServiceClient	SCsend;
	ros::Publisher		pub_server;
	ros::Subscriber		sub_server;

	SClog = node.serviceClient<pick_delivery::login>("/newclient");
	SCsend = node.serviceClient<pick_delivery::invio>("/invio");
	pub_server = node.advertise<pick_delivery::c_to_s>("/c_to_s", 1000);
	sub_server = node.subscribe("/s_to_c", 1000, callback_Client);

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

	while (ros::ok())
	{
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
		cout << endl;
		cout << "Cosa vuoi fare?" << endl;
		cout << "(1) Inviare un pacco ad un'altra aula" << endl;
		cout << "(2) Spostarti in un'altra aula" << endl;
		cout << "(3) Uscire" << endl;
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
			msc.sender = name;
			msc.receiver = receiver;
			msc.auladest = aulainvio;
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
						pub_server.publish(msc);
					}
					else if (msg2send.response.serv_resp == 2)
					{
						cout << "Il servizio è momentaneamente occupato, riprova più tardi" << endl;
						ok = 2;
					}
					else if (msg2send.response.serv_resp == 3)
						cout << "L'aula che hai inserito non è valida, riprova" << endl;
					else if (msg2send.response.serv_resp == 4)
						cout << "L'utente a cui vuoi inviare il pacco non esiste o non si trova nell'aula" << aulainvio << ", riprova"<< endl;
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
			msglog.request.name = name;
			msglog.request.type_service = 0;
			if (SClog.call(msglog))
			{
				cout << endl;
				cout << "Ciao "<< name <<"." << msglog.response.serv_resp << endl;
				break ;
			}
			else
				ROS_INFO("Aspetta! Sembra che ci sia un pacco per te in arrivo");
		}
		else
		{
			cout << endl;
			cout << "Scelta non valida! Controlla il numero che hai inserito" << endl;
		}
	}
	return (0);
}