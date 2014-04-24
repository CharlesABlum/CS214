/* Bird.h provides class Bird.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:24 April 2014
 */

#ifndef BIRD
#define BIRD

#include <string>
using namespace std;

class Bird {
 public:           // interface
  Bird(const string & name);
  virtual ~Bird() {};
  virtual string name() const;
  virtual string call() const;
  void print(ostream & out = cout) const;
  virtual string className() const;
 private:          // data
 string myName;
};

inline Bird::Bird(const string & name) {
  myName = name;
}

inline string Bird::name() const {
  return myName;
}

inline string Bird::call() const {
  return "Squaaaaaaaaaaaaaaak";
}

inline string Bird::className() const {
  return "Bird";
}

inline void Bird::print(ostream & out) const {
  out 	<< name()
	<< ' '
	<< className()
	<< " says "
	<< call();
}
#endif

