# temp.rb tests the Temperature class and its 
# operations.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 15 April 2014
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions
require './Temperature'


def testTemp
  # seed values for the base and limit Temps
  baseTemp = Temps::Temperature.new( 0.0, 'F' )
  limitTemp = Temps::Temperature.new( 100.0, 'F' )
  print("Enter a base Temperature: ")
  baseTemp.readIn
  print("Enter a limit Temperature: ")
  limitTemp.readIn
  puts("Now enter a step value: ")
  step = gets.to_f

  while baseTemp.lessThan( limitTemp )
    baseTemp.writeOut
    baseTemp.raiseTemp( step )
  end
end

testTemp

