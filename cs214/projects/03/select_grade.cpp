/* select_grade.cpp is a driver for function select_grade().
 * Begun by: Charles Blum, for CS 214 at Calvin College.
 ****************************************************************/

#include <iostream>                      // interactive I/O
#include <string>                        // string class
using namespace std;

char select_grade(const int &num);

int main() {
  cout << "Enter your numeric grade on a 0-100 scale: "; // prompt
  int numGrade;
  cin >> numGrade;          		                  // read numeric grade
  cout << select_grade(numGrade) << endl;      		  // display its code
}


/***************************************************************
 * select_grade() converts a numberic grade into its letter grade.
 * Receive: numGrade, a n int.
 * PRE: numGrade is an integer value from 0 to 100..
 * Return: the corresponding letter grade as a char.
 */

char select_grade(const int &num){
  switch ( num / 10 )
  {
    case 10:
    case 9:
      return 'A';
    case 8:
      return 'B';
    case 7:
      return 'C';
    case 6:
      return 'D';
    default:
     return 'F';
  }
}
