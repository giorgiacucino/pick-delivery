#include <stdlib.h>
#include <string>
using namespace std;

class robot
{
	public:
		string	status;
		float	distance;
		int		free;
		int		arrived;
		int		has_pack;
	robot(string s, int f)
	{
		status = s;
		free = f;
		distance = 0;
		arrived = 0;
		has_pack = 0;
	}
};