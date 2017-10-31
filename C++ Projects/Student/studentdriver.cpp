#include "englishstudents.h"
#include "mathstudents.h"
#include "historystudents.h"

#include <iostream>                         // for input and output
#include <iomanip>                          // for arithmatic
#include <fstream>                          // for file manipulation
#include <string.h>                         // for string manipulation
using namespace std;


/******************************************************************************/
/*                       Student Organizer Function                           */


void studentOrganizer(BaseClass** &student, ofstream &outfile, int n, 
                      string classname)
{
            outfile << fixed << showpoint << setprecision(2);
            outfile << classname << " Class" << endl;
            outfile << "Student                   Final    Final    Letter" 
                    << endl; 
            outfile << "Name                      Exam     Avg      Grade" 
                    << endl; 
            outfile << "---------------------------------------------------" 
                    << endl;

        // loop through the total number of students
	    for( int i = 0; i < n; i++ )
	    {       
            // determines if the student belongs in the class
		    if(student[ i ]->getCourseName() == classname)
		    {
			    outfile << setw(25) << left 
                                    << student[i]->getFirstName() + " " 
                                    + student[i]->getLastName()
				         << setw(8) << student[i]->finalExam() 
                                    << setw(8) << student[i]->finalGrade() 
                                    << student[i]->getLetterGrade() << endl; 
		    } // end of if(student[ i ]->getCourseName() == classname)
	    } // end of for( int i = 0; i < n; i++
} // end of function studentOrganizer(BaseClass** &student, ofstream &outfile, int n
  // string classname)

int main()
{
	// store the number of students
	int NumStudents;
	BaseClass** Student;

	// store 
	string fileName;

	// store last name
	string fname;
	string lname;
	string cname;

	// store the grade
	int grades;

	// store the number of grades in each class
	int count = 0;

	int g1 = 0,                   // initialize in order to store grades
	    g2 = 0,                   // initialize in order to store grades
        g3 = 0,                   // initialize in order to store grades
	    g4 = 0,                   // initialize in order to store grades
	    g5 = 0,                   // initialize in order to store grades
	    g6 = 0,                   // initialize in order to store grades
	    g7 = 0,                   // initialize in order to store grades
	    g8 = 0;                   // initialize in order to store grades

	// declare file
	ifstream infile;
	ofstream outfile;

	// prompt user to enter file name
	cout << "What is the name of the file you would like to open for input? ";

	// store user entered file name 
	cin >> fileName;

	// open file
	infile.open( fileName.c_str() );
        
     // loop to determine if the file has been opened
	while (!infile.is_open())
	{       
        // if the file is not open ask the user the name of the file again
		cout << "Please try again: ";
		cin >> fileName;
		infile.clear();
		infile.open( fileName.c_str() );
	} // end of while(!infile.is_open())	

	// prompt user to enter file name
	cout << "What is the name of the file you would like to open for output? ";

	// store user entered file name 
	cin >> fileName;

	// open file
	outfile.open( fileName.c_str() );
         
    // loop to determine if the file has been opened
	while (!outfile.is_open())
	{
        // if the file is not open ask the user the name of the file again 
		cout << "Please try again: ";
		cin >> fileName;
		outfile.clear();
		outfile.open( fileName.c_str() );
	} // end of while (!outfile.is_open())	

	// read in the number of students
	infile >> NumStudents;

	// create a dynamic array of student objects
	Student = new BaseClass*[NumStudents];  

	// main control structure to read in student information
	for( int i = 0; i < NumStudents; i++ )
	{
		infile.ignore(1);

		// read in last name and stop at comma
		getline( infile, lname, ',' );

		// read in first name and stop at new line character
		getline( infile, fname, '\n');

		// read in the name of the course and stop at blank space
		getline( infile, cname, ' ' );
 
        // if statements determine how many grades to expect when reading in
		if( cname == "English" )
		{
			count = 4;
		}
		if( cname == "Math" )
		{
			count = 8;
		}
		if( cname == "History" )
		{
			count = 3;
		}
		
		// read in the grades
		switch(count)
		{
			case 3:
				infile >> g1 >> g2 >> g3;
				cout << g1 << g2 << g3 << endl;
				break;
			case 4:
				infile >> g1 >> g2 >> g3 >> g4;
				cout << g1 << g2 << g3 << g4 << endl;
				break;
			case 8:
				infile >> g1 >> g2 >> g3 >> g4 >> g5 >> g6 >> g7 >> g8;
				cout << g1 << g2 << g3 << g4 << g5 << g6 << g7 << g8 << endl;
				break;
		} // end switch(count) 

		if( cname == "English" )
		{
			cout << "English" << endl;
			Student[ i ] = new englishStudents(cname, fname, lname, g1, g2, g3, g4 );
		}
		if( cname == "Math" )
		{
			cout << "Math" << endl;
			Student[ i ] = new mathStudents(cname, fname, lname, g1, g2, g3, g4, g5, g6, g7, g8 );
		}
		if( cname == "History" )
		{
			cout << "History" << endl;
			Student[ i ] = new historyStudents(cname, fname, lname, g1, g2, g3 );
		}
	} // end for( int i = 0; i < NumStudents; i++ )


	// close file
	infile.close();

    // calls the studentOrganizer function to print student information to a  file by class
	studentOrganizer(Student, outfile, NumStudents, "English");
	outfile << endl;
	studentOrganizer(Student, outfile, NumStudents, "Math");
	outfile << endl;
	studentOrganizer(Student, outfile, NumStudents, "History");
	outfile << endl;

return 0;
}
