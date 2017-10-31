//Work done by Ronney Aovida


#include "Mixed.h"                          
#include <iostream>                     
	using namespace std;


Mixed::Mixed(const int integer, const int numerator, const int 
denominator) // constructor
{
	if (Set(integer, numerator, denominator))
	{
		INT = 5;
		numer = numerator;
		denom = denominator;
	}

	else
	{
		

		INT = 0;
		numer = 0;
		denom = 0;
	}

}


Mixed::Mixed(int integer)  // conversion constructor
{
	INT = integer;
	numer = 0;
	denom = 0;
} 







void Mixed::Simplify()   // this will simplify the fraction by finding 
			//the greatest common denominator 
{						// and dividing the 
//fraction by it. then computes the value of the integer and reducing 
//the 
//fraction further.
	int temp;
	int temp1;
	int GCD;

	
	GCD = gcd(numer,denom);

	numer = numer / GCD;
	denom = denom / GCD;


	temp1 = numer%denom;
	temp = numer - temp1;
	temp = temp / denom;
	INT = temp + INT;
	numer = temp1;
	
	if ((numer < 0) && (INT > 0))
	{
		INT = -1 * INT;
		numer = numer * -1;
	} 
	
} 

  

int Mixed::gcd(int numer,int denom)const  // this function finds the 
//greatest common denominator of the fraction given
{
	int temp;

	

	if ((INT >= 0) && (numer < 0))
	{
		numer = -1 * numer;

		while (denom != 0)
		{
			temp = denom;
			denom = numer % denom;
			numer = temp;
		} 

		return numer;
	} 

	
	if (((INT >= 0) && (numer > 0)) || ((INT < 0) && (numer > 0)))
	{
		while (denom != 0)
		{
			temp = denom;
			denom = numer % denom;
			numer = temp;
		}

		return numer;
	}
}

double Mixed::Evaluate()  // this function will return a decimal value 
//of a complex number when called
{
	double decimal = 0;
	int temp;
	
	if (denom > 0)
	{
		if (INT < 0)
		{
			temp = INT *-1;
			decimal = temp * denom;
			decimal = decimal + numer;
			decimal = -1*(decimal / denom);
		}
		else
		{
			temp = INT;
			decimal = temp * denom;
			decimal = decimal + numer;
			decimal = decimal / denom;
		}
		
	
	}

	return decimal;

}


bool Mixed::Set(const int integer, const int numerator, const int 
denominator)  // this will check if the values passed into the 
{																				
// function are valid or invalid, returning true if valid and false if 
//not

	bool valid = (((integer < 0) && (numerator >= 0) && (denominator 
> 0)));
		
	bool valid2 = ((integer >= 0) && (numerator < 0) && (denominator 
> 0));
		
	bool valid3= ((integer >= 0) && (numerator >= 0) && (denominator 
> 0));


	bool temp= false;

	if (valid || valid2 || valid3)
	{
		INT = integer;
		numer = numerator;
		denom = denominator;

		temp = true;
	} 
	

	return temp;
} 



void Mixed::ToFraction()			// This function will 
//turn a complex number into a pure fraction involving no integers apart 
//from the numerator/denominator
{
	if ((INT > 0) && (numer > 0))
	{
		numer = (INT * denom) + numer;
		INT = 0;
	}
	else if ((INT < 0) && (numer > 0))
	{
		INT = INT * -1;
		numer = (INT * denom) + numer;
		numer = numer * -1;
		INT = 0;
	}
	else if ((INT > 0) && (numer < 0))
	{
		numer = -1 * numer;
		INT = INT * -1;
		numer = (INT * denom) + numer;
		INT = 0;
	}

	else if ((numer == 0))
	{
		numer = INT * 1;
		denom = 1;
		INT = 0;
	}

	else
	{
		numer = (INT * denom) + numer;
		INT = 0;
	}
}







Mixed Mixed::operator++()	// this will allow the usage of the ++x 
//operator, printing the old value but incrementing it as well
{
	Mixed temp;
	temp.INT = INT;
	temp.numer = numer;
	temp.denom = denom;

	INT = INT + 1;
	return temp;
		


}

Mixed Mixed::operator++ (int)		// this will allow the usage of 
//the x++ operator, printing the new value and incrementing it
{
	
	INT = INT + 1;
	Simplify();
	return *this;
}


Mixed Mixed::operator--()	// this will allow the usage of the --x 
//operator, printing the old value but decrementing it as well
{
	Mixed temp;
	temp.INT = INT;
	temp.numer = numer;
	temp.denom = denom;

	INT = INT - 1;
	return temp;
	


}

Mixed Mixed::operator-- (int) // this will allow the usage of the x-- 
//operator, printing the new value and decrementing it.
{
	
	INT = INT - 1;
	Simplify();
	return *this;
	
}



Mixed operator+(const Mixed& x, const Mixed& y)  // allows the usage of 
//the + operator between objects of class Mixed
{
	Mixed obj1(x);
	Mixed obj2(y);
	Mixed obj3;
	 
	obj1.ToFraction();
	obj2.ToFraction();

	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer * denom1;
	obj2.numer = numer1  *denom;

	obj3.numer = obj1.numer + obj2.numer;
	obj3.denom = obj1.denom;

	obj3.Simplify();

	return obj3;
}



