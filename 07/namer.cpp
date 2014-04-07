/* namer.cpp implements and tests class Name.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 03 April 2014
 */

#include <iostream>        // istream, ostream
#include <string>          // string
#include <cassert>         // assert()
using namespace std;

// Replace this line with the declaration of class Name 
class Name {
  public:                          // interface functions
    Name(const string & fist, const string & middle, const string & last);
    string getFirst()  const;
    string getMiddle() const;
    string getLast()   const;
    string getFullName() const;
    void print(ostream & out);
  private:
    string myFirst,
           myMiddle,
           myLast;
};

/**************************************************
* Name constructs a name from three strings.      *
* Receive: first, middle and last, three strings. *
* Return: the triplet (first middle last).        *
***************************************************/
Name::Name(const string & first, const string & middle, const string & last) {
  myFirst = first;
  myMiddle = middle;
  myLast = last;
}

/***************************************************
 * getFirst() extracts the first name of a Name object. *
 * Return: myFirst.                                *
 ***************************************************/
string Name::getFirst() const {
  return myFirst;
}

/*****************************************************
 * getMiddle() extracts the middle name of a Name object. *
 * Return: myMiddle.                                 *
 *****************************************************/
string Name::getMiddle() const {
  return myMiddle;
}

/**************************************************
 * getLast() extracts the last name of a Name object.  *
 * Return: myLast.                                *
 **************************************************/
string Name::getLast() const {
  return myLast;
}

/***************************************************
 * getFullName() returns a full name in F-M-L order.    *
 * Return: myFirst, myMiddle, myLast.              *
 ***************************************************/
string Name::getFullName() const {
  return myFirst + ' ' + myMiddle + ' ' + myLast;
}

/****************************************************
 * print() displays a Name object.                    *
 * Receive: out, the name of a stream.              *
 * Output: the strings in theName to buffer.        *
 * POST: out contains myFirst, myMiddle and myLast. *
 ****************************************************/
void Name::print(ostream & out) {
  out << getFullName();
}

/******************************************
 * a simple driver to test our Name type. *
 ******************************************/
int main()
{
  Name aName("John", "Paul", "Jones");

  assert( aName.getFirst() == "John" );
  assert( aName.getMiddle() == "Paul" );
  assert( aName.getLast() == "Jones" );
  assert( aName.getFullName() == "John Paul Jones" );
  
  aName.print(cout);  cout << endl;
  cout << "\n\nAll tests passed! " << endl;
}

