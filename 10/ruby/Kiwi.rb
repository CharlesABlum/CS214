# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:29 April 2014
####################################################

require 'WalkingBird.rb'

class Kiwi < WalkingBird

  def call
    'Tweet!'
  end

end

