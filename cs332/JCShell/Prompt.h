/* Prompt.h, represents the command line prompt
 *
 *  Created on: Mar 16, 2014
 *  Created for: cs232, Command Shell Project
 *  Author: Charles Blum
 *  Working with: James Lamine
 */

#ifndef PROMPT_H_
#define PROMPT_H_

#include <string>

using namespace std;

class Prompt {
public:
	Prompt();
	string get() const;
private:
	string myPath;
};

#endif /* PROMPT_H_ */
