// Work done by Ronney Aovida
// 6/03/16
#include <iomanip>
#include <iostream>
#include "date.h"
using namespace std;



Date::Date(int m,int d,int y)  // constructor
{

SetFormat('D');
// default format
Set(m,d,y);
  
}

Date::Date()  //constructor
{
SetFormat('D');

	day=1;
	month=1;
	year=2000;

}


int Date::Compare(const Date& d)const  // this function will compare two objects and return a 1,-1 or 0 depending on which objects 
					//date is larger.smaller or equal.
{
int temp;
   if (GetYear()<d.year)
 	{ return -1;
	temp=-1;}
   else if (GetYear()>d.year) 
	{return 1;
	temp=1;}
   else if (GetMonth()<d.month) 
	{return -1;
	temp=-1;}
   else if (GetMonth()>d.month)
	 {return 1;
	temp=1;}
   else if (GetDay()<d.day)
	{ return -1;
	temp=-1;}
   else if (GetDay()>d.day)
	{return 1;
	temp=1;}
   else
   	{return 0;
	temp=0;}

cout << "comparison is: " << temp << endl;;
}


	
void Date:: Increment(int numDays)		//This function will add a certain amount of days to the current date, dtermined 
						//by the user.
{


int temp[]={0,31,28,31,30,31,30,31,31,30,31,30,31};  // this initializes the number of days in months. ex: [1]=january 31 days
bool leapyear = (year % 4 ==0 && year%100 !=0) || (year % 400==0); //this takes leapyear into account

if (leapyear)
{ temp[2]= 29;}	// sets the value of february to 29 if leapyear

if ((day+numDays) <= temp[month]) // adds days to current days but doesnt change month or year
{ day=day +numDays; }

 	
while ((day+numDays) > temp[month])	// this takes into account the summation of the days required surpass months or years
	{
		

		if((day+numDays)>temp[month])
		{
			numDays=(numDays-(temp[month]-day)-1);
			month= month +1;
			day=1;
		} 


		 if(month==12 && (day+numDays)>temp[month])
                { 
                numDays= (numDays-(temp[month]-day)-1);
                day=1;  
                year= year+1;
                month=1;
                
                }

		if((day+numDays)<=temp[month])
		{
			day = day + numDays;
		break;} 

	}



}






void Date::Input()    // takes keyboard monkey input and sets the date to it
{

do {

cout << "enter the month/day/year (this message will repeat until input is valid)" << endl;
cin >> month >> day >> year;



}while (Set(month,day,year)==false); 	// repeats the message until the user enters the correct date
}


bool Date:: Set(int m, int d, int y) // this will make sure the date entered by the user is valid. will return true if it is valid 
					//and false if not.
{
bool temp;
temp=false;
month=m;
day=d;
year=y;
if (month==4 || month==6 || month ==9 || month==11)
{
        if (day<=30 && year>=1)
	{
                temp=true;
	}
}
else if (month==2)				// takes into account leapyear
{
	bool leapyear = (year % 4 ==0 && year%100 !=0) || (year % 400==0);

	if (leapyear)
      		{
			if (day<=29 && year>=1)
			temp=true;
	      	}
	
	 else
		{	if (day<=28  && year>=1)
			temp=true;
		}

}
else if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)
{
	if (d<=31 && y>=1)
	temp=true;
}


if (temp==false) 	// if false, sets the date to default
{
day=1;
month=1;
year=2000;
}

return temp;
}



void Date::Show()const    // this simply prints out the object date to screen, taking format into account
{

string temp[]= {"Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Nov","Dec"};  // sets temp to the values for the 
											//printing of the month without numbers.
										
 // capture current output stream settings
   int oldprecision = cout.precision();
   char oldfill = cout.fill();
   ios_base::fmtflags oldflags = cout.flags();


switch(setformat)
{
case 'D':
	 {
	cout << GetMonth() <<"/" <<  GetDay() <<"/" <<  GetYear() << endl; 
	break;
	}
case 'T':
	{
	cout <<fixed << setw(2) << setfill('0')  <<  GetMonth() << "/";
        cout <<setw(2)<<setfill('0') << GetDay() << "/" ;
	cout << setw(2) << setfill('0')<< GetYear()%100 << endl;
	break;
	}
case 'L':
	{
	
	cout << temp[GetMonth()-1] << " " << GetDay() << "," << GetYear() << endl;
	break;
	}
default: { cout << "idk what happened.." << endl;}


}

// PUT THINGS BACK THE WAY THEY WERE WHEN I FOUND THEM
   cout.precision(oldprecision);	// restore old precision setting
   cout.fill(oldfill);			// restore old fill char setting
   cout.flags(oldflags);		// restore all prior format flags
}

bool Date::SetFormat(char f)    // This changes the format according to the users call to either D,T or L
{
	if( (f == 'D') || (f == 'T') || (f == 'L') )
	{
		setformat = f;
		return true;

	} // end bool Date::SetFormat

	return false;

}

int Date::GetMonth()const  // returns the month
{
return month;
}
int Date::GetDay()const  // returns the day
{
return day;
}
int Date::GetYear()const  // returns the year
{
return year;
}
