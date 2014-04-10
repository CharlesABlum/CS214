-- array.adb takes input from a user and prints it.
--
-- Begun by:Charles Blum, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date: 02 April 2014
-----------------------------------------------

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; -- Put(Integer)
with Ada.Text_IO; use Ada.Text_IO;                 -- Put(String)
--with Ada.Float_Text_IO; use Ada.Float_Text_IO;     -- Put(Float)

procedure arraymanipulation is

-- Declare Vector type
type Vector is array(Positive range <>) of Integer;
size : Positive := 1;

----------------------------------------------
-- readArray reads in the number of values   -
-- specified by the user.                    -
-- Receive: the array, A                     -
----------------------------------------------
procedure readArray( A : in out Vector ) is
value : Integer := 0;
begin 
  for I in A'Range
  loop
    Get(value);
    A(i) := value;
  end loop;
end readArray;

----------------------------------------------
-- writeArray writes the array to the user   -
-- Receive: the array, A                     -
----------------------------------------------
procedure writeArray( A : in out Vector ) is
begin 
  for I in A'Range
  loop
    Put( A(I) );
    Put( " " );
  end loop;
end writeArray;

begin
  Put("Enter a size for the array: ");
  Get(size);
  New_line;

  declare
    anArray : Vector(1..size);
  begin
    readArray(anArray);
    writeArray(anArray);
  end;
end arrayManipulation;

