/* birds.cpp illustrates inheritance and polymorphism.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by:Charles Blum
 * Date:24 April 2014
 */

#include <iostream>       // cin, cout, <<, >>
#include "Bird.h"         // Bird
#include "FlyingBird.h"	  // Flying Birds
#include "Owl.h"          // Owl
#include "Duck.h"         // Duck
#include "Goose.h"        // Goose
#include "WalkingBird.h"  // Walking Birds
#include "Penguin.h"	  // Penguin
#include "Ostrich.h"	  // Ostrich
#include "Kiwi.h"	  // Kiwi
using namespace std;

int main() {
  Bird * birdPtr0 = NULL,
       * birdPtr1 = NULL,
       * birdPtr2 = NULL,
       * birdPtr3 = NULL,
       * birdPtr4 = NULL,
       * birdPtr5 = NULL,
       * birdPtr6 = NULL;

  birdPtr0 = new Bird("Hawkeye");
//  cout << birdPtr0->name() << endl;
//  cout << birdPtr0->call() << endl;
//  cout << birdPtr0->className() << endl;
  birdPtr0->print(); cout << endl;
  
  birdPtr1 = new Duck("Donald");
  birdPtr1->call();
  birdPtr1->print(); cout << endl;

  birdPtr2 = new Goose("Mother Goose");
  birdPtr2->print(); cout << endl;

  birdPtr3 = new Owl("Woodsey");
  birdPtr3->print(); cout << endl;
  
  birdPtr4 = new Penguin("Mr. Popper's");
  birdPtr4->print(); cout << endl;

  birdPtr5 = new Ostrich("Ollie");
  birdPtr5->print(); cout << endl;

  birdPtr6 = new Kiwi("Karl");
  birdPtr6->print(); cout << endl;

  delete birdPtr0;
  delete birdPtr1;
  delete birdPtr2;
  delete birdPtr3;
  delete birdPtr4;
  delete birdPtr5;
  delete birdPtr6;
}
