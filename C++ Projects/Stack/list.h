#ifndef LIST_H
#define LIST_H

#include <iostream>

using std::cout;

#include <new>
#include "listnode.h"  // ListNode class definition

template< class NODETYPE >
class List {

public:
   List();      // constructor
   ~List();     // destructor
   void insertAtFront( const NODETYPE & );
   void insertAtBack( const NODETYPE & );
   bool removeFromFront( NODETYPE & );
   bool removeFromBack( NODETYPE & );
   bool isEmpty() const;
   void print() const;
   void insertMiddle(const NODETYPE &, int);
   bool removeMiddle(NODETYPE &, int);

private:
   ListNode< NODETYPE > *firstPtr;  // pointer to first node
   ListNode< NODETYPE > *lastPtr;   // pointer to last node

   // utility function to allocate new node
   ListNode< NODETYPE > *getNewNode( const NODETYPE & );
   int count;
}; // end class List



template< class NODETYPE >
void List < NODETYPE >::insertMiddle(const NODETYPE &val, int numb)
{
	ListNode< NODETYPE > *newPtr = getNewNode(val);
	ListNode< NODETYPE > *leftptr;
	ListNode< NODETYPE > *rightptr;


	if (numb <= 1)
	{
		insertAtFront(val)
	}
	else if (numb > count)
	{
		insertAtBack(val);
	}
	else
	{


		leftptr = firstPtr;

		
		// setting the left pointer to value of next pointer throughout the loop


		while (((numb - 2) >= 0))
		{
			leftptr = leftptr->nextPtr;

			numb= numb-1;
		}

		//found the right pointer!


		rightptr = leftptr->nextPtr;

		
		leftptr->nextPtr = newPtr;

		// initialize new pointer to the right one

		newPtr->nextPtr = rightptr;

	}
}


template< class NODETYPE >
bool List< NODETYPE >::removeMiddle(NODETYPE &val, int numb)
{

	// determines if the position is valid or invalid
	if ((numb < 1) || (numb > count))
	{
		return false;
	}

	else if (numb == 1)
	{
		return removeFromFront(val);

	}


	else if (numb == count)
	{

		return removeFromBack(val);
	}

	else
	{

		// creating pointers


		ListNode< NODETYPE > *leftptr;

		
		ListNode< NODETYPE > *rightptr;

		
		leftptr = firstPtr;

		
		// change left pointer value to right pointer through this loop
		while (((numb - 2) >= 0))
		{
			leftptr = leftptr->nextPtr;
			numb= numb-1;


		}

		// finds the right pointer
		rightptr = leftptr->nextPtr->nextPtr;

		
		delete leftptr->nextPtr;

		
		leftptr->nextPtr = rightptr;

		return true;
	}
}




// default constructor
template< class NODETYPE >
List< NODETYPE >::List() 
   : firstPtr( 0 ), 
     lastPtr( 0 ) 
{ 
   // empty body

} // end List constructor

// destructor
template< class NODETYPE >
List< NODETYPE >::~List()
{
   if ( !isEmpty() ) {    // List is not empty
//      cout << "Destroying nodes ...\n";

      ListNode< NODETYPE > *currentPtr = firstPtr;
      ListNode< NODETYPE > *tempPtr;

      while ( currentPtr != 0 )         // delete remaining nodes
      {  
         tempPtr = currentPtr;

// commented out the output -- no need to print what we are deallocating
//         cout << tempPtr->data << '\n';  

         currentPtr = currentPtr->nextPtr;
         delete tempPtr;

      }


	  count = count - count;
   }

//   cout << "All nodes destroyed\n\n";

} // end List destructor

// insert node at front of list
template< class NODETYPE >
void List< NODETYPE >::insertAtFront( const NODETYPE &value )
{
   ListNode< NODETYPE > *newPtr = getNewNode( value );

   if ( isEmpty() )  // List is empty
      firstPtr = lastPtr = newPtr;

   else {  // List is not empty
      newPtr->nextPtr = firstPtr;
      firstPtr = newPtr;

   } // end else

   count=count+1;

} // end function insertAtFront

// insert node at back of list
template< class NODETYPE >
void List< NODETYPE >::insertAtBack( const NODETYPE &value )
{
   ListNode< NODETYPE > *newPtr = getNewNode( value );

   if ( isEmpty() )  // List is empty
      firstPtr = lastPtr = newPtr;

   else {  // List is not empty
      lastPtr->nextPtr = newPtr;
      lastPtr = newPtr;

   } // end else
   count = count + 1;
} // end function insertAtBack






// delete node from front of list
template< class NODETYPE >
bool List< NODETYPE >::removeFromFront( NODETYPE &value )
{
   if ( isEmpty() )  // List is empty
      return false;  // delete unsuccessful

   else {  
      ListNode< NODETYPE > *tempPtr = firstPtr;

      if ( firstPtr == lastPtr )
         firstPtr = lastPtr = 0;
      else
         firstPtr = firstPtr->nextPtr;

      value = tempPtr->data;  // data being removed
      delete tempPtr;

      return true;  // delete successful

   } // end else
   count = count - 1;
} // end function removeFromFront

// delete node from back of list
template< class NODETYPE >
bool List< NODETYPE >::removeFromBack( NODETYPE &value )
{
   if ( isEmpty() )
      return false;  // delete unsuccessful

   else {
      ListNode< NODETYPE > *tempPtr = lastPtr;

      if ( firstPtr == lastPtr )
         firstPtr = lastPtr = 0;
      else {
         ListNode< NODETYPE > *currentPtr = firstPtr;

         // locate second-to-last element
         while ( currentPtr->nextPtr != lastPtr )
            currentPtr = currentPtr->nextPtr;

         lastPtr = currentPtr;
         currentPtr->nextPtr = 0;

      } // end else

      value = tempPtr->data;
      delete tempPtr;

      return true;  // delete successful

   } // end else
   count = count - 1;
} // end function removeFromBack

// is List empty?
template< class NODETYPE > 
bool List< NODETYPE >::isEmpty() const 
{ 
   return firstPtr == 0; 
   
} // end function isEmpty

// return pointer to newly allocated node
template< class NODETYPE >
ListNode< NODETYPE > *List< NODETYPE >::getNewNode( 
   const NODETYPE &value )
{
   return new ListNode< NODETYPE >( value );

} // end function getNewNode

// display contents of List
template< class NODETYPE >
void List< NODETYPE >::print() const
{
   if ( isEmpty() ) {
      cout << "The list is empty\n\n";
      return;

   } // end if

   ListNode< NODETYPE > *currentPtr = firstPtr;

   cout << "The list is: ";

   while ( currentPtr != 0 ) {
      cout << currentPtr->data << ' ';
      currentPtr = currentPtr->nextPtr;

   } // end while

   cout << "\n\n";

} // end function print

#endif
