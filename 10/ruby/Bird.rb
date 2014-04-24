# Bird.rb | Defines a Bird superclass to be extended by specific bird
#   sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:24 April 2014
####################################################

class Bird

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def call
    "Squaaaaaaaaaaaawk!"
  end

  def className
    self.class.to_s
  end

  def print
    puts name + ' ' + className + " says " + call
  end

end
