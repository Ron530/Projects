//Work done by Ronney Aovida

#include <iostream>          
using namespace std;




class Mixed
{
	
	friend Mixed operator+(const Mixed& x,const Mixed& y);
	friend Mixed operator-(const Mixed& x, const Mixed& y);
	friend Mixed operator/(const Mixed& x, const Mixed& y);
	friend Mixed operator*(const Mixed& x, const Mixed& y);
	friend bool operator==(const Mixed& x, const Mixed& y);
	friend bool operator!=(const Mixed& x, const Mixed& y);
	friend bool operator<(const Mixed& x, const Mixed& y);
	friend bool operator<=(const Mixed& x, const Mixed& y);
	friend bool operator>(const Mixed& x, const Mixed& y);
	friend bool operator>=(const Mixed& x, const Mixed& y);

	friend ostream& operator << (ostream& stream, Mixed& fraction);
	friend istream& operator >> (istream& stream, Mixed& fraction);
	
public:
	Mixed(const int integer, const int numerator, const int 
denominator);
	Mixed(int integer=0);
	double Evaluate();
	int gcd(int numer,int denom)const;
	void ToFraction();
	void Simplify();
	bool Set(const int integer, const int numerator, const int 
denominator);
	Mixed operator++ ();
	Mixed operator-- ();
	Mixed operator++ (int);
	Mixed operator-- (int);
	
private:
	int INT;
	int numer;
	int denom;

}; 
