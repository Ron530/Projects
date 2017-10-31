#include<iostream>;
#include<stdio.h>;
#include"stack.h"
using namespace std;
int thesize = 0;
class Stack<char> stack1;
char arr[ 100 ];
class Stack<char> stack2;
int indicator = 1;
char char1, char2;



int main()
{
	//initialize arr to null

	for( int i = 0; i < 100; i++ )
	{
		arr[ i ] = '\0';

	}

	cout<< "Enter your text: \n\n";

	cin.getline( arr, 100 );

	// determine the array size
	for( thesize = 0; thesize < 100; thesize++)
	{
		if (arr[thesize] == '\0')
				break;		
			
	}

	// this pushes the characters starting from the top of the stack1
	for( int i = 0; i < thesize; i++)
	{

		//account for lower or capital case letters using ascii
		// determines if its a letter or not
		if( (arr[ i ] >= 97) && (arr[ i ] <= 122) )
		{
			arr[ i ] -= 32;
		}
		if( (arr[ i ] >= 65) && (arr[ i ] <= 90) )
		{
			stack1.push( arr[ i ] );
		}
	} 
	// this is for stack2
	for( int i = thesize - 1; i >=  0; i--)
	{
			
		if( (arr[ i ] >= 97) && (arr[ i ] <= 122) )
		{

			arr[ i ] -= 32;
		}

		if( (arr[ i ] >= 65) && (arr[ i ] <= 90) )
		{
		stack2.push( arr[ i ] );
		}
	} 
	// check it's a palindrome

	while( (stack1.isStackEmpty() == false) && (stack2.isStackEmpty() == false) )
	{

		//takes first character

		stack1.pop( char1 );


		stack2.pop( char2 );



		if( (char1 != char2) )
		{
			indicator = 0;
		

		} 
	} 

	cout << "\n";
	
	//prints to screen

	for( int i = 0; i < thesize; i++ )
	{
		cout << arr[ i ];

	} 
	if( indicator == 0 )
	{
		
		cout << " <--this is not a palindrome :(\n\n";
	}

	else if (indicator != 0)
	{
		
		cout << " <-- this is a palindrome!! :)\n\n";

	} 
} 
