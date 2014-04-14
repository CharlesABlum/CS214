/* Name.h declares class Name.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 13 April 2014
 */

#include <string>          // string
using namespace std;

class Name {
public:                          // interface functions
   Name(const string & first, const string & middle, const string &
last);
   void print(ostream & out);
   string getFirst() const;
   string getMiddle() const;
   string getLast() const;
   string getFullName() const;

private:
   string myFirst,
          myMiddle,
          myLast;
};
