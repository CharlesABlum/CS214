/* array_sum.cpp sums the values in a file
 *  by reading them into an array and summing them there.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by:
 * Date:
 *
 * Usage: array_sum <inFileName>
 */

#include <iostream>     // cin, cout, etc
#include <fstream>      // ifstream, ofstream
#include <vector>       // vector
#include <cassert>      // assert()
#include <cstdlib>      // exit()
#include "NanoTimer.h"  // nanosecond timer
#include <iomanip>      // formatted output
using namespace std;

void checkCommandLine(int argc);
void readFile(const string& fileName, vector<int>& v);
long sum(const vector<int>& v);
void display(long total, const NanoTimer& nTimer);

int main(int argc, char** argv) {
   checkCommandLine(argc);
   vector<int> values;
   readFile( argv[1], values );
   long total;
   NanoTimer nTimer;
   nTimer.start();
   total = sum(values);
   nTimer.stop();
   display(total, nTimer);
}

void checkCommandLine(int argc) {
   if (argc != 2) {
      cerr << "\nUsage: array_sum <fileName>\n\n";
      exit(1);
   }
}

long sum(const vector<int>& v) {
   long result = 0;

   for (unsigned i = 0; i < v.size(); i++) {
      result += v[i];
   }

   return result;
}


void readFile(const string& fileName, vector<int>& v) {
   ifstream fin( fileName.c_str() );
   assert( fin.is_open() );

   int number;
   fin >> number;
   v.reserve(number);
   while (true) {
      fin >> number;
      if ( fin.eof() ) break;
      v.push_back(number);
   }
   
   fin.close();
}

void display(long total , const NanoTimer& nTimer) {
   cout << "\nThe sum is " << total 
        << "\n and computing it took " 
        << fixed << showpoint << setprecision(9) 
        << nTimer 
        << " secs.\n" << endl;

}
