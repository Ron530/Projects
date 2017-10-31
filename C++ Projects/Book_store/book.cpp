#include <iostream>
#include "book.h"
#include <iomanip>

using namespace std;

Book::Book()

{
  strcpy(title, " ");
  strcpy(author, " ");
  type = FICTION;
  price = 0;
}

void Book::Set(const char* t, const char* a, Genre g, double p)
{
  strcpy(title, t);
  strcpy(author, a);
  type = g;
  price = p;
}

const char* Book::GetTitle() const
{
  return title;
} 

const char* Book::GetAuthor() const
{
  return author;
}

double Book::GetPrice() const
{
  return price;
}


Genre Book::GetGenre() const
{
  return type;
}

void Book::Display() const
{
	int oldprecision = cout.precision();
	ios_base::fmtflags oldflags = cout.flags();
	

	cout << left << setw(30) << title << setw(20) << author << setw(11);
  switch (GetGenre())
  {
  case FICTION:
    cout << "Fiction   ";
    break;
  case MYSTERY: 
    cout << "Mystery   ";
    break;
  case SCIFI:
    cout << "SciFi     ";
    break;
  case COMPUTER:
    cout << "Computer  ";
    break;
  }

  cout << "\t $";

 cout << fixed << showpoint << setprecision(2) <<  price << endl;

  cout << '\n';

  cout.precision(oldprecision);
  cout.flags(oldflags);
}
