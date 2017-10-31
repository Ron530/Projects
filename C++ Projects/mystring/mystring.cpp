    //all work done by: Ronney Aovida 7/6/2016

#include "mystring.h"
    #include <iostream> 
    #include <cstring>
    #include <cstdio>


using namespace std;


//The default constructor should set the object to represent an empty string.
MyString::MyString() {
	
	size = 0;
  String = new char[1];
  *String = '\0';

}

//MyString(const char*)-- this is a conversion constructor.A c - string will be passed as a 
//parameter, and this constructor should set up the string object to store that string inside.
//This will enable type conversions from c - strings to MyString objects.
MyString::MyString(const char* str) {

  size = strlen(str)+1;
  String = new char[size];
  strcpy(String, str);

 

}

/*MyString(int ) -- this is a conversion constructor that should convert an integer value to a
string representation. For example, if the value 1234 is passed in, the MyString object should 
now store the same string data that would be represented by the c-string "1234"
Note that these last two constructors will allow automatic type conversions to take place -- in 
this case, conversions from int to MyString and from c-style strings to type MyString -- when 
appropriate. This makes our operator overloads more versatile, as well. For example, the 
conversion constructor allows the following statements to work (assuming appropriate 
definitions of the assignment operator and + overloads described later):*/
MyString::MyString(int num) {

  char i[100];
  sprintf(i, "%d", num);
  String = new char[strlen(i) + 1];
 strcpy(String, i);

}

/*Automatics 
Since dynamic allocation is necessary, you will need to write appropriate definitions
of the special functions (the "automatics"):  destructor, copy constructor, assignment
operator.  The destructor should clean up any dynamic memory when a MyString object is
deallocated.  The copy constructor and assignment operator should both be defined to make 
a "deep copy" of the object (copying all dynamic data, in addition to regular member data),
using appropriate techniques.  Make sure that none of these functions will ever allow memory 
"leaks" in a program. */
MyString::MyString(const MyString& str) {

  String = new char[strlen(str.String) + 1];
  strcpy(String, str.String);

}





//Destructor that deletes the data in the string buffer
MyString::~MyString() {

  delete [] String;

}

/*Standard accessors 
getLength should return the length of the stored string (i.e. number of characters). For 
example, "Hello" has 5 characters 
getCString should return the actual stored data as a c-string (i.e. null-terminated char 
array) */
const char* MyString::getCString() const {


	return String;

}
int MyString::getLength() const {

	return size;

}




/*operator << -- insertion operator. This should print out the data from the MyString object, 
using the standard insertion operator syntax. There should be no extra formatting -- only the
string stored in the object is printed (no newlines, extra spacing, etc). */
ostream& operator<< (ostream& out, const MyString& str) {
 

  out << str.String;
  return out;
}

/*operator >> -- extraction operator. This should read a string from an input stream. 
This operator should ignore any leading white space before the string data, then read
until the next white space is encountered. Prior data in the MyString object is discarded. 
Note: Just like the operator>> for c-strings, this will only read one word at time.*/
istream& operator>> (istream& in, MyString& str) {

	char* arr = new char[1000];
	in >> arr;
	str = MyString(arr);
	delete [] arr;
	return in;
	
}
/*getline function. This should read a string from an input stream. This operator should 
read everything from the input stream (first parameter) into the MyString object (second
parameter) until the specified delimiter character is encountered. Notice that if the function 
is called with 3 parameters, the third parameter is the delimiter. If the function is called 
with 2 parameters, the delimiter is the newline '\n' by default. Prior data in the MyString
object is discarded.*/
istream& getline (istream& is, MyString& str, char delim ) {

	is.getline(str.String, str.size, delim);
	return is;

	
}

// Assignment operator of a MyString into another Mystring
MyString& MyString::operator=(const MyString& str) {


	if (&str != this)
	{
		int len = strlen(str.String);
		String = new char[len + 1];
		strcpy(String, str.String);
	}
	return *this;
}


//The following functions return a true of false statement accoridng to its correpsonding 
//mathematical symbol such as < for less than and > for greater than, or != for not equal to
bool operator!= (const MyString& str1, const MyString& str2) {

	return(strcmp(str1.String, str2.String) != 0 ? true : false);


}

bool operator== (const MyString& str1, const MyString& str2) {

	return(strcmp(str1.String, str2.String) == 0 ? true : false);

}

bool operator> (const MyString& str1, const MyString& str2) {
;

return(strcmp(str1.String, str2.String)> 0 ? true : false);
 

}

