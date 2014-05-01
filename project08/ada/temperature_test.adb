-- temperature_test.adb tests the Temperature type.
--
-- Begun by: Charles Blum, 214 at Calvin College.
-- Completed by: Charles Blum
-- Date: 15 April 2014
---------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Temperature;
use  Ada.Text_IO, Ada.Float_Text_IO, Temperature;

---------------------------------------------------------
-- Input: baseTemp, a Temperature;
--        limitTemp, a Temperature; and
--        stepValue, a real.
-- Output: A table of Fahrenheit, Ranking, Celsius, and
--         Kelvin temperature values, beginning with
--	   baseTemp, ending with limitTemp, and having
--	   increments of stepValue. (Note: stepValue should
--         be assumed to have the same scale as baseTemp.)
---------------------------------------------------------
procedure temperature_test is

  baseTemp, limitTemp : Temperature.Temp;
  stepValue, loopBase, loopLimit : Float := 0.0;

begin
  Put_line("Enter a base Temperature:");
  readIn( baseTemp );
  
  Put_Line("Now enter a limit Temperature: ");
  readIn( limitTemp );
  Put("Now enter a stepValue: ");
  get(stepValue);

  while lessThan( baseTemp, limitTemp )
  loop
    writeOut( baseTemp );
    raiseTemp( baseTemp, stepValue );
  end loop;

end temperature_test;
