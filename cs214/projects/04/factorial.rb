#! /usr/bin/ruby
# factorial.rb displays the factorial of a number
#
# Begun by: Charles Blum, for CS 214 at Calvin College.
# Begun on: 4 March 2014
#
# Input:  n, an integer
# Precondition: n is >= 0
# Output: The factorial of n 

def comp_factorial(n)
  f = 1
  for i in 1..n
    f *= i
  end
  f
end

if __FILE__ == $0
  print "This program calculates the factorial of a number:"
  print "Enter a number n:"
  n = gets.chomp.to_i

  puts "#{n}! = #{comp_factorial(n)}"
end

