# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:29 April 2014
####################################################

require 'FlyingBird.rb'

class Duck < FlyingBird

  def call
    'Quack!'
  end

end

