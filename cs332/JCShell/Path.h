/* Path.h, represents the directories which the
 * CommandShell will search for executables programs
 *
 *  Created on: Mar 16, 2014
 *  Created for: cs232, Command Shell Project
 *  Author: Charles Blum
 *  Working with: James Lamine
 */

#ifndef PATH_H_
#define PATH_H_
#include <string>
#include <sstream>
#include <vector>
#include <cstdlib>
#include <sys/types.h>	//opendir() readdir(), closedir()
#include <dirent.h>		//opendir() readdir(), closedir()

using namespace std;

class Path {
public:
	Path();
	int find(const string& program) const;
	string getDirectory(const int i) const;
private:
	vector<string> myDirectories;
};
#endif /* PATH_H_ */
