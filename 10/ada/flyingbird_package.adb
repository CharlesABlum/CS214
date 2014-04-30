-- flyingbird_package.adb gives flyingbird-related
-- definitions by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:29 April 2014
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body FlyingBird_Package is

 ----------------------------------------------------
 -- A FlyingBird's movement (Over-rides             -
 -- Bird.movement())                                -
 -- Receive: FB, a FlyingBird_Type.                 -
 -- Return: "flew past"                                 -
 ----------------------------------------------------
 function Movement(FB : in FlyingBird_Type) return String is
 begin
   return "flew past";
 end Movement;

end FlyingBird_Package;
