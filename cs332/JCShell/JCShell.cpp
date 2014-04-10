/*
 * JCShell.cpp - JC Shell program.  parses the commmand
 * line and exectues the appropiate program.  It handles
 * basic comands like "cd" and "pwd"
 *
 * Charles Blum and James Lamine
 * cs232
 * Calvin College
 * 03-31-2014
 */

#include <iostream>
#include <sys/types.h>
#include <sys/wait.h>
#include "JCShell.h"
using namespace std;

/*
 * defualt constructor
 */
JCShell::JCShell() {
	myPrompt = Prompt();
	myCommandLine = NULL;
	myPath = Path();
}

/*
 * defualt de-constructor
 */

JCShell::~JCShell() {
	delete myCommandLine;
}

/*
 * waitIfBackground checks to see if the program should
 * be run in the background and takes the appropriate
 * action by deciding to fork the process or not.
 * parameters: childPid, as integer; the childs process ID
 */
void JCShell::waitIfBackgrounded(int childPid) const {
	if (myCommandLine->noAmpersand() ||
		(!myCommandLine->noAmpersand() && string(myCommandLine->getCommand()) == "&")) {
		// wait for the child to finish
		waitpid(childPid, NULL, 0);
	} else {
		cout << "backgrounded process - pid " << childPid << endl;
	}
}

/* 
 * chooseCommand makes sure the command is not an empty 
 * string or "pwd".  If not, then it passes the command
 * runCommand.
 * Parameters: command, as string.
 */
void JCShell::chooseCommand(const string& command) const {
	if (command == "pwd") {
		cout << myPrompt.get() << endl;
	} else if (command != "") {
		runCommand(command);
	}
}

/*
 * runCommand runs the commend from the terminal.
 * Paremeters: command, as string.
 */
void JCShell::runCommand(const string& command) const {
	int dirIndex = myPath.find(command);
	if (dirIndex == -1) {
		cout << command << ": command not found" << endl;
	} else {
		char* environment[] = { NULL };
		string commandPath = myPath.getDirectory(dirIndex) + "/" + command;
		if (!myCommandLine->noAmpersand()) {
			myCommandLine->getArgVector()[myCommandLine->getArgCount() -1 ] = NULL;
		}
		if (execve(commandPath.c_str(), myCommandLine->getArgVector(), environment) == -1) {
			cout << command << ": execution failed" << endl;
		}
	}
}

/*
 * runCd runs the Cd command.
 */
void JCShell::runCd() {
	if ((myCommandLine->noAmpersand() && myCommandLine->getArgCount() != 2) ||
		(!myCommandLine->noAmpersand() && myCommandLine->getArgCount() != 3 )) {
		// check number of arguments
		cout << "cd: takes exactly one argument" << endl;
	} else {
		char* dirName = myCommandLine->getArgVector(1);
		// change directories, check for errors
		if (chdir(dirName) == -1) {
			cout << "cd: " << *dirName << ": No such file or directory" << endl;
		}
	}
}

/*
 * run is the main part of the JCShell class.
 * This method interacts with the user via a 
 * terminal.
 */
void JCShell::run() {
	while (true) {
		string command;
		myPrompt = Prompt();
		// print prompt
		cout << myPrompt.get() << "$ " << flush;
		myCommandLine = new CommandLine(cin);
		command = string(myCommandLine->getCommand());
		if (command == "") {
			// ignore empty input
		} else if (command == "cd") {
			// cd should not be run in another process
			runCd();
		} else if (command == "exit") {
			break;
		}
		else {
			// fork to run command in a different process
			pid_t pid = fork();
			if (pid != 0) {
				// we are in the parent process
				waitIfBackgrounded(pid);
			} else {
				// we are in the child process
				chooseCommand(command);
				exit(0);
			}
		}
		delete myCommandLine;
	}
}
