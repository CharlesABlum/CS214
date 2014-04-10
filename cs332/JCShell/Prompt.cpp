/* Prompt.cpp
 *
 *  Created on: Mar 16, 2014
 *  Created for: cs232, Command Shell Project
 *  Author: Charles Blum
 *  Working with: James Lamine
 */

#include "Prompt.h"
#include <cstdlib>
using namespace std;

/* Default constructor for Prompt.
 * precondition:  myPath empty, not initialized.
 * postcondition: myPath contains the working directory, as string
 */
Prompt::Prompt() {
	char* cwd = NULL;
	cwd = get_current_dir_name();
	if (cwd == NULL) {
		myPath = "";
		return;
	}
	myPath = string(cwd);
	free(cwd);
}

/* get() returns the current working directory, myPath
 * returned: myPath
 */
string Prompt::get() const {
	return myPath;
}
