/* FlyingBird.h provides a subclass for Bird 
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
  FlyingBird(const string * name);
  virtual string movement() const;
 private:          // data
};

inline FlyingBird::FlyingBird(const string & name)
  : Bird(name)
{
}

inline string FlyingBird::movement() : movement()
{
}
#endif

