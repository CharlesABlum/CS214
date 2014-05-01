# Goose.rb | Defines the Goose class which inherits
# attributes and methods from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:29 April 2014
####################################################

require 'FlyingBird.rb'

class Goose < FlyingBird

  def call
    'Honk!'
  end

end

