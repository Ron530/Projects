// Work done by Ronney Aovida
// 5/25/16

#include <iostream>
#include "diamond.h"
using namespace std;



Diamond::Diamond(int s,char b,char f)  //The constructor for Diamond class
{

        size= s;
        border= b;
        fill= f;        

        if (size<1)     //error checking to make sure the user is within the 1-39 range
        { size=1;}
        if (size>39)
        { size= 39;}

}


void Diamond::Draw()        //Draws a diamond of certain size determined by values of 
			    //size,border,fill.
{ 
 

    for (int i=0; i<=size-2; i++)   //  creates the space for the first border character to 
				    //follow, determined by size
    {
      cout<<" "; 
    }
    
    cout<<border<<"\n";         //prints out the first border char
    
    int v=1;
    
    for ( int i=0; i<=size-1; i++)  // creates the first half of the diamond (a triangle)
    {
      if (i!=0)
      {
    
         for (int j=size-1; j>i; j--)  // iterates the spacing and prints a border variable at 
				       //the end
         {
            cout<<" ";
         }
        
         cout<< border << " ";
      }
    
        if (i>0)     
        {
            for ( int n=2; n<=v; n++)  // this will iterate the filler for the diamond depending 
				       //on size
            {
                cout<<fill << " ";
            }
            
            v+=1;
            cout<<border<<"\n";  // prints out a border char after the last filler char
        }

    }

 v-=2;   // devalue the iterator variable for the filler

  for (int i=0; i<=size-2; i++)     // this loop will repeat what the above loop did but only in 
			 	    //reverse
  {  
      
      if (i!=size-2)
      {
         for (int j=0; j<=i; j++)
         {
              cout<<" ";
         }

        cout<<border<<" ";
      
      }
                      
    for (int n=2; n<=v; n++)
    {
      cout<<fill<<" ";
    }
    
    v-=1;

    if (i!=size-2)
    {
      cout<<border<<"\n";
    }
 

  }
  
 for (int i=0; i<=size-2; i++)
 {
     cout<<" ";
 }

if (size!=1)
    cout<<border<<"\n"; 
    
}

int Diamond::GetSize() // returns the size of the rhombus
{

    return size;

}

int Diamond::Perimeter() // returns the parameter of the rhombus
{

        return (size * 4);

}

double Diamond::Area() // returns the area of the rhombus
{
        return (sqrt(3)/2) * size * size;
}

int Diamond::Grow() // increases the size of the diamond by one
{
        if (size< 39)
        {size= size+1;
        return (size);}
}
int Diamond::Shrink() // decreases the size of the diamond by one
{
        if (size>1)
        {size= size-1;
        return (size);}
}


char Diamond::SetBorder(char bo) // changes the value of border to whatever the user chooses
{
        if (bo>=33 && bo<=126) 
        {border=bo;}
        else
        {border= '#';}
}

char Diamond::SetFill(char fi) // changes the value of fill to whatever the user chooses
{
        if (fi>=33 && fi<=126)
        {fill=fi;}
        else
        {fill='*';}
}

void Diamond::Summary() // provides the size, parameter, area and visual of the diamond
{
    cout << "size of diamond's side = " << GetSize() << " units." << endl;
    cout << "Perimeter of diamond = " << Perimeter() << " units." << endl;
    cout << "Area of diamond = " << Area() << " units." << endl;
    cout << "Diamond looks like:" << endl;
    Draw();

}

