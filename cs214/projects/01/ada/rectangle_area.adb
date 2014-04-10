-- rectangle_area.adb computes the area of a rectangle
--
-- Input:	 height and width of the rectangle
-- Precondition: height and width are both positive
-- Output:	 The area of said rectangle
--
-- Begun by:	 Charles Blum on 06 Feb 2014
-- Completed by: Charles Blum on 
-- Class:	 CS 214
------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure rectangle_area is

	height, width, area : float;

   -- function rectangeArea calculates a rectangle's area, given height and width
   -- Parameter(s):	heigth, width, both floats
   -- Precondition:	( height && width ) >= 0.0
   -- Return:		Area of the rectangle
   ------------------------------------------------------------------------------
   function rectangleArea(height, width: in float) return float is
   begin
	return height * width;
   end rectangleArea;

-- main
-----------------------------------------------------------
begin
   Put_Line("To calculate the are of a rectangle,");
   Put("enter its height: ");
   Get(height);
   Put("enter its width: ");
   Get(width);

   area := rectangleArea(height, width);

   Put("The area is ");
   Put(area);
   New_Line;
end rectangle_area;
