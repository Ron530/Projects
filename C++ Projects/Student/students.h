#include <iostream>
#include <string>
using namespace std;


enum subject
{
	THEATRE,
	BIOLOGY,
	COMPUTER
	
};


class Student
{
public:
	Student();
	Student(const string,const string);
	virtual double getfinal()=0;
	virtual subject getsubject() const {};
	string getlastname() const;
	string getfirstname() const;
	virtual double solve() = 0;
	virtual void storage(istream &) = 0;

private:
	subject thesubject;
	string firstname;
	string lastname;
	
	
};

class Theatre: public Student
{
public:
	Theatre(const string,const string);
	double solve();
	subject getsubject() const;
	double getfinal();
	void storage(istream &);
	
private:
	double Participation, midterm, final;
	

};

class Biology: public Student
{
public:
	
	Biology(const string,const string);
	double solve();
	subject getsubject() const;
	double getfinal();
	void storage(istream &);
private:
	double labgrade,test1,test2,test3, final;

};

class computer: public Student
{
public:
	computer(const string,const string);
	subject getsubject() const;
	double solve();
	double getfinal();
	void storage(istream &);
private:
	double q1,q2,q3,q4,q5,q6,test1,test2,final;
};

