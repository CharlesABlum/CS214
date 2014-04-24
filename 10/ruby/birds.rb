# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:24 April 2014
######################################################

require 'Duck.rb'
require 'Goose.rb'
require 'Owl.rb'

def testBirds
  bird0 = Bird.new "Hawkeye"
  bird0.print

  bird1 = Duck.new "Donald"
  bird1.print

  bird2 = Goose.new "Mother"
  bird2.print

  bird3 = Owl.new "Woodsey"
  bird3.print
end 

testBirds
