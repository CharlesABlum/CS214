/* year_codes.cpp is a driver for function yearCode().
 * Begun by: Dr. Adams, for CS 214 at Calvin College.
 ****************************************************************/

#include <iostream>                      // interactive I/O
#include <string>                        // string class
using namespace std;

int yearCode(const string & year);

int main() {
  cout << "\nEnter your academic year: "; // prompt
  string year;
  cin >> year;                            // read year
  cout << yearCode(year) << endl;         // display its code
}


/***************************************************************
 * yearCode() converts an academic year into its integer code. *
 * Receive: year, a string.
 * PRE: year is one of {freshman, sophomore, junior, or senior}.
 * Return: the integer code corresponding to year.
 */

// REPLACE THIS LINE WITH THE DEFINITION OF yearCode()
int yearCode(const string & year){
  if ( year == "freshman" )
  {
    return 1;
  }
  else if ( year == "sophmore" )
  {
    return 2;
  }
  else if ( year == "junior" )
  {
    return 3;
  }
  else if ( year == "senior" )
  {
    return 4;
  }
  else
  {
    return 0;
  }
}
