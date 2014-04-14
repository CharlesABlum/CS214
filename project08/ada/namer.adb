-- namer.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Charles Blum
-- Date: 13 April 2014
----------------------------------------------

with Ada.Text_IO, Name_Package;
use Ada.Text_IO, Name_Package;

procedure namer is
   
   aName : Name_Package.Name;
   
begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ",
                   "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", 
                   "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", 
                   "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ",
                    "getFullName() failed");
   Put(aName); New_line;
   Put("All tests passed!"); New_line;
end namer;

