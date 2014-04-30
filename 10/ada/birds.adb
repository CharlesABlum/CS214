-- birds.adb tests our Birds type
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by:Charles Blum
-- Date:24 April 2014
-----------------------------------------------------

with Ada.Text_IO, Bird_Package, WalkingBird_Package, FlyingBird_Package;
with Duck_Package, Goose_Package, Owl_Package;
with Penguin_Package, Ostrich_Package, Kiwi_Package;
use Ada.Text_IO, Bird_Package, WalkingBird_Package, FlyingBird_Package;
use Duck_Package, Goose_Package, Owl_Package;
use Penguin_Package, Ostrich_Package, Kiwi_Package;

procedure Birds is

 Bird1 : Bird_Type;       -- base class
 Bird2 : Duck_Type;       -- derived class 1
 Bird3 : Goose_Type;      -- derived class 2
 Bird4 : Owl_Type;        -- derived class 3
 Bird5 : Penguin_Type;    -- derived class 1
 Bird6 : Ostrich_Type;    -- derived class 2
 Bird7 : Kiwi_Type;      -- derived class 3

begin
 Init(Bird1, "Tweety");
 Put(Bird1); New_Line;

 Init(Bird2, "Donald");
 Put(Bird2); New_Line;

 Init(Bird3, "Mother");
 Put(Bird3); New_Line;

 Init(Bird4, "Woodsy");
 Put(Bird4); New_Line;

 Init(Bird5, "Popper");
 Put(Bird5); New_Line;

 Init(Bird6, "Ollie ");
 Put(Bird6); New_Line;

 Init(Bird7, "Karl  ");
 Put(Bird7); New_Line;

 New_Line;
end Birds;

