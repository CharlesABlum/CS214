-- duck_package.adb gives Penguin-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:24 April 2014
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is

 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())          -
 -- Receive: A_Penguin, a Penguin_Type.                   -
 -- Return: "huh-huh-huuuuuuh!"                                -
 ----------------------------------------------------
 function Call(A_Penguin : in Penguin_Type) return String is
 begin
   return "huh-huh-huuuuuuh!";
 end Call;

 ------------------------------------------------------------
 -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
 -- Receive: A_Penguin, a Penguin_Type.                          -
 -- Return: "Penguin".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Penguin : in Penguin_Type) return String is
 begin
   return "Penguin";
 end Type_Name;

end Penguin_Package;
