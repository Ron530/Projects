#ifndef MATHSTUDENT_H
#define MATHSTUDENT_H

#include "baseclass.h"
#include <stdlib.h>

class mathStudents: public BaseClass
{


public:

	mathStudents();
	mathStudents(string className, string givenName, string sirName, int q1, 
                     int q2, int q3, int q4, int q5, int t1, int t2, int f );

	double finalGrade();
	int finalExam();

protected:

	int QuizAverage;
	int TestOne;
	int TestTwo;
	int FinalExam;

};
