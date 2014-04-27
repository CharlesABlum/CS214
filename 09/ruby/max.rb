# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 21 April 2014

require 'List'

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(55).append(44).append(33).append(22).append(11)

list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts "The index of 99 is: #{list1.getIndex(99)}"

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts "The index of 99 is: #{list2.getIndex(99)}"

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts "The index of 99 is: #{list3.getIndex(99)}"

list4.print 
puts
puts "Maximum of list43: #{list4.max}"
puts "The index of 99 is: #{list4.getIndex(99)}"