bool operator< (const MyString& str1, const MyString& str2) {

	return(strcmp(str1.String, str2.String) < 0 ? true : false);


}

bool operator<= (const MyString& str1, const MyString& str2) {

	return(strcmp(str1.String, str2.String) <= 0 ? true : false);
	

}

bool operator>= (const MyString& str1, const MyString& str2) {

	return(strcmp(str1.String, str2.String) >= 0 ? true : false);
	

}




//operator+ -- this should concatenate the two operands together and return a new MyString as a result.
MyString operator+(const MyString& str1, const MyString& str2) {

	
	MyString temp;
	int len = strlen(str1.String) + strlen(str2.String);
	temp.String = new char[len + 1];
	strcpy(temp.String, str1.String);
	strcat(temp.String, str2.String);
	return temp;
	

}

//operator+= -- this should concatenate the second operand onto the first one (i.e. changing the first one)
MyString &MyString::operator+=(const MyString& str) {
		char * temp = String;
		String = new char[strlen(String) + str.getLength() + 1];
		strcpy(String, temp);
		strcat(String, str.getCString());
		size = strlen(String);
		return *this;



	
}




/*There are two versions of substring -- a 1 parameter version and a 2-parameter version.
Both should return a MyString object that consists of a portion (or "substring") of the 
original string. Neither should change the calling object. The first parameter represents
the starting index of the substring. In the 2-parameter version, the second parameter gives 
the length of the substring to return (if the length is too long, default to the rest of the 
string ). In the 1-parameter version, the substring consists of the characters from the start 
index to the end of the string. 
*/
MyString MyString::substring(unsigned int index, unsigned int length) const{

  char * bored = new char[length + 1];
  if((index + length) > getLength()) {
    length = getLength() - index - 1;
  }
  bored[length] = '\0';
  for(int i = index; i < (length + index); i++) {
    bored[i - index] = String[i];
  }
  return bored;

}

MyString MyString::substring(unsigned int index) const {
	if (index >= getLength()+1)
	{
		return "\n";
	}
	else
	{
		int length = getLength() - index - 1;
		char * bored = new char[length + 1];
		bored[length] = '\0';
		for (int i = index; i < (length + index); i++) {
			bored[i - index] = String[i];
		}
		return bored;
	}

}

/*This function should search through the MyString to find the first occurence of the pattern
or substring given in the parameter. The function should return the first index where it was 
found, or it should return -1 if the pattern is NOT found. */
int MyString::indexOf(const MyString& s) const
{

	int temp = 0;
	bool isFound = false;


	for (int i = 0; i < getLength(); i++)
	{

		if (String[i] == s.String[0])
		{
			for (int j = 0; String[i + j] == s.String[j]; j++)
			{
				if (j == s.getLength() - 2)
				{
					isFound = true;
					temp = i;
					if (isFound)
						return temp;
					else
						return -1;
				}
			}
		}
		
		
	}
	if (isFound)
		return temp;
	else
		return -1;
	

	}

	

/*Both of these should return the character at the given index position. 
Note that the first one returns the character by reference, so it allows the 
slot to be changed. The second returns by const reference and is a const member
function and will run in read-only situations -- calls on const objects*/
char& MyString::operator[] (unsigned int index) {



	if (index >= getLength())
	{
		char *temp = new char[index];
		
		for (int i = 0; i < getLength(); i++)
			temp[i] = String[i];
		for (int i = getLength(); i < index - getLength()-1; i++)
			temp[i] = ' ';
		for (int i = 0; i < getLength(); i++)
			String[i] = temp[i];

		
		
		return String[index];
	}
	else
		return String[index];

}

const char& MyString::operator[] (unsigned int index) const {
	if (index >= getLength() - 1)
		return '\0';
	else
		return String[index];

}

/*This function should change the calling object by inserting the data from the second 
parameter AT the index given by the first parameter. If the index is out of bounds
(longer than the string's length), then just insert at the end. This function should 
also return the calling object. */
MyString& MyString::insert(unsigned int index, const MyString& str) {
  

	char * temp = new char[100];

	for (int i = index; i<(index + str.getLength()); i++)
		temp[i] = str[i];
	int k = 0;
	for (int i = index + str.getLength(); i<(strlen(String) + str.getLength()); i++) {
		temp[i] = String[k];
		k++;
	}

	delete[] String;
	String = temp;
  return *this;
  
}




