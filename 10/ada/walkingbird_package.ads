-- walkingbird_package.ads gives walking bird-related
-- declarations, and derives a walking brid from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:29 April 2014
---------------------------------------------------

with Bird_Package; use Bird_Package;

package WalkingBird_Package is

  type WalkingBird_Type is new Bird_Type with private;

 -----------------------------------------------------
 -- Determine type of a walking bird                 -
 -- (Over-rides Bird.Movement())                     -
 -- Receive: WB, a WalkingBird_Type                  -
 -- Return: "walked past".                           -
 -----------------------------------------------------
 function Movement(WB : in WalkingBird_Type) return String;

private
  type WalkingBird_Type is new Bird_Type with
    record
      null;
    end record;

end WalkingBird_Package;
