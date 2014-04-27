/* Goose.h
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:
 */

#ifndef GOOSE
#define GOOSE

#include "FlyingBird.h"

class Goose : public FlyingBird {
 public:
  Goose(const string & name);
  string call() const;
  string className() const;
 private:
};

inline Goose::Goose(const string & name) : FlyingBird(name) {

}

inline string Goose::call() const {
  return "Honk!";
}

inline string Goose::className() const {
 return "Goose";
}

#endif
