#include <ros/ros.h>
#include "pick_delivery/login.h"
#include "pick_delivery/invio.h"
#include "pick_delivery/notifica.h"
#include "pick_delivery/s_to_c.h"
#include "pick_delivery/c_to_s.h"
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
string					new_aula;
string					aulainvio;
string					receiver;
int						picking = 0;
int						need_to_wait = 0;
list<aula>				aulelist;
int						scelta = 0;
string					in;
pick_delivery::login	msglog;
pick_delivery::c_to_s	res;
pick_delivery::invio	msg2send;
ros::ServiceClient		SClog;
ros::ServiceClient		SCsend;
ros::Publisher			pub_server;
ros::Subscriber			sub_server;
int 					logged = 0;

void	waitcheck()
{
	cout << endl;
	cout << "Controllo se il robot è arrivato..." << endl;
	ros::spinOnce();
}

void	mostra_aule(list<aula> aulelist)
{
	for (auto& a : aulelist)
	{
		cout << a.name << endl;
	}	
}

void	handle_notifica(const pick_delivery::s_to_c::ConstPtr& m)
{	
	if (m->pd == 1 && m->user == name)
	{
		res.resp = 2;
		cout << "msg: " << m->msg << endl << flush;
	}
	else if (m->auladest == aulaclient && (m->user == name || m->user == "0") && m->pd == 2)
	{
		res.resp = 0;
		cout << "msg: " << m->msg << endl << flush;
	}
	pub_server.publish(res);
	ros::spinOnce();
	return ;
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
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "client", ros::init_options::AnonymousName);

	ros::NodeHandle		node;

	SClog = node.serviceClient<pick_delivery::login>("/newclient");
	SCsend = node.serviceClient<pick_delivery::invio>("/invio");

	pub_server = node.advertise<pick_delivery::c_to_s>("/ctos", 1000);
	sub_server = node.subscribe("/stoc", 1000, handle_notifica);

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

	while (ros::ok())
	{
		if (need_to_wait == 0)
		{
			scegli();
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
							need_to_wait = 1;
							picking = 1;
							ok = 1;
							cout << "Il pacco può essere inviato, aspetta che il robot lo venga a ritirare" << endl;
						}
						else if (msg2send.response.serv_resp == 2)
						{
							cout << "Il servizio è momentaneamente occupato, riprova più tardi" << endl;
							ok = 1;
						}
						else if (msg2send.response.serv_resp == 3)
							cout << "L'aula che hai inserito non è valida, riprova" << endl;
						else if (msg2send.response.serv_resp == 4)
							cout << "L'utente a cui vuoi inviare il pacco non esiste o non si trova nell'" << aulainvio << ", riprova"<< endl;
						if (ok == 0)
						{
							cout << "Vuoi provare a rinviarlo?" << endl;
							cin >> in;
							if (in == "n")
								break ;
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
					cin >> new_aula;
					msglog.request.name = name;
					msglog.request.aula = new_aula;
					msglog.request.type_service = 2;
					if (SClog.call(msglog))
					{
						cout << "Ti sei spostat* nell'"<< msglog.response.serv_resp <<"." << endl;
						aulaclient = new_aula;
						ok = 1;
					}
					else
						ROS_INFO("Sembra che ci sia stato un errore. Controlla il nome dell'aula!");
				}
			}
			else if (scelta == 3)
			{
				need_to_wait = 1;
				cout << "Controllo se il robot è arrivato..." << endl;
			}
			else if (scelta == 4)
			{
				msglog.request.name = name;
				msglog.request.type_service = 0;
				if (SClog.call(msglog))
				{
					cout << endl;
					cout << "Ciao "<< name <<"." << msglog.response.serv_resp << endl;
					return (0);
				}
				else
				{
					cout << "Aspetta! Sembra che il robot stia venendo da te" << endl;
					cout << "Vuoi davvero uscire? (y/n)" << endl;
					cin >> in;
					if (in == "y")
						return (0);
				}
			}
			else
			{
				cout << endl;
				cout << "Scelta non valida! Controlla il numero che hai inserito" << endl;
			}
		}
		ros::spin();
	}
	return (0);
}