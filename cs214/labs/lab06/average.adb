-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date: 20 March 2014
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

-- Declare Vector type
type Vector is array(Positive range <>) of Float;
-- Define array0 as an array containing no values
array0 : Vector := (0.0, 0.0);
-- Define array1 as an array containing 9, 8, 7, 6
array1 : Vector := (6.0, 7.0, 8.0, 9.0);

----------------------------------------------
-- sum() sums the values in an array           -
-- Receive: anArray, an array of numbers     -
-- Return: the sum of the values in anArray. -
----------------------------------------------

function sum( a: Vector ) return Float is
Total : Float := 0.0;
begin 
  for I in A'Range
  loop
    Total := Total + A(I);
  end loop;
  return Total;
end sum;

function computeAverage( a: Vector ) return Float is
Total : Float := 0.0;
begin
  Total := sum(a);
  return Total / Float( a'Length );


end computeAverage;

begin
   Put(" average 0 is ");
   Put( computeAverage(array0) );
   New_line;
   Put(" average 1 is ");
   Put( computeAverage(array1) );
   New_line;
end average;

