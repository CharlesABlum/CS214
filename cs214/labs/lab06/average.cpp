/* average.cpp "test-drives" function Average.
 * Precondition: theArray is an array of numbers.
 * Output: the average of the values.
 *
 * Begun by: Dr. Adams, for CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 20 March 2014
 */

#include <iostream>
#include <numeric>
using namespace std;

double average(double anArray[], int itsSize);

int main() {

  // Define array0 as an array containing no values
  double array0[] = {};
  // Define array1 as an array containing 9.0, 8.0, 7.0, 6.0
  double array1[] = { 6.0, 7.0, 8.0, 9.0 };
  
  cout << "\n average 1 is " << average(array0, 0) << endl;
  cout << "\n average 2 is " << average(array1, 4) << endl;
}

/*******************************************************
 * average averages the values in an array of doubles. *
 * Receive: anArray, an array of doubles.              *
 * Return: the average of the values in aVector.       *
 *******************************************************/
double average(double a[], int size) {
  if ( size == 0 )
    return 0.0;
  else
    return accumulate( a, a+size, 0.0 ) / size;  
}
