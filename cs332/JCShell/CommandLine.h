/*
 * CommandLine.h
 *
 *  Created on: Mar 12, 2014
 *      Author: jgl5
 */

#ifndef COMMANDLINE_H_
#define COMMANDLINE_H_

#include <string>
#include <vector>
using namespace std;

class CommandLine {
public:
	CommandLine();
	CommandLine(istream& in);
	~CommandLine();
	char* getCommand() const;
	int getArgCount() const;
	char** getArgVector() const;
	char* getArgVector(int i) const;
	bool noAmpersand() const;
private:
	vector<char*> argVector; // vector which actually contains all the argv data
	char** argv; // pointer to array of character arrays - points to first item of argVector
	int argc; // number of elements in array pointed to by argv
};

#endif /* COMMANDLINE_H_ */
