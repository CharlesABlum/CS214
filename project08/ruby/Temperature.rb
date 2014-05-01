# Temperature.rb defines the Temperature class 
# and its operations. 
#
# Begun by: Charles Blum, for CS 214 at Calvin College.
# Completed by: Charles Blum
# Date: 15 April 2014
####################################################
module Temps
class Temperature

  def initialize(value, unit)
    @value, @unit = value, unit
  end

  #####################################
  # getters and setters for Temperature
  #####################################
  attr_reader :value, :unit

  ################################
  # converts any temp scale to F
  ################################
  def toF
    if @unit == 'C' then
      @unit = 'F'
      @value = 1.8 * @value + 32.0
    elsif @unit == 'R' then
      @unit = 'F'
      @value -= 459.67
    elsif @unit == 'K' then
      @unit = 'F'
      @value = 1.8 * @value - 459.67
    end
    self
  end

  ################################
  # converts any temp scale to C
  ################################
  def toC
    if @unit == 'F' then
      @unit = 'C'
      @value = 5.0 / 9.0 * (@value - 32.0)
    elsif @unit == 'R' then
      @unit = 'C'
      @value = 5.0 / 9.0 * @value - 273.15
    elsif @unit == 'K' then
      @unit = 'C'
      @value -= 273.15
    end
    self
  end

  ################################
  # converts any temp scale to R
  ################################
  def toR
    if @unit == 'F' then
      @unit = 'R'
      @value += 459.67
    elsif @unit == 'C' then
      @unit = 'R'
      @value = 1.8 * @value + 491.67
    elsif @unit == 'K' then
      @unit = 'R'
      @value *= 1.8
    end
    self
  end

  ################################
  # converts any temp scale to K
  ################################
  def toK
    if @unit == 'F' then
      @unit = 'K'
      @value = 5.0 / 9.0 * (@value + 459.67)
    elsif @unit == 'C' then
      @unit = 'K'
      @value += 273.15
    elsif @unit == 'R' then
      @unit = 'K'
      @value *= 5.0 / 9.0
    end
    self
 end

  ###################################
  # changes the Temp by step degrees
  ###################################
  def raiseTemp( step ) 
    if step < 0.0 then lowerTemp( -1.0 * step )
    else
        @value += step
    end 
    self
  end

  ###################################
  # changes the Temp down by step
  # degrees.  It also checks for out
  # of bounds temps.
  ###################################
  def lowerTemp( step )
    if step < 0.0 then raiseTemp( -1.0 * step )
    else
      val = @value - step
      if isValid( val, @unit ) then
        @value = val
      end 
    end 
    self
  end

  ###################################
  # equals checks two temps for 
  # equality
  ###################################
  def equals( t2 )
    t1 = self.clone
    t1.toK
    t2.toK
    if t1.value == t2.value then return true
    else return false
    end
  end

  ################################
  # checks if the first Temp is 
  # less than the second
  ################################
  def lessThan( t2 )
    t1 = self.clone
    t1.toK
    t2.toK
    if t1.value < t2.value then return true
    else return false
    end
  end

  ################################
  # Checks the validity of the  
  # combination of value and unit
  ################################
  def isValid( val, unit )
    if  unit != 'F' && unit != 'C' && unit != 'R' && unit != 'K' then
      return false
    elsif val < 0.0 && (unit == 'K' || unit == 'R') then
      return false
    elsif val < -273.15 && unit == 'C' then
      return false
    elsif val < -459.67 && unit == 'F' then
      return false
    else
      return true
    end
  end

  ################################
  # reads a temperature from the 
  # command line.  checks for 
  # validity of the temp as well
  ################################
  def readIn
    puts("The format is xxx.xx A where xxx.xx is a real value\n")
    puts("and A is a character representing a unit system (F, R, C, K)\n")

    val = -460.00
    unit = 'F'
    until isValid( val, unit)
      print("Enter here: ")
      # The input string can have a space => slice it out
      # It also has a '\n' at the end (important for indexing)
      inputStr = gets  
      inputStr.slice!(" ")
      val = inputStr[0..-3].to_f
      unit = inputStr[-2, 1].upcase
      if not isValid( val, unit ) then 
        puts("Value and unit do not constitute a valid")
        puts("Temperature. Please try again.")
      end 
    end

    @value = val
    @unit = unit
    self 
  end

  ################################
  # writeOut writes a temp to the
  # terminal 
  ################################
  def writeOut
    temp = self.clone
    puts( temp.toF().toString() + "\t" +
          temp.toC().toString() + "\t" +
	  temp.toR().toString() + "\t" +
  	  temp.toK().toString() + "\n" )
    self
  end

  ################################
  # converts a temp to string   
  # clean output
  ################################
  def toString
    sprintf('%6.2f', @value) + " " + @unit
  end

end
end
