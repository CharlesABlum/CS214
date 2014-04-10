/*
 * CommandLine.cpp
 *
 *  Created on: Mar 12, 2014
 *      Author: jgl5
 */

#include "CommandLine.h"
#include <string.h>
#include <iostream>
using namespace std;

CommandLine::CommandLine() {
	argc = 0;
	argVector = vector<char*>();
	argv = NULL;
}

CommandLine::CommandLine(istream& in) {
	// thanks to Micah for giving me the cool idea of using a vector
	// which is guaranteed to use contiguous memory
	argc = 0;
	argVector = vector<char*>();
	bool readingWord = false;
	string word = "";
	char ch;
	while (true) {
		ch = in.get();
		if (ch == ' ' || ch == '\t' || ch == '\n') {
			if (readingWord) {
				argVector.push_back(new char [word.length() + 1]);
				strcpy(argVector[argc], word.c_str());
				readingWord = false;
				argc++;
			}
			if (ch == '\n') {
				break;
			}
		} else {
			if (!readingWord) {
				readingWord = true;
				word = "";
			}
			word.push_back(ch);
		}
	}
	argVector.push_back(NULL);
	argv = &(argVector[0]);
}

CommandLine::~CommandLine() {
	if (argc > 0) {
		for (int i = 0; i < argc; i++) {
			delete [] argv[i];
		}
	}
	// don't delete argv, as it is part of argVector
	// it will get cleaned up when argVector is destroyed
}

char* CommandLine::getCommand() const {
	if (argc > 0) {
		return argv[0];
	}
	return "";
}

int CommandLine::getArgCount() const {
	return argc;
}

char** CommandLine::getArgVector() const {
	return argv;
}

char* CommandLine::getArgVector(int i) const {
	return argv[i];
}

bool CommandLine::noAmpersand() const {
	if (argc == 0) {
		return false;
	}
	return (! strcmp("&", argv[argc - 1]) == 0);
}
