-- factorial.adb computes the factorial of a integer, n
--
-- Input: n, an integer
-- Precondition: n >= 0 
-- Output: n!
--
-- Begun by: Charles Blum, for CS 214 at Calvin College.
-- begon on: 4 March 2014
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_functions;
use  Ada.Numerics.Elementary_functions;

procedure factorial is

  n, f: Integer;

  function compute_factorial(n: in Integer) return Integer is
  begin
    f := 1;
    for i in Integer range 1 .. n loop
      f := f * i;
    end loop;

    return f;
  end compute_factorial;


begin                                           -- Prompt for input
  Put_line("Calculate the n-th factorial of a number.");
  Put("Enter a number n: ");
  Get(n);
  New_line;
  Put(n);
  Put("! = ");
  Put(compute_factorial(n));
end factorial;

