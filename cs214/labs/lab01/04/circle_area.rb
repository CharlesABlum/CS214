#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 06 February 2014
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.
PI = 3.1415927			#defines a constant PI
def circleArea(r)		#defines a function circleArea and expects a parameter r
    PI * r ** 2 		#calculates the area
end				#returns the value

if __FILE__ == $0		#eqv. to int main
   print "Enter the radius: "	#output to terminal for the user
   radius = gets.chomp.to_f	#gets the radius from the user
   print "Area is: "		#output to terminal for the user
   puts circleArea(radius)	#append the returned value from circleArea to the terminal
end				#end of int main
