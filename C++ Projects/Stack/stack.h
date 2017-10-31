#ifndef STACKCOMPOSITION_H
#define STACKCOMPOSITION_H

#include "list.h" // List class definition

template< typename STACKTYPE >
class Stack 
{
	
public:
   // no constructor; List constructor does initialization

   // push calls stackList object's insertAtFront member function
   void push( const STACKTYPE &data ) 
   { 
      stackList.insertAtFront( data ); 
   } // end function push
   
   // pop calls stackList object's removeFromFront member function
   bool pop( STACKTYPE &data ) 
   { 
      return stackList.removeFromFront( data ); 
   } // end function pop
   
   // isStackEmpty calls stackList object's isEmpty member function
   bool isStackEmpty() const 
   { 
      return stackList.isEmpty(); 
   } // end function isStackEmpty
   
   // printStack calls stackList object's print member function
   void printStack() const 
   { 
      stackList.print(); 
   } // end function printStack

   
private:
	
   List< STACKTYPE > stackList; // composed List object
}; // end class Stack

#endif
