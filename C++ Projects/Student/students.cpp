#include <iostream>
#include <string>
#include <iomanip>
#include <cctype>
#include "students.h"
#include <fstream>


using namespace std;

// default constructor
Student::Student()
{
	firstname=" ";
	lastname=" ";

}

// this takes in two strings that have the first and last name of student
Student::Student(const string First, const string Last)
{

	firstname = First;
	lastname = Last;

}

string Student::getfirstname() const
{
	return firstname;
}

string Student::getlastname() const
{
	return lastname;
}




// stores the grades into their respective variables
void Theatre::storage(istream &read)
{
	double P = 0
		, M = 0,
		F = 0;

	read >> P >> M >> F;

	Participation = P;
	midterm = M;
	final = F;
}

// default constructor for theatre
Theatre::Theatre(const string FN,const string LN):Student(FN,LN)
{
	Participation = 0;
	midterm = 0;
	final = 0;

}

subject Theatre::getsubject() const
{
	return THEATRE;
}
// returns the finalgrade for theatre
double Theatre::solve()
{
	double finalgrade = 0;

	finalgrade = (Participation * 0.40)  + (midterm * 0.25) + (final * 0.35);


	return finalgrade;
}


double Theatre::getfinal()
{
	return final;
}


// default contructor for biology
Biology::Biology(const string FN,const string LN):Student(FN,LN)
{
	labgrade = 0;
	test1 = 0;
	test2 = 0;
	test3 = 0;
	final = 0;

}
// stores grades into their respective variables
void Biology::storage(istream &read)
{
	double L = 0, F = 0, T1 = 0, T2 = 0, T3 = 0;
	read >> L >> T1 >> T2 >> T3 >> F;
	labgrade = L;
	test1 = T1;
	test2 = T2;
	test3 = T3;
	final = F;
}

subject Biology::getsubject() const
{
	return BIOLOGY;
}
// returns the finalgrade for biology
double Biology::solve()
{
	double finalgrade = 0;
	finalgrade = (labgrade * 0.25) + (test1 * 0.15) + (test2 * 0.15)+ (test3*0.15) +(final * 0.40);
	return finalgrade;
}





double Biology::getfinal()
{
	return final;
}


// default contructor for computer science
computer::computer(string FN, string LN):Student(FN,LN)
{

	q1, q2, q3, q4, q5, q6 = 0;
	test1 = 0;
	test2 = 0;
	final = 0;

}
// stored the grades into their respective variables
void computer::storage(istream &refFile)
{
	double F = 0, quiz1 = 0, quiz2 = 0, quiz3 = 0, quiz4 = 0, quiz5 = 0, quiz6 = 0; test1 = 0, test2 = 0;
	refFile >> quiz1 >> quiz2 >> quiz3 >> quiz4 >> quiz5 >> quiz6 >> test1 >> test2 >> F;
	q1 = quiz1;
	q2 = quiz2;
	q3 = quiz3;
	q4 = quiz4;
	q5 = quiz5;
	q6 = quiz6;
	test1 = test1;
	test2 = test2;
	final = F;
}

subject computer::getsubject() const
{
	return COMPUTER;
}
// returns final grade for computer sciences
double computer::solve()
{
	double finalgrade = 0;
	finalgrade = ( ((q1+q2+q3+q4+q5+q6) /6) * 0.30) + (test1 * 0.20) + (test2 * 0.20) + (final * 0.30);
	return finalgrade;
}


double computer::getfinal()
{
	return final;
}

