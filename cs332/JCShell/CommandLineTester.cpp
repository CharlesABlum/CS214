/*
 * CommandLineTester.cpp
 *
 *  Created on: Mar 12, 2014
 *      Author: jgl5
 */

#include <iostream>
#include <sstream>
#include <assert.h>
#include <string.h>
#include "CommandLineTester.h"
#include "CommandLine.h"
#include "Prompt.h"
#include "Path.h"
#include "JCShell.h"

using namespace std;

CommandLineTester::CommandLineTester() {


}

void CommandLineTester::run() {
	cout << "running tests..." << endl;

//	CommandLine* cl = new CommandLine(cin);
//	//cl = CommandLine(cin);
//	char* word = cl.getCommand();
//	cout << word << endl;
//	assert(strcmp(cl.getCommand(), "ls") == 0);

	stringstream stream;
	stream << "ls -l -r\n";
	CommandLine cmd(stream);
	assert(cmd.getArgCount() == 3);
	assert(strcmp(cmd.getCommand(), "ls") == 0);
	assert(string(cmd.getCommand()) == "ls");
	assert(strcmp(cmd.getArgVector(0), "ls") == 0);
	assert(strcmp(cmd.getArgVector(1), "-l") == 0);
	assert(strcmp(cmd.getArgVector(2), "-r") == 0);
	assert(cmd.noAmpersand() == true);

	CommandLine cmd2;
	assert(cmd2.getArgCount() == 0);
	assert(strcmp(cmd2.getCommand(), "") == 0);

	stream << " vim & \n " << endl;
	CommandLine cmd3(stream);
	assert(cmd3.noAmpersand() == false);
	cout << "CommandLine passed tests" << endl;

	cout << "testing Prompt" << endl;
	Prompt prompt = Prompt();
	cout << "constructor done" << endl;
	assert(prompt.get() != "");
	cout << "cwd: " << prompt.get() << endl;
	cout << "prompt passed tests" << endl;

	cout << "testing Path" << endl;
	Path path = Path();
	cout << "constructor done" << endl;
	assert(path.find("ls") != -1);
	int binIndex = path.find("ls");
	assert(path.find("thisisnotaprogram") == -1);
	cout << binIndex << endl;
	assert(path.getDirectory(binIndex) == "/bin");
	assert(path.getDirectory(-1) == "");
	assert(path.getDirectory(9000) == "");
	cout << "path passed tests" << endl;

	cout << "running shell" << endl;
	JCShell shell = JCShell();
	shell.run();

}
