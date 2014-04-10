/* quad.cpp computes the roots of a second degree polynomial
 * using the quadratic formula.
 *
 * Input: a, b, c: all doubles;
          root1, root2: the calculated roots as doubles
 * PRE: a, b, and c are real values, root1 and root2 are empty
 * Output: If an error occured the corresponding message is printed
 *         else the roots root1 and root2 are printed.
 *
 * Begun by: Charles Blum, for CS 214 at Calvin College.
 * Completed by: Charles Blum
 * Date: 12 March 2014
 **********************************************************************/

#include <iostream>
#include <cmath>
using namespace std;


bool quadraticRoots(double a, double b, double c,
                        double & root1, double & root2);

int main() {
  cout << "\nFor a quadratic equation (y = ax^2 + bx + c),";
  cout << "\nEnter the roots,";
  cout << "\na=";
  double a, b, c;
  cin >> a;
  cout << "\nb=";
  cin >> b;
  cout << "\nc=";
  cin >> c;

  double root1, root2;
  if ( quadraticRoots(a, b, c, root1, root2) )
  {
  cout << "\nThe first root is " << root1
       << "\n and the second root is " << root2 << endl;    
  }
  else
  {
    cout << "\nAn error occured!  Please see above and try again." << endl;
  }
}

/**************************************************
 * quadraticRoots() computes the roots of a       *
 * second degree polynomial                       *
 * Receive: a, b, c, coefficients for calculation *
 *          root1, root2, destination for         *
 *          calculated roots                      *
 * PRE: a, b, and c are real values               *
 * Passback: root1 - the first root               *
 *           root2 - the second root              *
 **************************************************/
bool quadraticRoots(double a, double b, double c,
                        double & root1, double & root2) {
  if (a != 0)
  {
    double arg = pow(b, 2.0) - 4 * a * c;
    if (arg >= 0)
    {
      root1 = (-b + sqrt(arg))/(2*a);
      root2 = (-b - sqrt(arg))/(2*a);
      return true;
    }
    else 
    {
      cerr << "\n*** quadraticRoots(): b^2 - 4ac is negative!" << endl;
      root1 = root2 = 0.0;
      return false;
    }
  }
  else
  {
    cerr << "\n*** QuadraticRoots(): a is zero!" << endl;
    root1 = root2 = 0.0;
    return false;
  }
}
