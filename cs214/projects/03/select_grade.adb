-- selectGrade.adb converts numeric grade to letter grade.
--
-- Begun by: Charles Blum for cs 214 at Calvin College.
--
-- Input: grade, as integer
-- Precondition: 0 <= grade <= 100
-- Output: corresponding letter grade: A,B,C,D,F
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure select_grade is

  numGrade : integer;
   
function selectGrade (numGrade : integer) return character is
begin 
  case numGrade is
    when 90..100 =>	return 'A';
    when 80..89 =>	return 'B';
    when 70..79 =>	return 'C';
    when 60..69 =>	return 'D';
    when 0..59 =>	return 'F';
    when others =>	return '0';
  end case;
end selectGrade;

begin                                          
   Put("Enter numeric grade from 0-100: ");    -- Prompt for input
   Get(numGrade);   	               -- Input
   Put( selectGrade(numGrade) );                      -- Convert and output
   New_Line;
end select_grade;
