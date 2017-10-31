#ifndef ENGLISHSTUDENT_H
#define ENGLISHSTUDENT_H

#include "baseclass.h"
#include <stdlib.h>

class englishStudents : public BaseClass
{
public:
	englishStudents();
	englishStudents(string className, string givenName, string sirName, 
                        int a, int p, int m, int f );

	 double finalGrade();
	 int finalExam();

protected:

	int Attendance;
	int Project;
	int Midterm;
	int FinalExam;
};

