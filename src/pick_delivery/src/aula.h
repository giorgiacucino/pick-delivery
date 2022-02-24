#include <stdlib.h>
#include <string>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <list>
using namespace std;

class aula
{
    public:
        string name;
        float x;
        float y;
		int	called;
        aula(string s, float tx, float ty)
		{
			name = s;
			x = tx;
			y = ty;
			called = 0;
		};
        bool operator==(const aula& a)
		{
            if (a.name == this->name) return true;
            return false;
        }
};

list<aula> get_aule(void)
{
	list<aula>	aulelist;
	string 		s;
	float		x;
	float		y;
	ifstream 	file;
		
	file.open("/home/me/lab/src/pick_delivery/world.txt");
	if (!file) {
		cout << "Unable to open file" << endl;
		exit(1);
	}
	while (file >> s >> x >> y )
	{
		aula a = aula(s, x, y);
		aulelist.push_back(a);
	}
	return (aulelist);
}
