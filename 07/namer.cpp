/* namer.cpp implements and tests class Name.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 09 April 2014
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
    //project07
    void setFirst( const string & f);
    void setMiddle( const string & m);
    void setLast( const string & l );
    string lfmi() const;
    void readName( istream & in );
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

/*
 * Project 07 Chagnes
 */
/*************************************************
 * Setters for first, middle, and last names.    *
 * Postcondition: the instance variable is set   *
 *************************************************/
void Name::setFirst(const string & aFirst) {
  myFirst = aFirst;
}

void Name::setMiddle(const string & aMiddle) {
  myMiddle = aMiddle;
}

void Name::setLast(const string & aLast) {
  myLast = aLast;
}

/*************************************************
 * lfmi returns the name in last, first middle   *
 * where middle is the first letter.             *
 * Postcondition: name is returned to the user.  *
 *************************************************/
string Name::lfmi() const {
  return myLast + ", " + myFirst + " " + myMiddle[0] + ".";
}

/*************************************************
 * readName takes in new input from the user.    *
 * Postcondition: the instance variables are set *
 * set to new values.                            *
 *************************************************/
void Name::readName(istream & in ) {
  in >> myFirst >> myMiddle >> myLast;
}
/*
 * End Project 07 Changes
 */

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
  cout << "\nLab07 tests passed!" << endl;

  aName.setFirst( "Paul" );
  aName.setMiddle( "John" );
  aName.setLast( "Smith" );
  
  assert( aName.getFirst() == "Paul" );
  assert( aName.getMiddle() == "John" );
  assert( aName.getLast() == "Smith" );
  assert( aName.getFullName() == "Paul John Smith" );
  cout << aName.lfmi() << endl;
  assert( aName.lfmi() == "Smith, Paul J." );

  cout << "Enter a name that is not: \"" << aName.getFullName() << "\"" << endl;
  aName.readName( cin );

  assert( aName.getFirst() != "Paul" );
  assert( aName.getMiddle() != "John" );
  assert( aName.getLast() != "Smith" );
  assert( aName.getFullName() != "Paul John Smith" );
  assert( aName.lfmi() != "Smith, Paul J." );
  cout << "\nProject07 tests passed!" << endl;

  cout << "\n\nAll tests passed! " << endl;
}

