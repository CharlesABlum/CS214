/* FlyingBird.h provides a subclass for Bird 
 * to differentiate between flying and non-flying birds
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:28 April 2014
 */

#ifndef FLYINGBIRD
#define FLYINGBIRD

#include <string>
#include "Bird.h"
using namespace std;

class FlyingBird : public Bird {
 public:           // interface
  FlyingBird(const string & name);
  string movement();
 private:          // data
};

inline FlyingBird::FlyingBird(const string & name)
  : Bird(name)
{
}

inline string FlyingBird::movement() {
  return "flew past";
}
#endif

