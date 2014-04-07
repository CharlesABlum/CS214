# namer.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 06 April 2014
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name
  #default constructor
  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  #getters for the instance variables
  attr_reader :first, :middle, :last

  #fullName creates a string which contains the
  #full name of the person
  def fullName
    myFullName = @first + " " + @middle + " " + @last
  end

  #print prints the full name out
  #and returns the name as a string
  def print
    puts(fullName)
    fullName
  end
end

def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

testName

