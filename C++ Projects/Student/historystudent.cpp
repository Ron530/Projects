#include "historystudents.h"

/******************************************************************************/
/*                       Constants                                            */

const double TERMPAPER        = .25,   // 25% of the total grade
             MIDTERMPERCENT   = .25,   // 25% of the total grade 
             FINALEXAMPERCENT = .4;    // 40% of the total grade 


/******************************************************************************/
/*                       Constructor                                          */

historyStudents::historyStudents(string className, string givenName, 
                                 string sirName,int t, int m, int f)
{
	courseName = className;
	firstName  = givenName;
	lastName   = sirName;
	TermPaper  = t;
	Midterm    = m;
	FinalExam  = f;
} // end of historyStudents::historyStudents(string className, string givenName, 
  //                                 string sirName,int t, int m, int f)

/******************************************************************************/
/*                       Final Grade Function                                 */  
/*
description:calculate final grade
*/

double historyStudents::finalGrade()
{
	return( TermPaper * TERMPAPER + Midterm * MIDTERMPERCENT 
		+ FinalExam * FINALEXAMPERCENT );

} // end BaseClass::finalGrade() 

int historyStudents::finalExam()
{
	return FinalExam;
}
