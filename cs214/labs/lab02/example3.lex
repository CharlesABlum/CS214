%{
#include <stdio.h>    /* printf() */
#include <stdlib.h>   /* atof()   */
%}

DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*

%%

{DIGIT}+ {
	printf( "INTEGER: %s (%d)\n", yytext,
		atoi( yytext ) );
}

{DIGIT}+"."{DIGIT}* {
	printf( "DOUBLE: %s (%g)\n", yytext,
	       atof( yytext ) );
}

class|int|double|public|private {
	printf( "KEYWORD: %s\n", yytext );
	}

{ID}	printf( "IDENTIFIER: %s\n", yytext );

":"|"{"|"}"|"("|")"|";"|"," printf( "PUNCTUATION: %s\n", yytext );

"="	printf( "OPERATOR: %s\n", yytext );

[ \t\n]+ /* eat up whitespace */

.	printf( "Unrecognized character: %s\n", yytext);

%%