Mixed operator-(const Mixed& x, const Mixed& y) // allows the usage of 
//the - operator between objects of class Mixed
{
	Mixed obj1(x);
	Mixed obj2(y);
	Mixed obj3;

	obj1.ToFraction();
	obj2.ToFraction();

	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer * denom1;
	obj2.numer = numer1  *denom;

	obj3.numer = obj1.numer - obj2.numer;
	obj3.denom = obj1.denom;

	if (obj3 != 0)
	{
		obj3.Simplify();
	}

	return obj3;
}





Mixed operator/(const Mixed& x, const Mixed& y) // allows the usage of 
//the / operator between objects of class Mixed
{
	Mixed obj1(x);
	Mixed obj2(y);
	Mixed obj3;

	obj1.ToFraction();
	obj2.ToFraction();

	int temp = obj2.numer;

	obj2.numer = obj2.denom;
	obj2.denom = temp;

	obj3.numer = obj1.numer * obj2.numer;
	obj3.denom = obj1.denom*obj2.denom;
	obj3.Simplify();

	return obj3;
}




Mixed operator*(const Mixed& x, const Mixed& y) // allows the usage of 
//the * operator between objects of class Mixed
{
	Mixed obj1(x);
	Mixed obj2(y);
	Mixed obj3;

	obj1.ToFraction();
	obj2.ToFraction();



	obj3.numer = obj1.numer * obj2.numer;
	obj3.denom = obj1.denom * obj2.denom;

	obj3.Simplify();

	return obj3;
}



bool operator==(const Mixed& x, const Mixed& y) // compares the values 
//of two objects (or integers if using the conversation constructor) and 
//determines
{													
// if they are of equal value to eachother
	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if (obj1.numer == obj2.numer)
	{
		return true;
	}
	else
	{
		return false;
	}
	return false;
}



bool operator!=(const Mixed& x, const Mixed& y)  // compares two objects 
//of type Mixed and determines if they are NOT equal to eachother
{

	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if ((obj1.numer != obj2.numer))
	{
		return true;
	}

	else
	{
		return false;
	}
	return true;
}












bool operator>=(const Mixed& x, const Mixed& y) // compares two Mixed 
//objects and determines if one is greater then or equal to the other

{

	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if ((obj1.numer >= obj2.numer))
	{
		return true;
	}

	else
	{
		return false;
	}
	return false;
}


bool operator<(const Mixed& x, const Mixed& y) // compares two Mixed 
//objects and determines if one is less then the other

{

	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if ((obj1.numer < obj2.numer))
	{
		return true;
	}

	else
	{
		return false;
	}
	return false;
}


bool operator<=(const Mixed& x, const Mixed& y)// compares two Mixed 
//objects and determines if one is less than or equal to the other

{

	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if ((obj1.numer <= obj2.numer))
	{
		return true;
	}

	else
	{
		return false;
	}
	return 0;
}




bool operator>(const Mixed& x, const Mixed& y)  // compares two Mixed 
//objects and determines if one is greater then the other
{

	Mixed obj1(x);
	Mixed obj2(y);

	obj1.ToFraction();

	obj2.ToFraction();


	int denom = obj1.denom;
	int numer = obj1.numer;
	int denom1 = obj2.denom;
	int numer1 = obj2.numer;

	obj1.denom = denom  * denom1;
	obj1.numer = numer*denom1;
	obj2.denom = denom * denom1;
	obj2.numer = numer1*denom;

	if ((obj1.numer > obj2.numer))
	{
		return true;
	}

	else
	{
		return false;
	}
	return 0;
}


ostream& operator << (ostream& stream, Mixed& complex)  // this 
//customizes the output stream to accept objects and print them in a 
//custom way
{

	if ((complex.numer == 0) && (complex.denom == 0))
	{
		stream << complex.INT;
	}
	else if ((complex.INT > 0) && (complex.numer < 0))
	{
		complex.INT = complex.INT * -1;
		complex.numer = complex.numer *-1;

		stream << complex.INT << " " << complex.numer << "/" << 
complex.denom;
	}

	else if ((complex.INT == 0) && (complex.numer == 0))
	{
		stream << complex.INT;
	}

	else if ((complex.INT == 0) && (complex.numer != 0) && 
(complex.denom != 0))
	{
		stream << complex.numer << "/" << complex.denom;
	}

	else
	{
		stream << complex.INT << " " << complex.numer << "/" << 
complex.denom;
	}

	return stream;
}



istream& operator >> (istream &stream, Mixed& complex)// this is a 
//custom input stream operator that allows the user to enter 
{														
// their complex number using a slash character
	int num1, num2, num3;
	char slash;
	stream >> num1 >> num2 >> slash >> num3;

	if (complex.Set(num1, num2, num3))
	{

	}

	if (complex.Set(num1, num2, num3) == false)
	{

		complex.INT = 0;
		complex.numer = 0;
		complex.denom = 0;
	}
	return stream;
}



