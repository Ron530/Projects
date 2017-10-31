
#ifndef HISTORYSTUDENT_H
#define HISTORYSTUDENT_H

#include "baseclass.h"
#include <stdlib.h>

class historyStudents : public BaseClass
{



public:

	historyStudents();
	historyStudents(string className, string givenName, string sirName, int t, 
                        int m, int f );

	double finalGrade();
	int finalExam();

protected:
	int TermPaper;
	int Midterm;
	int FinalExam;

};
