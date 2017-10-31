//Work done by Ronney Aovida
//6/03/2016

class Date
{

public: 
        Date(int m,int d,int y);
	Date();

        void Input();
	void Show()const;
	bool Set(int m, int d, int y);
	bool SetFormat(char f);
	void Increment(int numDays=1);
	int Compare(const Date& d)const;
	int GetMonth()const;
	int GetDay()const;
	int GetYear()const;

private:


char setformat;
int day,month,year;
};

