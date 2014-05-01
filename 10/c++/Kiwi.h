/* Kiwi.h
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date: 24 April 2014
 */

#ifndef KIWI
#define KIWI

#include "WalkingBird.h"

class Kiwi : public WalkingBird {
 public:
  Kiwi(const string & name);
  string call() const;
  string className() const;
 private:
};

inline Kiwi::Kiwi(const string & name)
  : WalkingBird(name)
{
}

inline string Kiwi::call() const {
  return "Tweet";
}
  
inline string Kiwi::className() const {
  return "Kiwi";
}

#endif
