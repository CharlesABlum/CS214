-- flyingbird_package.ads gives flying bird-related
-- declarations, and derives a flying brid from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:29 April 2014
---------------------------------------------------

with Bird_Package; use Bird_Package;

package FlyingBird_Package is

  type FlyingBird_Type is new Bird_Type with private;

 -----------------------------------------------------
 -- Determine type of a flying bird                 -
 -- (Over-rides Bird.Movement())                     -
 -- Receive: FB, a FlyingBird_Type                  -
 -- Return: "flew past".                           -
 -----------------------------------------------------
 function Movement(FB : in FlyingBird_Type) return String;

private
  type FlyingBird_Type is new Bird_Type with
    record
      null;
    end record;

end FlyingBird_Package;
