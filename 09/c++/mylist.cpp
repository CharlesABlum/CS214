/* mylist.cpp defines functions that extend the STL list.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:
 * Date:
 */

#include <iostream>     // cout, <<
using namespace std;

#include "mylist.h"

/*********************************************
 * print() displays an STL list of integers. *
 * Receive: aList, a list of integers,       *
 *          out, an ostream.                 *
 * Output: the values in aList, to out.      *
 *********************************************/
void print(const list<int> & aList, ostream & out) {
  list<int>::const_iterator it = aList.begin();
  while ( it != aList.end() )
  {
    out << *it << '\t';
    it++;
  }
}

/*********************************************
 * index() finds the index of a number in    *
 * the list.                                 *
 * Receive: aList, a list of integers,       *
 *          number, the number to find       *
 * Output: the index of number in the list.  *
 *********************************************/
int index(const list<int> & aList, int number) { 
  list<int>::const_iterator it = aList.begin();
  int i = 0;
  while ( it != aList.end() )
  {
    if ( *it == number )
    {
      return i ;
    }
    i++; it++;
  }
  return -1;
}
