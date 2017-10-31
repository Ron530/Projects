#include "englishstudents.h"
#include <stdlib.h>

/******************************************************************************/
/*                       Constants                                            */

const double ATTENDANCEPERCENT = .1,
	         PROJECTPERCENT    = .3,
             MIDTERMPERCENT    = .3,
	         FINALEXAMPERCENT  = .3;

/******************************************************************************/
/*                       Constructor                                          */


englishStudents::englishStudents(string className, string givenName, 
                                 string sirName, int a, int p, int m, int f )
{
	courseName = className;
	firstName  = givenName;
	lastName   = sirName;
	Attendance = a;
	Project    = p;
	Midterm    = m;
	FinalExam  = f;

} // end englishStudents::englishStudents( int a, int p, int m, int f )

/******************************************************************************/
/*                       Final Grade Function                                 */
/*
Description: this function computes the students final grade
*/

double englishStudents::finalGrade()
{
	return( Attendance * ATTENDANCEPERCENT + Project * PROJECTPERCENT
		+ Midterm * MIDTERMPERCENT + FinalExam * FINALEXAMPERCENT );

} // end BaseClass::finalGrade() 

/******************************************************************************/
/*                       Final Exam Function                                  */
/*
Description: this function returns the students final exam grade
*/
int englishStudents::finalExam()
{
	return FinalExam;
}
