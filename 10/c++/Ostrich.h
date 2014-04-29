/* Duck.h
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 24 April 2014
 */

#ifndef OSTRICH
#define OSTRICH

#include "WalkingBird.h"

class Ostrich : public WalkingBird {
 public:
  Ostrich(const string & name);
  string call() const;
  string className() const;
 private:
};

inline Ostrich::Ostrich(const string & name)
  : WalkingBird(name)
{
}

inline string Ostrich::call() const {
  return "Snork";
}
  
inline string Ostrich::className() const {
  return "Ostrich";
}

#endif
