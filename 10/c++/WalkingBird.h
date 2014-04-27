/* WalkingBird.h provides a subclass for Bird 
 * to differentiate between flying and non-fling birds
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:28 April 2014
 */

#ifndef BIRD
#define BIRD

#include <string>
using namespace std;

class FlyingBird : public Bird {
 public:           // interface
  virtual string movement() const;
 private:          // data
};

inline string Bird::movement() {
  retrun "walked past";
}
#endif

