#ifndef BASECLASS_H
#define BASECLASS_H

#include <string>

using namespace std;

class BaseClass
{

protected:
	string courseName;
	string firstName;
	string lastName;

public:

	// default constructor
	BaseClass();

	// constructor
	BaseClass( string className, string givenName, string sirName, 
		       int grades );

	// virtual function final grade
	virtual double finalGrade()=0;
	// virtual function final exam
	virtual int finalExam()=0;
	char getLetterGrade();

	string getFirstName();
	void setFirstName( string givenName );
	string getCourseName();
	void setCourseName( string className );
	string getLastName();
	void setLastName( string sirName );
	string getGrades();
	void setGrades( string scores );

};

