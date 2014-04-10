/*
 * shell.cpp - JC Shell program. Run to open a basic command line shell.
 * Includes the basic commands ``cd`` and ``pwd``.
 *
 * James Lamine and Charles Blum
 * CS 232
 * Project 3
 * Calvin College
 * 03/20/2014
 *
 */

//#include "CommandLineTester.h"
#include "JCShell.h"

int main() {
	//CommandLineTester clTester;
	//clTester.run();
	JCShell shell = JCShell();
	shell.run();
}
