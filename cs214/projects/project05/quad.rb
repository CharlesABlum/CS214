# quad.rb computes the roots of a 2nd degree polynomial
# using the quadratic formula
#
# Input: a, b, c, the coefficients of the polynomial.
# Precondition: a, b, and c are real numbers.
# Output: error message accordingly if coefficients don't
#         return a real number, other wise root1 and root2.
#
# Begun by: Charles Blum, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date: 12 March 2014
##################################################################


# quadraticRoots() computes the roots using the quadratic formula
# Receive: a, b, c, the polynomial coefficients,  
# PRE: a, b, c are all real numbers.
# Return: root1, root2, the calculated roots, 
#         valid, determines if an error occured during calculation
##################################################################

def quadRoots( a, b, c )
  #form of roots: [ validity (boolean), root1 (float), root2 (float) ]
  if a == 0
    puts "Coefficient a is Zero! Please try again.";
    roots = [ false, 0.0, 0.0]
  else
    arg = ((b ** 2) - (4 * a * c))
    if arg < 0
      puts "b^2 - 4ac is negative! Please Try again.";
      roots = [ false, 0.0, 0.0 ]
    else
      roots = [ true, ((-b + Math.sqrt(arg))/(2 * a)), ((-b - Math.sqrt(arg))/(2 * a)) ]
    end
  end
end 

def main
  puts "Calculate the roots of a 2nd degree polymonial"; 
  puts "( y = ax^2 + bx + c ) using the quadratic formula:";
  print "a=";
  a = gets.to_f
  print "b="; 
  b = gets.to_f
  print "c="; 
  c = gets.to_f
  roots = quadRoots( a, b, c )
  if roots[0]
    puts "The first root is: #{roots[1]}";
    puts "and the second root is: #{roots[2]}";
  end
end

main
