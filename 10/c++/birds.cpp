/* birds.cpp illustrates inheritance and polymorphism.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:
 * Date:
 */

#include <iostream>       // cin, cout, <<, >>
using namespace std;

#include "Bird.h"         // Bird
#include "Owl.h"          // Owl
#include "Duck.h"         // Duck
#include "Goose.h"        // Goose

int main() {
  Bird * birdPtr0 = NULL,
       * birdPtr1 = NULL,
       * birdPtr2 = NULL,
       * birdPtr3 = NULL;

  birdPtr0 = new Bird("Hawkeye");
  birdPtr0->print(); cout << endl;
/*  
  birdPtr1 = new Duck("Donald");
  birdPtr1->print(); cout << endl;

  birdPtr2 = new Goose("Mother Goose");
  birdPtr2->print(); cout << endl;

  birdPtr3 = new Owl("Woodsey");
  birdPtr3->print(); cout << endl;
  */
  delete birdPtr0;
  delete birdPtr1;
  delete birdPtr2;
  delete birdPtr3;
}
