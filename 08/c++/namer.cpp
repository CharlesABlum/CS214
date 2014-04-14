/* namer.cpp implements and tests class Name.
 *
 * Begun by: Dr. Adams, for CS 214 at Calvin College.
 * Completed by:
 * Date:
 *****************************************************/

#include <iostream>        // istream, ostream
#include <cassert>
#include "Name.h"
using namespace std;

/******************************************
 * a simple driver to test our Name type. *
 ******************************************/
int main()
{
  Name aName("John", "Paul", "Jones");
  
  assert( aName.getMiddle() == "Paul" );
  assert( aName.getLast() == "Jones" );
  assert( aName.getFullName() == "John Paul Jones" );
  
  aName.print(cout);  cout << endl;
  cout << "All tests passed!\n";
}

