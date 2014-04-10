/* factorial.cpp computes and displays the
 * factorial of a number entered by the user.
 *
 * Input: an integer, n
 * Output: the value of n!
 * Begun by: Charles Blum, for cs214 at Calvin College
 * Begin on: 4 March 2014
 */

#include <iostream>
#include <cassert>

using namespace std;

double factorial(unsigned n) {
  double answer = 1.0;

  for (unsigned i = 2; i <= n; i++)
  {
    answer *= i;
  }
  return answer;
}

int main() {
  cout << "\nTo compute n!, enter n: ";
  unsigned n;
  cin >> n;

  assert(n >= 0);

  cout << n << "! = " << factorial(n) << endl;
}
