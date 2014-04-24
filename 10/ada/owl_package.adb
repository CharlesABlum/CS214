-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:24 April 2014
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is


 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: An_Owl, an Owl_Type.                   -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
 function Call(A_Owl : in Owl_Type) return String is
 begin
   return "Hooo!";
 end Call;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Owl, an Owl_Type.                    -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
 function Type_Name(A_Owl : in Owl_Type) return String is
 begin
   return "Owl";
 end Type_Name;

end Owl_Package;
