# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:Charles Blum
# Date:28 April 2014
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   # initialize a List to be empty
   # Postcondition: first == nil and last == nil and length == 0
   def initialize
      @first, @last, @length  = nil, nil, 0
   end #init

   # create reader method for length
   def getLength
      @length
   end #getLength

   # Am I empty?
   # Return: length == 0
   def empty?
      @length == 0
   end #empty?
  
   # append a value to me
   # Receive: value, the item to be appended
   # Postcondition: my last item is value and
   #                 my length is one more than it was
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end #if

      @last = newNode
      @length += 1
      self
   end #append


   # print my items
   # Postcondition: my items have been displayed to the screen
   def print 
      temp = @first
      while !temp.nil?
	 printf " #{temp.value}"
	 temp = temp.next
      end #while
   end #print

   # find my maximum item
   # Return: my maximum item
   def max
      temp = @first
      maxValue = -999999
      while !temp.nil?
	 if temp.value > maxValue
	    maxValue = temp.value
 	 end #if
	 temp = temp.next
      end #while
      maxValue
   end #max
   
   # find the index of nubmer 
   # Return: the index of number
   def getIndex(number)
      temp = @first
      indexOf = 0
      realIndex = -1
      while !temp.nil?
	if temp.value == number
	   realIndex = indexOf 
 	end #if
	temp = temp.next
	indexOf += 1
      end #while
      realIndex
   end #getIndex

   class Node
      def initialize(item, link)
         @value = item
 	 @next = link
      end #init

      attr_reader :value
      attr_accessor :next
   end #Node

end #List

