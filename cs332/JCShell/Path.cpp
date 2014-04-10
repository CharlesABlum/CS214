/* Path.cpp
 *
 *  Created on: Mar 16, 2014
 *  Created for: cs232, Command Shell Project
 *  Author: Charles Blum
 *  Working with: James Lamine
 */

#include "Path.h"
using namespace std;

/* Default constructor, uses the getenv() system call
 * to store each directory from / to the working dir.
 * getenv() returns a string of chars which represent a
 * list of associated directories with the working directory,
 * which are delimited by ':'
 * postcondition:	myDirectories contains all file paths
 *			in PATH
 */
Path::Path() {
	//temp variables
	char* listOfDirs = NULL;
	stringstream ss;
	string dir;
	//get the list of directories
	listOfDirs = getenv( "PATH" );
	myDirectories = vector<string>();

	if ( listOfDirs != NULL )
	{
		ss << listOfDirs;
		while ( getline(ss, dir, ':' ) )
		{
			myDirectories.push_back( dir );
		}
	}
}

/* find(const string  & program) attempts to find the
 * index of program within myDirectories, and if it
 * doesn't, returns -1
 * precondition:	myDirectories contains various names
 * 			program is a string
 * postcondition:	return the index of program, or -1, as int
 */
int Path::find(const string & program) const {
	DIR *dir;

	for ( unsigned i = 0; i < myDirectories.size(); i ++ )
	{
		dir = opendir( myDirectories[i].c_str() );
		if ( dir != NULL )	//if the directory was opened...
		{
			struct dirent *entry;
			while ((entry = readdir(dir)) != NULL)
				//check the entry to see if it matches program
				if ( program == entry->d_name )
					return i;
			closedir(dir);
		}
	}
	//If program isn't found in the vector of directories,
	// return -1 to denote program wasn't found
	return -1;
}

/* getDirectory(const int i) takes in an integer, checks
 * it is within the size of myDirectories, and then returns
 * the corresponding string from myDirectories;
 * postcondition:	directory at index i is returned, as string
 */
string Path::getDirectory(const int i) const {
	//i must be between 0 (inclusive) and mySize (exclusive) to be valid
	if ( i >= 0 && i < myDirectories.size() )
		return myDirectories[i];
	else
		return "";
}
