#include "mathstudents.h"

const double QUIZAVERAGE  = .15,    // 15% of the total grade
	     TESTONE          = .25,    // 25% of the total grade
	     TESTTWO          = .25,    // 25% of the total grade
	     FINALEXAMPERCENT = .35;    // 35% of the total grade


/******************************************************************************/
/*                       Constructor                                          */  


mathStudents::mathStudents(string className, string givenName, string sirName,
                           int q1, int q2,int q3,int q4,int q5, int t1, int t2, 
                           int f)
{
	courseName  = className;
	firstName   = givenName;
	lastName    = sirName;
	QuizAverage = ((q1+q2+q3+q4+q5)/5)*.15;  // caclulates the quiz average
                                             // and assigns it to quiz 
                                             // average
	TestOne     = t1; 
	TestTwo     = t2;
	FinalExam   = f;
} // end englishStudents::englishStudents( int a, int p, int m, int f )

/******************************************************************************/
/*                       Constructor                                          */  
/*
Description: calculate final grade
*/

double mathStudents::finalGrade()
{
	return( QuizAverage * QUIZAVERAGE + TestOne * TESTONE + TestTwo 
                * TESTTWO + FinalExam * FINALEXAMPERCENT );

} // end BaseClass::finalGrade() 

/******************************************************************************/
/*                       Final Exam Function                                  */ 
/*
Description: returns final exam grade
*/
 
int mathStudents::finalExam()
{
	return FinalExam;
}
