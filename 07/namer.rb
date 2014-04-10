# namer.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 09 April 2014
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name
  #default constructor
  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  #getters and setters for the instance variables
  attr_accessor :first, :middle, :last

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

  #return a name in last, first (middle initial) format
  def lfmi
    myLFMI = @last + ", " + @first + " " + @middle.chars.first + "."
  end

  #read in a new full name from the user
  def readName
    puts("\nEnter a new full name:\n")
    @first = gets
    @middle = gets
    @last = gets
  end
end

def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   print "lab07 tests passed!\n\n"

   name.first, name.middle, name.last  = "Paul", "John", "Smith"
   assert name.first == "Paul", "first failed"
   assert name.middle == "John", "middle failed"
   assert name.last == "Smith", "last failed"
   assert name.lfmi == "Smith, Paul J.", "lfmi failed"
   name.readName
   assert name.first != "Paul", "first failed"
   assert name.middle != "John", "middle failed"
   assert name.last != "Smith", "last failed"
   print "Project07 tests passed!\n"

   print "All tests passed!\n"
end

testName

