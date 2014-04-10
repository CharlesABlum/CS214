Script started on Fri 07 Feb 2014 09:09:36 AM EST
cab35@boole:~/Documents/cs214/projects/01/ruby$ cat r[Krectangle_area.rb 
#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectanlge given its height and width
# 
# Input: height and width of the rectangle
# Precondition: the height and width are not negative
# Output: the area of the rectangle
#
# Begun by: 	Charles Blum on 06 Feb 2014
# Completed by:	Charles Blum on 06 Feb 2014
# Class:	CS 214
###############################################################

# function rectangleArea returns a circle's area, given its radius
# Parameters: h and w, both numbers
# Precondition: (h && w) > 0.
# Returns: the area of the rectangle height by width.
def rectangleArea(h, w)
   h * w
end

if __FILE__ == $0
   print "Enter the height: "
   height = gets.chomp.to_f
   if height < 0
	height *= -1
   end
   print "Enter the width: "
   width = gets.chomp.to_f
   if width < 0 
	width *= -1
   end
   print "Area is: "
   puts rectangleArea(height, width)
end

cab35@boole:~/Documents/cs214/projects/01/ruby$ ruby rectangle_area.rb 
Enter the height: 1
Enter the width: 4
Area is: 4.0
cab35@boole:~/Documents/cs214/projects/01/ruby$ ruby rectangle_area.rb 
Enter the height: -1  
Enter the width: 5.34
Area is: 5.34
cab35@boole:~/Documents/cs214/projects/01/ruby$ ruby rectangle_area.rb 
Enter the height: 3.456
Enter the width: -9
Area is: 31.104
cab35@boole:~/Documents/cs214/projects/01/ruby$ exit

Script done on Fri 07 Feb 2014 09:12:15 AM EST
