-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:24 April 2014
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is
 Bird1 : Bird_Type;
 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type in which My_Name = Name.    -
 ----------------------------------------------------
 procedure Init(A_Bird : out Bird_Type; Name : in String) is
 begin
   A_Bird.My_Name := Name;
 end Init;

 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
 function Name(A_Bird : in Bird_Type) return String is
 begin
   return A_Bird.My_Name;
 end Name;

 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
 function Call(A_Bird : in Bird_Type) return String is
 begin
   return "Squawwwwwwk!";
 end Call;

 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
 function Type_Name(A_Bird : in Bird_Type) return String is
 begin
   return "Bird";
 end Type_Name;

 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
 procedure Put(A_Bird : in Bird_Type'Class) is
 begin
   Put( Name(A_Bird) );
   Put( ' ' );
   Put( Type_Name(A_Bird) );
   Put( " says " );
   Put( Call(A_Bird) );
 end Put;

end Bird_Package;

