#include <stdlib.h>
#include <string>
using namespace std;

class user
{
    public:
        string	name;
		string	hash;
        float	x;
        float	y;
		int		dup;
		int		can_logout;
		int		called;
        user(string s, int d)
		{
			name = s;
			x = 0;
			y = 0;
			dup = d;
			can_logout = 1;
			hash = get_hash(s, d);
			called = 0;
		};
        bool operator==(const user& a)
		{
            if (a.hash == this->hash) return true;
            return false;
        }
		string get_hash(string s, int d)
		{
			std::string tmp = std::to_string(d);
			return (s + tmp);
		}
};
