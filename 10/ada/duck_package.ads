-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:24 April 2014
---------------------------------------------------

with FlyingBird_Package; use FlyingBird_Package;

package Duck_Package is
 type Duck_Type is new FlyingBird_Type with private;

 ----------------------------------------------------
 -- A Duck's Call (Over-rides Bird.Call())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
 function Call(A_Duck : in Duck_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 -- Receive: A_Duck, a Duck_Type.                          -
 -- Return: "Duck".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Duck : in Duck_Type) return String;

private
  type Duck_Type is new FlyingBird_Type with 
    record
      null;
    end record;

end Duck_Package;
