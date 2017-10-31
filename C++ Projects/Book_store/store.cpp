//--------------- STORE.CPP ---------------
// The class definition for Store.
//
#include <iostream>
#include <cstring>  // for strcmp
#include "store.h"

using namespace std;

store::store()
{
	maxsize = 5;
  currentsize = 0; 
  booklist = new Book[maxsize];
}

store::~store()
// This destructor function for class Store
// deallocates the Store's list of Books
{
  delete [] booklist;
}

void store::addbook(const char* t, const char* a, Genre g, double p)
// insert a new book into the directory
{
  if (currentsize == maxsize)
    grow();

  booklist[currentsize++].Set(t, a, g, p);
}


void store::Find(const char* x) const
//  Display the Store's matches for a title or author.
{
  // Prompt the user for a name to be looked up

  char name[31];
  strcpy(name, x);

  int thisBook = findbook(name);
  if (thisBook != -1)
    booklist[thisBook].Display();

  int author = findauthor(name, true);

  if ((thisBook == -1) && (author == -1))
    cout << name << " not found in directory\n";
}



void store::showstore() const
{

	int oldprecision = cout.precision();
	ios_base::fmtflags oldflags = cout.flags();

  if (currentsize >= 1)
  {

	  cout <<left << setw(30) << "**Title**" << setw(20) << "**Author**" << setw(11) << "**Genre**\t" << "**Price**\n" ;


    for (int i = 0; i < currentsize; i++)
      booklist[i].Display();
  }
  else
    cout << "no books in inventory\n\n";

  cout << "Total Books = " << currentsize 
       << "\nMoney in the register = $";

  cout << fixed << showpoint << setprecision(2) << cashregister << endl;

  cout << '\n';

  cout.precision(oldprecision);
  cout.flags(oldflags);
}

void store::sell(const char* t)
// Sell a book from the store.
{
	char name[31];
	strcpy(name, t);

	int thisentry = findbook(name);

	if (thisentry == -1)
	{
		cout << *name << " not found in inventory\n";
		cout << "*no sale made*";
	}
	else
	{
		cashregister = cashregister + booklist[thisentry].GetPrice();
		// moves each element down one in the array

		for (int j = thisentry + 1; j < currentsize; j++)
			booklist[j - 1] = booklist[j];

		currentsize--;// Decrement the current number of entries.
		cout << "Entry removed.\n";

		if (currentsize < (maxsize - 5))// If the directory is too big, shrink it.
			reduce();
	}
}




double store::getregister()const
{
	return cashregister;
}


void store::setregister(double x)
// Set value of cash register
{
  cashregister = x;
}

void store::reduce()

{
  maxsize = maxsize - 5;

  cout << "** array resized to " << maxsize 
       << " allocated slots" << '\n';

  Book* newlist = new Book[maxsize];

  for (int i = 0; i < currentsize; i++)
    newlist[i] = booklist[i];

  delete [] booklist;
  booklist = newlist;
}


void store::grow()
// Double the size of the Store's bookList
// by creating a new, larger array of books
// and changing the store's pointer to refer to
// this new array.
{
	maxsize = currentsize + 5;// Determine a new size.

	cout << "** Array being resized to " << maxsize
		<< " allocated slots" << '\n';

	Book* newList = new Book[maxsize];// Allocate a new array.

	for (int i = 0; i < currentsize; i++)// Copy each entry into
		newList[i] = booklist[i];// the new array.

	delete[] booklist;// Remove the old array
	booklist = newList;// Point old name to new array.
}


int store::findbook(char* name) const
// Locate a name in the directory.  Returns the
// position of the entry list as an integer if found.
// and returns -1 if the entry is not found in the directory.
{
  for (int i = 0; i < currentsize; i++)// Look at each entry.
    if ((strcmp(booklist[i].GetTitle(), name) == 0))
      return i;// If found, return position and exit.

  return -1;// Return -1 if never found.
}

void store::showgenre(const Genre g) const
{
	double price = 0;
	int genreCount = 0;


	int oldprecision = cout.precision();
	ios_base::fmtflags oldflags = cout.flags();


	for (int i = 0; i < currentsize; i++)// Look at each entry.
	{
		if (booklist[i].GetGenre() == g)
		{
			booklist[i].Display();
			price = price + booklist[i].GetPrice();
			genreCount++;
		}
	}
	cout << "Number of books in this genre: " << genreCount
		<< "                    " << "Total: $";


	cout << fixed << showpoint << setprecision(2) << price << endl;

	cout.precision(oldprecision);
	cout.flags(oldflags);
}


int store::findauthor(char* name, const bool print) const
// Locate a name in the directory.  Returns the
// position of the entry list as an integer if found.
// and returns -1 if the entry is not found in the directory.
{
  int returnValue;

  for (int i = 0; i < currentsize; i++)// Look at each entry.
    if (strcmp(booklist[i].GetAuthor(), name) == 0)
    {
      if (print == true)
    booklist[i].Display();
      returnValue = i;// If found, return position and exit.
    }
    else
      returnValue = -1;// Return -1 if never found.

  return returnValue;
}


void store::sort(char type)
{
	Book temp;

	for (int i = 0; i <= currentsize; i++)
	{
		for (int j = i + 1; j < currentsize; j++)
		{
			if (type == 'A')
			{
				if (strcmp(booklist[i].GetTitle(), booklist[j].GetTitle()) > 0)
				{
					temp = booklist[i];
					booklist[i] = booklist[j];
					booklist[j] = temp;
				}
			}
			if (type == 'T')
			{
				if (strcmp(booklist[i].GetAuthor(), booklist[j].GetAuthor()) > 0)
				{
					temp = booklist[i];
					booklist[i] = booklist[j];
					booklist[j] = temp;
				}
			}
		}
	}
}