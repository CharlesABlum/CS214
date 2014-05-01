/* max.cpp finds the maximum value in a C++ linked list.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:21 April 2014
 */

#include <iostream>       // cin, cout, <<, >>
#include <algorithm> 	  // max_element
using namespace std;

#include "mylist.h"       // print()

int main() {
  // define list1, list2, list3, list4 ...
  list<int> list1, list2, list3, list4;

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
  cout << *max_element(list1.begin(), list1.end()) << endl;
  cout << *max_element(list2.begin(), list2.end()) << endl;
  cout << *max_element(list3.begin(), list3.end()) << endl;
  
  // find the index of 99 in each of the lists.
  list4.push_back(55);    // 55, 44, 33, 22, 11
  list4.push_back(44);    // 99 is not present
  list4.push_back(33);  
  list4.push_back(22);  
  list4.push_back(11);  
  
  cout << "The index of 99 is: " << index(list1, 99) << endl;
  cout << "The index of 99 is: " << index(list2, 99) << endl;
  cout << "The index of 99 is: " << index(list3, 99) << endl;
  cout << "The index of 99 is: " << index(list4, 99) << endl;
}

