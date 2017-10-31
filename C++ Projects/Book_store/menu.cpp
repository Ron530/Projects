#include <iostream>
#include "store.h"

using namespace std;

void ShowMenu()
// Display the main program menu.
{
	cout << "\n\t\t*** BOOKSTORE MENU ***";
	cout << "\n\tA \tAdd a Book to Inventory";
	cout << "\n\tF \tFind a book from Inventory";
	cout << "\n\tS \tSell a book";
	cout << "\n\tD \tDisplay the inventory list";
	cout << "\n\tG \tGenre summary";
	cout << "\n\tO \tSort inventory list";
	cout << "\n\tM \tShow this Menu";
	cout << "\n\tX \teXit Program";
}

char GetAChar(const char* promptString)
// Prompt the user and get a single character,
// discarding the Return character.
// Used in GetCommand.
{
	char response;// the char to be returned

	cout << promptString;// Prompt the user
	cin >> response;// Get a char,
	response = toupper(response);// and convert it to uppercase
	cin.get();// Discard newline char from input.
	return response;
}

char Legal(char c)
// Determine if a particular character, c, corresponds
// to a legal menu command.  Returns 1 if legal, 0 if not.
// Used in GetCommand.
{
	return((c == 'A') || (c == 'F') || (c == 'S') ||
		(c == 'D') || (c == 'G') || (c == 'O') ||
		(c == 'M') || (c == 'X'));
}

char GetCommand()
// Prompts the user for a menu command until a legal 
// command character is entered.  Return the command character.
// Calls GetAChar, Legal, ShowMenu.
{
	char cmd = GetAChar("\n\n>");// Get a command character.

	while (!Legal(cmd))// As long as it's not a legal command,
	{// display menu and try again.
		cout << "\nIllegal command, please try again . . .";
		ShowMenu();
		cmd = GetAChar("\n\n>");
	}
	return cmd;
}

void Add(store& s)
{
	char title[31];
	char author[21];
	char x;
	Genre aGenre;
	double aPrice;

	cout << "Enter title: ";
	cin.getline(title, 30);

	cout << "Enter author: ";
	cin.getline(author, 20);

	
	do
	{
	cout << "Enter Genre - (F)iction, (M)ystery, (S)ci - Fi, or (C)omputer: ";

	cin >> x;

	} while (x != 'F' && x != 'f' && x!='m' && x != 'M' && x != 's' && x != 'S' && x != 'c' && x != 'C');
		switch (x)
		{
		case 'f': aGenre = FICTION;    break;
		case 'F': aGenre = FICTION;    break;
		case 'm': aGenre = MYSTERY;    break;
		case 'M': aGenre = MYSTERY;    break;
		case 's': aGenre = SCIFI;      break;
		case 'S': aGenre = SCIFI;      break;
		case 'c': aGenre = COMPUTER;   break;
		case 'C': aGenre = COMPUTER;   break;
		}
	
	cout << "enter price: ";
	cin >> aPrice;



	
	s.addbook(title, author, aGenre, aPrice);

}

void Find(store& s)
{
	char title[31];

	cout << "enter search string(title or author): ";

	cin.getline(title, 30);

	s.Find(title);



	

}

void Sell(store& s)
{
	char title[31];
	cout << "enter a title to sell: ";
	cin.getline(title, 30);
	s.sell(title);

}

void thegenre(store& s)
{
	char c;
	Genre result;

	do
		c = GetAChar("Enter Genre - (F)iction, (M)ystery, (S)ci-Fi, or (C)omputer: ");
	while ((c != 'F') && (c != 'M') && (c != 'S') && (c != 'C'));

	switch (c)
	{
	case 'F': s.showgenre(FICTION);    break;
	case 'M': s.showgenre(MYSTERY);    break;
	case 'S': s.showgenre(SCIFI);      break;
	case 'C': s.showgenre(COMPUTER);   break;
	}

}

void Sort(store& s)
{
	char c;
	Genre result;

	do
		c = GetAChar("do you wish to search by author or title? (A or T) ");
	while ((c != 'A') && (c != 'T'));

	s.sort(c);
}

void start(store& s)
{
	double amount;

	cout << "*** Welcome to Bookstore Inventory Manager ***\n"
		<< "Please input the starting money in the cash register: ";
	  cin >> amount;

	s.setregister(amount);
}

int main()
{
	store thestore;// Create and initialize a Store

	start(thestore);//Display intro & set Cash Regsiter

	ShowMenu();// Display the menu.

			   /*mainStore.Insert("A Clockwork Orange", "Anthony Burgess", SCIFI, 30.25);
			   mainStore.Insert("X-Factor", "Anthony Burgess", SCIFI, 30.25);*/

	char command;// menu command entered by user
	do
	{
		command = GetCommand();// Retrieve a command.
		switch (command)
		{
		case 'A': Add(thestore);             break;
		case 'F': Find(thestore);            break;
		case 'S': Sell(thestore);            break;
		case 'D': thestore.showstore();   break;
		case 'G': thegenre(thestore);       break;
		case 'O': Sort(thestore);            break;
		case 'M': ShowMenu();                 break;
		case 'X': cout <<"you have $" <<  thestore.getregister()<<" left in the register, Goodbye!\n\n";  break;
		}
	} while ((command != 'X'));

	return 0;
}