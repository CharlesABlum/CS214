# array.rb takes a specified number of inputs from the  
# user and prints them back out.
#
# Begun by:Charles Blum, for CS 214 at Calvin College.
# Completed by:: Charles Blum
# Date: 02 April 2014
########################################################

###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################

def readArray( someArray, size ) 
  for i in 0..(size-1)
    someArray.push( gets.to_f )
  end
  someArray
end 

def writeArray(someArray)
  someArray.each { |i| puts( i ) }
end

def main
  puts "enter the size of the array: "
  size = gets.to_i

  puts "enter #{size} values: "
  someArray = []

  readArray( someArray, size )
  writeArray( someArray )
end

main

