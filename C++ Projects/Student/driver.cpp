#include <iostream>
#include "students.h"
#include <iomanip>
#include <fstream>
#include <string>
#include <cctype>
using namespace std;


//THE ONLY ERROR CURRENTLY IS THAT ITS HAVING A HARD TIME READING IN "COMPUTER SCIENCE"
// OTHERWISE, NO OTHER ERRORS WERE FOUND






int main(void)
{
	
	int thesize = 0;
	int currentsize = 0;
	string iName ="", oName="";
	//ask for the input file name
	cout << "Please enter the name of the input file." << endl;
	cout << "Filename: "; 
	cin >> iName;
	//ask for the output file name;
	cout << "Please enter the name of the output file." << endl;
	cout << "Filename: ";
	cin >> oName;
	ifstream iFile;
	iFile.open(iName.c_str());
	//read the number of students in the list
	iFile >> thesize;
	//get rid of delim
	iFile.ignore(256, '\n');
	Student ** pointy = new Student*[thesize+1];
	for(int i = 0; i < thesize; i++)
	{		
			char* char2;
			char2 = new char[1];
			int v = 0;
			char x;
			//read in the last name stopping once hit the comma ','
			x = iFile.get();
			while(x != ',')
			{
				char2[v] = x;
				v++;
				x = iFile.get();
			}
		// reads in the first name once the last name is read
			char* char1;
			char1 = new char[1];
			int vv = 0;
			char xx;
			//Ignore the white space
			iFile.ignore(1);
			// resets the char holder		
			xx = iFile.get();
			while(xx != '\n')
			{
				
				char1[vv] = xx;
				vv++;
				xx = iFile.get();
				
			}
		
			//read the subject 
			//create a new student under that subject
			string shtring;
			iFile >> shtring;
				if(shtring == "Computer Science")				
					pointy[currentsize] = new computer(char1,char2);
				else if(shtring == "Biology")
					pointy[currentsize] = new Biology(char1,char2);
				else if(shtring == "Theatre")
					pointy[currentsize] = new Theatre(char1,char2);
				else
					cout << "something went wrong..CRAP" << endl;

				pointy[currentsize]->storage(iFile);
				iFile.ignore(256,'\n');
				currentsize= currentsize +1;
	}

	
	iFile.close();

	// open up the output file
	ofstream oFile;
	oFile.open(oName.c_str());

	// print the output


	oFile << "Student Grade Summary" << endl;
	oFile << "---------------------" << endl << endl;
	oFile << "THEATRE CLASS" << endl << endl;
	oFile << "Student                       Final     Final     Letter" << endl;
	oFile << "Name                          Exam      Avg       Grade " << endl;
	oFile << "--------------------------------------------------------" << endl;
	for(int i = 0; i <thesize; i++)
	{
		if(pointy[i]->getsubject() == THEATRE)
		{
			string thename = pointy[i]->getfirstname() + ' ' + pointy[i]->getlastname();
			oFile << setw(31) << left << thename << setw(3) << right << pointy[i]->getfinal() 
			<< setw(11) << right << fixed << setprecision(2)  << pointy[i]->solve() 
			<< setprecision(0) << setw(11-2) << right << getgrade(pointy[i]->solve()) << endl;
		}
	}
	oFile << endl << endl;


	oFile << "BIOLOGY CLASS" << endl << endl;
	oFile << "Student                       Final     Final     Letter" << endl;
	oFile << "Name                          Exam      Avg       Grade " << endl;
	oFile << "--------------------------------------------------------" << endl;

	for(int i = 0; i <thesize; i++)
	{
		if(pointy[i]->getsubject() == BIOLOGY)
		{
			string thename = pointy[i]->getfirstname() + ' ' + pointy[i]->getlastname();

			oFile << setw(31) << left << thename 
			<< setw(3) << right << pointy[i]->getfinal() << setw(11) << right << fixed
				<< setprecision(2)  << pointy[i]->solve() << setprecision(0) 
			<< setw(11-2) << right << getgrade(pointy[i]->solve()) << endl;
		}
	}

	oFile<< endl << endl;
	
	oFile << "COMPUTER SCIENCE CLASS" << endl << endl;
	oFile << "Student                       Final     Final     Letter" << endl;
	oFile << "Name                          Exam      Avg       Grade " << endl;
	oFile << "--------------------------------------------------------" << endl;
	for(int i = 0; i <thesize; i++)
	{
		if(pointy[i]->getsubject() == COMPUTER)
		{
			string thename = pointy[i]->getfirstname() + ' ' + pointy[i]->getlastname();

			oFile << setw(31) << left << thename 
			<< setw(3) << right << pointy[i]->getfinal() << setw(11) << right << fixed
				<< setprecision(2)  << pointy[i]->solve() << setprecision(0) 
			<< setw(11-2) << right << getgrade(pointy[i]->solve()) << endl;
		}
	}


	oFile << "\n" << "OVERALL GRADE DISTRIBUTION" << endl << endl;
	oFile << "A:    " << endl;
	oFile << "B:    " << endl;
	oFile << "C:    " << endl;
	oFile << "D:    " << endl;
	oFile << "F:    " << endl;


	delete []pointy;
cout << "IT WORKED" << endl;





}

// this returns the face value of the grades as a letter
char getgrade(double agrade);
char getgrade(double agrade)
{
	if (agrade > 89)
		return 'A';
	else if (agrade > 79)
		return 'B';
	else if (agrade > 69)
		return 'C';
	else if (agrade > 59)
		return 'D';
	else
		return 'F';
}

