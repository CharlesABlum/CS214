/* sum.cpp sums the values in a file.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by:
 * Date:
 */

#include <iostream>  // cin, cout, etc
#include <fstream>   // ifstream, ofstream, ...
#include <cassert>   // assert()
#include <cstdlib>   // exit()
using namespace std;

int main(int argc, char** argv) {
   if (argc != 2) {
      cerr << "\nUsage: sum <fileName>\n\n";
      exit(1);
   }

   ifstream fin( argv[1] );
   assert( fin.is_open() );

   long number;
   fin >> number;         // ignore the number at the file's beginning
   long long result = 0;
   while (true) {
      fin >> number;
      if ( fin.eof() ) break;
      result += number;
   }
   cout << "\nThe sum is " << result  << ".\n\n";
}

