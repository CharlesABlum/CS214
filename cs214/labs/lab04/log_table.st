"logTable.sm displays a table of logarithms.

 Input: start, stop and increment, three Float values.
 PRE: start < stop and increment > 0.
 Output: A table of logarithms, with start and stop as its limits,
         with intervals of increment.

 Begun by: Dr. Adams, for CS 214 at Calvin College.
 Completed by:
"

| start stop increment |
"display log(start)..log(stop) by increment intervals"
start := (FillInTheBlank
                request: 'Enter the starting value: '
                initialAnswer: '1.0') asNumber asFloat.
stop := (FillInTheBlank
                request: 'Enter the stopping value: '
                initialAnswer: '10.0') asNumber asFloat.
increment := (FillInTheBlank
                request: 'Enter the increment value: '
                initialAnswer: '1.0') asNumber asFloat.

