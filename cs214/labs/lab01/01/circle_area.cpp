/* circle_area.cpp computes the area of a circle.
 *
 * Input: The radius of the circle.
 * Precondition: The radius is a positive number.
 * Output: The area of the circle.
 *
 * Begun by: Dr. Nelesen, for CS 214, at Calvin College.
 * Completed by: Charles Blum
 * Date: 06 February 2014
 **********************************************************/

#include <iostream>             // cin, cout, >>, <<
using namespace std;

/* function circleArea() computes a circle's area, given its radius.
 * Parameter: r, a double
 * Precondition: r is not negative.
 * Returns: the area of the circle
 */
double circleArea(double r) {
  const double PI = 3.1415927;     // define a constant
  return PI * r * r;               // return an expression
}

int main() {
                                   // prompt for and input radius
  cout << "To compute the area of a circle,\n enter its radius: ";
  double radius;                   // declare a variable
  cin >> radius;                   // read radius from the keyboard
                                   // compute area
  double area = circleArea(radius);
                                   // output area
  cout << "The area is " << area << endl;
}
