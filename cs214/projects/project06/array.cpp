/* array.cpp creates an array of size arraySize
 * taken from the user and then fills it with 
 * values from the user.
 *
 * Begun by: Charles Blum, for CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 02 April 2014
 */

#include <iostream>
#include <numeric>
using namespace std;

void printArray(double anArray[], int itsSize, ostream & out);
void readArray(double anArray[], int itsSize, istream & in);

int main() {
 int size;

  cout << "\n specify an array size: " << flush;
  cin >> size;
 
  // Define array0 as an array containing no values
  double array[size];
 
  readArray(array, size, cin);
  printArray(array, size, cout);
}

/*******************************************************
 * readArray takes in itsSize inputs and places them   *
 * in an array.                                        *
 * Receive: anArray, an empty array of doubles.        *
 * 	    itsSize, the size of the array             *
 *          istream, where to read from.               *
 *******************************************************/
void readArray(double anArray[], int itsSize, istream & in = cin) {
  for ( int i = 0; i < itsSize; i++ )
  {
  in >> anArray[i];
  }
}

/*******************************************************
 * printArray prints the values in the arrya           *
 * Receive: anArray, an array of doubles.              *
 * 	    itsSize, the size of the array             *
 *          ostream, where to write to.                *
 *******************************************************/
void printArray(double anArray[], int itsSize, ostream & out = cout) {
  for ( int i = 0; i < itsSize; i++ )
  {
  out << anArray[i] << " " << flush;
  }
  out << endl;
}
