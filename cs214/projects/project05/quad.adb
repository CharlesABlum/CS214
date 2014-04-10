-- quad.adb computes the roots of a 2nd degree polynomial
--
-- Input: a, b, c, doulbes,
--        root1, root2, doubles.
-- Precondition: a, b, c, are real values.
-- Output: Error message for a given error
--         else the roots root 1 and root2
--
-- Begun by: Charles Blum, for CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date:12 March 2014
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_functions;

procedure quad is

   a, b, c      : Float;
   root1, root2 : Float;
   valid	: Boolean;

   ------------------------------------------------
   --  quadraticRoots() computes the roots of a 
   --  2nd degree polynomial.           
   -- Receive: a, b, c, doubles which are coefficients
   -- PRE: a, b, c, are real values.
   -- Passback: root1 - the first root,
   --           root2 - the second root.
   ------------------------------------------------
   procedure quadraticRoots( a, b, c : in Float; root1, root2 : out Float; valid : out Boolean ) is 
   arg: Float := b ** 2 - 4.0 * a * c;   
   begin
      if a = 0.0 then
	 Put_Line("a is Zero! Please try again.");
	 root1 := 0.0;
	 root2 := 0.0;
     	 valid := false;
      else
	 if arg >= 0.0 then
	    root1 :=  (-b + Sqrt(arg))  / ( 2.0 * a );
	    root2 :=  (-b - Sqrt(arg))  / ( 2.0 * a );
      	    valid := True;
	 else
	    Put_Line("b^2 - 4ac is is Negative! please try again.");
	    root1 := 0.0;
	    root2 := 0.0;
	 end if;
      end if;
   end quadraticRoots;

begin                                           -- Prompt for input
   Put_Line("To find the roots of a quadratic equation,");
   Put_Line("(form y = ax^2 + bx + c) please enter the coefficients:");
   Put("a=");
   Get(a);
   Put("b=");
   Get(b);
   Put("c=");
   Get(c);

   quadraticRoots(a, b, c, root1, root2, valid);
   if valid then
     Put("The first root is ");
     Put(root1);
     New_Line;
     Put(" and the second root is ");
     Put(root2);
   end if;
end quad;

