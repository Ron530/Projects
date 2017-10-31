#include <iostream>
using namespace std;

class MyString
{
  friend ostream& operator<< (ostream& , const MyString& );
  friend istream& operator>> (istream& , MyString& );
  friend istream& getline (istream& , MyString& , char delim = '\n');

  friend MyString operator+ (const MyString& , const MyString& );

  friend bool operator< (const MyString& , const MyString& );
  friend bool operator> (const MyString& , const MyString& );
  friend bool operator<=(const MyString& , const MyString& );
  friend bool operator>=(const MyString& , const MyString& );
  friend bool operator==(const MyString& , const MyString& );
  friend bool operator!=(const MyString& , const MyString& );

public:
  MyString();				// empty string
  MyString(const char* );		// conversion from c-string
  MyString(int );			// conversion from int
  ~MyString();				// destructor
  MyString(const MyString& );		// copy constructor
  MyString& operator=(const MyString& );   // assignment operator

  MyString& operator+=(const MyString& );  // concatenation/assignment

  // bracket operators to access char positions
  char& operator[] (unsigned int index);
  const char& operator[] (unsigned int index) const;

  // insert s into the string at position "index"
  MyString& insert(unsigned int index, const MyString& s);

  // find index of the first occurrence of s inside the string
  //  return the index, or -1 if not found
  int indexOf(const MyString& s) const;
  
  int getLength() const;		// return string length
  const char* getCString() const;	// return c-string equiv

  MyString substring(unsigned int , unsigned int ) const;
  MyString substring(unsigned int ) const;

 

private:
	unsigned int size;
	char * String;
	
  // declare your member data here


};
