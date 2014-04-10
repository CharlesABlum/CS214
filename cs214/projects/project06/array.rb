# array.rb takes a specified number of inputs from the  
# user and prints them back out.
#
# Begun by:Charles Blum, for CS 214 at Calvin College.
# Completed by:: Charles Blum
# Date: 02 April 2014
########################################################

###############################################
# readArray reads in the values from the user
# Receive: the array of size 0.
################################################
def readArray( someArray, size ) 
  for i in 0..(size-1)
    someArray.push( gets.to_f )
  end
  someArray
end 

###############################################
# wrietArray writes out the array to the user
# Receive: the array of size n.
################################################
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

