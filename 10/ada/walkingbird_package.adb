-- walkingbird_package.adb gives walkingbird-related
-- definitions by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:29 April 2014
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body walkingBird_Package is

 ----------------------------------------------------
 -- A WalkingBird's movement (Over-rides             -
 -- Bird.movement())                                -
 -- Receive: WB, a FlyingBird_Type.                 -
 -- Return: "walked past"                                 -
 ----------------------------------------------------
 function Movement(WB : in WalkingBird_Type) return String is
 begin
   return "walked past";
 end Movement;

end WalkingBird_Package;
