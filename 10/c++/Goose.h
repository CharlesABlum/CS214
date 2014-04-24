/* Goose.h
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:
 */

#ifndef GOOSE
#define GOOSE

#include "Bird.h"

class Goose : public Bird {
 public:
  Goose(const string & name);
  string call() const;
  string className() const;
 private:
};

inline Goose::Goose(const string & name) : Bird(name) {

}

inline string Goose::call() const {
  return "Honk!";
}

inline string Goose::className() const {
 return "Goose";
}

#endif
