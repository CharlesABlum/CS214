%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str) {
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap() {
        return 1;
} 
  
main() {
        yyparse();
} 

%}

%token NUMBER TOKHEAT STATE TOKSET TOKTEMPERATURE
%%

commands: /* empty */
        | commands command
        ;

command:
        heat_switch
        | temperature_set
        ;

heat_switch:
        TOKHEAT STATE
        {
		if ($2) { /* if STATE == 1 */
			printf("\tHeat turned on\n");
		} else {
			printf("\tHeat turned off\n");	 
		}
        }
        ;

temperature_set:
        TOKSET TOKTEMPERATURE NUMBER
        {
                printf("\tTemperature set to %d\n", $3);
        }
        ;
%%
