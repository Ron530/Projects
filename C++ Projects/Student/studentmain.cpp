#include "studentmain.h"

BaseClass::BaseClass()
{
}
/******************************************************************************/
/*                        Constructor                                         */
/*
Author: Claudius Christian
Date:  3/22/2013
Description: The constructor should take in four parameters, which allow the
course name, last name, first name, and grades to be set.
*/

BaseClass::BaseClass( string className, string givenName, string sirName, 
		      int grades )
{
	courseName = className;
	firstName  = givenName;
	lastName   = sirName;

} // end Register::Register( int registerID, double registerAmount ) 

/******************************************************************************/
/*                       Get Last Name Function                               */
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Gets the students last name
*/

string BaseClass::getLastName()
{

	return lastName;

} // end string BaseClass::getLastName() 

/******************************************************************************/
/*                       Set Last Name Function                               */
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Sets the students last name
*/

void BaseClass::setLastName( string sirName )
{
	lastName = sirName;

} // end void setLastName( string lastName )

/******************************************************************************/
/*                       Get First Name Function                              */  
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Gets the students first name                                      
*/

string BaseClass::getFirstName()
{

	return firstName;

} // end string BaseClass::getFirstName()

/******************************************************************************/
/*                       Set First Name Function                              */
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Sets the students first name
*/
void BaseClass::setFirstName( string givenName )
{
	firstName = givenName;

} // end void BaseClass::setFirstName( string givenName )

/******************************************************************************/
/*                       Get Course Name Function                             */  
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Gets the students course name                                      
*/

string BaseClass::getCourseName()
{
	return courseName;

} // end string BaseClass::getCourseName()

/******************************************************************************/
/*                       Set Course Name Function                             */
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Sets the course name
*/

void BaseClass::setCourseName( string CourseTitle )
{
	courseName = CourseTitle;

} // end void BaseClass::setCourseName( string CourseTitle )

/******************************************************************************/
/*                       Get Grades Function                                  */  
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Gets the students grades                                      
*/

string BaseClass::getGrades()
{
	return "";

} // end string BaseClass::getGrades()


void BaseClass::setGrades( string scores )
{
	
} // end void BaseClass::setGrades( string scores )

/******************************************************************************/
/*                       Get Letter Grade Function                            */  
/*
Author: Claudius Christian
Date:  3/22/2013
Description: Gets the students letter grade                                      
*/

char BaseClass::getLetterGrade()
{
	char grade;

	if (finalGrade() > 90)
	{
		grade = 'A';
	}

	else if (finalGrade() > 80)
	{
		grade = 'B';
	}

	else if (finalGrade() > 70)
	{
		grade = 'C';
	}

	else if (finalGrade() > 60)
	{
		grade = 'D';
	}

	else 
	{
		grade = 'F';
	}

	return grade;
}
