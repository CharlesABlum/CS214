#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College 
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def selectGrade grade
case grade
  when 90..100 then "A"
  when 80..89  then "B"
  when 70..79  then "C"
  when 60..69  then "D"
  when 0..59   then "F"
  else "invalid grade"
end

end

if __FILE__ == $0
   print "Enter the numeric grade: "
   grade = gets.chomp.to_f
   print "The letter grade is: "
   puts selectGrade(grade)
end

