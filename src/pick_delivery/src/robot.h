#include <stdlib.h>
#include <string>
using namespace std;

class robot
{
	public:
		int		status;
		float	distance;
		int		free;
		float	prevdist;
	robot(int s, int f)
	{
		status = s; //0 nothing assigned, 1 picking, 2 delivering
		free = f;
		distance = 0;
		prevdist = 0;
	}
};