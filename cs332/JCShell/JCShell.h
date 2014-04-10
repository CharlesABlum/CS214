/*
 * JCShell.h
 *
 *  Created on: Mar 17, 2014
 *      Authors: jgl5 and cab35
 */

#ifndef JCSHELL_H_
#define JCSHELL_H_

#include "Path.h"
#include "Prompt.h"
#include "CommandLine.h"

class JCShell {
public:
	JCShell();
	void run();
	~JCShell();
private:
	void waitIfBackgrounded(int childPid) const;
	void runCd();
	void runCommand(const string& command) const;
	void chooseCommand(const string& command) const;
	Path myPath;
	Prompt myPrompt;
	CommandLine* myCommandLine;
};

#endif /* JCSHELL_H_ */
