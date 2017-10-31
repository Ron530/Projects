//Work done by Ronney Aovida
// 5/25/16

#include <cmath>

class Diamond
{

public: 
	Diamond(int s,char b=35,char f=42);

	int GetSize();
	int Perimeter();
	double Area();
	int Grow();
	int Shrink();
	char SetBorder(char bo);
	char SetFill(char fi);
	void Draw();
	void Summary();

private:

int size;
char border, fill;
};
