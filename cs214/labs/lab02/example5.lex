%{
#include <stdio.h>
#include "example4.tab.h"
%}
%%
[0-9]+                  yylval = atoi(yytext); return NUMBER;
heat                    return TOKHEAT;
on|off                  yylval = !strcmp(yytext,"on"); return STATE;
set                     return TOKSET;
temperature             return TOKTEMPERATURE;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%
