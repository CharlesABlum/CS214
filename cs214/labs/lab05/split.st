"split.sm is a Smalltalk 'program' to split a string into substrings.
  Dr. Adams, for CS 214 at Calvin College.
  Input: aString, the string to be split,
         pos, the split position.
  PRE: 0 <= pos < the length of aString.
  Output: the substring of aString before pos, and
          the substring of aString from pos onwards.
"
| aString pos result part1 part2|
aString := FillInTheBlank request: 'Enter the string to be split '
                initialAnswer: 'hello'.

pos := (FillInTheBlank request: 'Enter the split position: '
                initialAnswer: '3') asNumber asInteger.

result := aString split: pos.
part1 := result at: 1.
part2 := result at: 2.

Transcript cr;
        show: 'The first string is ';
        show: part1;
        cr;
        show: ' and the second string is ';
        show: part2.

