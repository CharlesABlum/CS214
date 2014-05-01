/* WalkingBird.h provides a subclass for Bird 
 * to differentiate between flying and non-flying birds
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:28 April 2014
 */

#ifndef WALKINGBIRD
#define WALKINGBIRD

#include <string>
#include "Bird.h"
using namespace std;

class WalkingBird : public Bird {
 public:           // interface
  WalkingBird(const string & name);
  string movement() const;
 private:          // data
};

inline WalkingBird::WalkingBird(const string & name) : Bird(name)
{
}

inline string WalkingBird::movement() const {
  return "walked past";
}
#endif

