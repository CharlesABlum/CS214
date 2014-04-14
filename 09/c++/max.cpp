/* max.cpp finds the maximum value in a C++ linked list.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:
 * Date:
 */

#include <iostream>       // cin, cout, <<, >>
using namespace std;

#include "mylist.h"       // print()

int main() {
  // define list1, list2, list3 ...

  list1.push_back(99);    // 99, 88, 77, 66, 55
  list1.push_back(88);    // max is first
  list1.push_back(77);
  list1.push_back(66);  
  list1.push_back(55);

  list2.push_back(55);    // 55, 66, 77, 88, 99
  list2.push_back(66);    // max is last
  list2.push_back(77);  
  list2.push_back(88);  
  list2.push_back(99);  
  
  list3.push_back(55);    // 55, 77, 99, 88, 66
  list3.push_back(77);    // max is in the middle
  list3.push_back(99);  
  list3.push_back(88);  
  list3.push_back(66);  
  
  print(list1, cout); cout << endl;
  print(list2, cout); cout << endl;
  print(list3, cout); cout << endl;

  // display maxima of the 3 lists...
}

