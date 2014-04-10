Script started on Thu 06 Feb 2014 09:39:21 AM EST
cab35@englebart:~/Documents/cs214/labs/02$ cat circle_area.adb
-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Dr. Nelesen, CS 214 at Calvin College.
-- Completed by: Charles Blum
-- Date: 06 February 2014
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO; -- go get/find these two libraries --
use  Ada.Text_IO, Ada.Float_Text_IO; -- now that you knwo where they are include them with the compilation --

procedure circle_area is	-- definition of the class circle_area --

   radius, area : float;	-- This creates two global float variables radius and area --

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is -- def'n of the the function circleArea --
      PI : constant := 3.1415927; 	-- A constant named PI is defined within the scope of the function --
   begin			  	-- Execution of the function circleArea begins --
      return PI * r ** 2;		-- Calculates and returns the area --
   end circleArea;			-- End of the function circleArea --

begin                          		-- begin the main program (i.e. int main in C++ ) -- 
   Put_Line("To compute the area of a circle,");-- Output to user and move to next line --
   Put("enter its radius: ");			-- Output to user on a new line --
   Get(radius);					-- Gets input from the user and assigns it to radius --

   area := circleArea(radius);	-- calls circleArea using radius and store the returned value in area --

   Put("The area is ");		-- Output to user --
   Put(area);			-- Output the value of area to user (on the same line) --
   New_Line;			-- Create a new line --
end circle_area;		-- End of the class circle_area --
cab35@englebart:~/Documents/cs214/labs/02$ gnatmake circle_area.da[K[Kadv[Kb
gnatmake: "circle_area" up to date.
cab35@englebart:~/Documents/cs214/labs/02$ ./circle_area 
To compute the area of a circle,
enter its radius: 1
The area is  3.14159E+00
cab35@englebart:~/Documents/cs214/labs/02$ ./circle_area 
To compute the area of a circle,
enter its radius: 2
The area is  1.25664E+01
cab35@englebart:~/Documents/cs214/labs/02$ ./circle_area 
To compute the area of a circle,
enter its radius: 2.5
The area is  1.96350E+01
cab35@englebart:~/Documents/cs214/labs/02$ ./circle_area 
4.99999
To compute the area of a circle,
enter its radius: The area is  7.85395E+01
cab35@englebart:~/Documents/cs214/labs/02$ exit

Script done on Thu 06 Feb 2014 09:41:00 AM EST
