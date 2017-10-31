#ifndef _STORE_H
#define _STORE_H
#include "book.h"

#include <iomanip>
class store
{
public:
	store();
	~store();
	void addbook(const char* t, const char* a, Genre g, double p);
	void sell(const char* t);
	void setregister(double x);
	void grow();
	int findbook(char* name)const;
	void sort(char type);
	double getregister()const;
	void Find(const char* x) const;
	void showgenre(const Genre g) const;
	void showstore() const;
	void reduce();
	int findauthor(char* name, const bool print) const;
	
private:
	int maxsize;
	int currentsize;
	Book* booklist;
	
	double cashregister;
};


#endif
