# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:29 April 2014
####################################################

require 'FlyingBird.rb'

class Owl < FlyingBird

  def call
    'Hooo!'
  end

end
