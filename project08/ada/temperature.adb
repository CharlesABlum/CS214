-- temperature.adb defines operations for the
-- Temperature type.
--
-- Begun by: Charles Blum, 214 at Calvin College.
-- Completed by: Charles Blum
-- Date: 14 April 2014
---------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Characters.Handling;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Strings.Fixed, Ada.Characters.Handling;

package body Temperature is

  ---------------------------------------------
  -- constructor for the Temperature type
  ---------------------------------------------
  procedure Init(aTemp: out Temp; aValue : in Float; aUnit : in Character) is
  begin
    if isValid( aValue, aUnit ) then
      setValue( aTemp, aValue );
      setUnit( aTemp, aUnit );
    end if;  
  end Init;

  
  ---------------------------------------------
  -- Getters and setters for the Temperature
  -- Type.  Note these are simple setters and
  -- do not handle mis-conversion.  the getX()
  -- functions handle proper conversion and
  -- should be used instead.
  ---------------------------------------------
  function getValue( aTemp: in Temp ) return Float is
  begin 
    return aTemp.value;
  end getValue;

  function getUnit( aTemp : in Temp ) return Character is 
  begin 
    return aTemp.unit;
  end getUnit;

  procedure setValue( aTemp : in out Temp; aValue : in Float ) is
  begin
    aTemp.value := aValue;
  end setValue;
  
  procedure setUnit( aTemp : in out Temp; aUnit : in Character ) is
  begin
    aTemp.unit := aUnit;
  end setUnit;

  ---------------------------------------------
  -- getX() takes in an arbitrary Temperature
  -- and returns a Temperature in X instead.
  -- A valid Temp is already assumed since it
  -- is checked on creation.
  ---------------------------------------------
  procedure getF( Tp : in out Temp) is
  val : Float := getValue(Tp);
  begin
    if getUnit(Tp) = 'R' then
      setValue( Tp, ( val - 459.67) );
      setUnit( Tp, 'F');
    elsif (getUnit(Tp) = 'C') then
      setValue( Tp, (1.8 * val + 32.0) );
      setUnit( Tp, 'F');
    elsif (getUnit(Tp) = 'K') then
      setValue( Tp, (1.8 * val - 459.67) );
      setUnit( Tp, 'F');
    end if;
  end getF;
  
  procedure getC( Tp : in out Temp) is
  val : Float := getValue(Tp);
  begin
    if getUnit(Tp) = 'K' then
      setValue( Tp, (val - 273.15) );
      setUnit( Tp, 'C');
    elsif (getUnit(Tp) = 'F') then
      setValue( Tp, (5.0/9.0 * (val - 32.0)) );
      setUnit( Tp, 'C');
    elsif (getUnit(Tp) = 'R') then
      setValue( Tp, (5.0/9.0 * (val - 459.67)) );
      setUnit( Tp, 'C');
    end if;
  end getC;

  procedure getK( Tp : in out Temp) is
  val : Float := getValue(Tp);
  begin
    if getUnit(Tp) = 'C' then
      setValue( Tp, (val + 273.15) );
      setUnit( Tp, 'K');
    elsif (getUnit(Tp) = 'F') then
      setValue( Tp, (5.0/9.0 * (val + 459.67)) );
      setUnit( Tp, 'K');
    elsif (getUnit(Tp) = 'R') then
      setValue( Tp, (5.0/9.0 * val) );
      setUnit( Tp, 'K');
    end if;
  end getK;

  procedure getR( Tp : in out Temp) is
  val : Float := getValue(Tp);
  begin
    if getUnit(Tp) = 'C' then
      setValue( Tp, (1.8 * (val + 273.15)) );
      setUnit( Tp, 'R');
    elsif (getUnit(Tp) = 'K') then
      setValue( Tp, (1.8 * val) );
      setUnit( Tp, 'R');
    elsif (getUnit(Tp) = 'F') then
      setValue( Tp, (val + 491.67)  );
      setUnit( Tp, 'R');
    end if;
  end getR;

  ---------------------------------------------
  -- toString returns a given Temperature as 
  -- a string for easy output.
  ---------------------------------------------
  function toString( aTemp : in Temp ) return String is
  begin
    return Float'Image(aTemp.value) & " " & aTemp.unit;
  end toString;

  ---------------------------------------------
  -- raiseTemp() takes a Temp and a given 
  -- change and applies it to the Temperature
  ---------------------------------------------
  procedure raiseTemp( Tp : in out Temp; degrees : in Float ) is
  begin
    if degrees < 0.0 then
      lowerTemp( Tp, -1.0 * degrees );
    else
      setValue( Tp, getValue(Tp) + degrees );
    end if;
  end raiseTemp;

  ---------------------------------------------
  -- lowerTemp() takes a Temperature and a 
  -- given change in Temp, checks to see if the
  -- resulting Temp is valid & then changes it.
  ---------------------------------------------
  procedure lowerTemp( TP : in out Temp; degrees : in Float ) is
  val : Float := 0.0;
  begin
    if degrees < 0.0 then
      raiseTemp( Tp, -1.0 * degrees );
    else
      val := Tp.value - degrees;
      if isValid( val, Tp.unit ) then
        setValue( Tp, val );
      --else
        --Temp too low, don't change
      end if;
    end if;
  end lowerTemp;

  ---------------------------------------------
  -- Checks 2 Temps to see if they are similar.
  -- Does not need to be the  same unit system.
  -- Can be destructive since the Tp is not 
  -- a reference or returned.
  ---------------------------------------------
  function equals( Tp1, Tp2 : in Temp ) return Boolean is
  t1, t2 : Temp;
  begin
    t1 := Tp1;
    t2 := Tp2;
    getK( t1 );
    getk( t2 ); 
    if t1.value = t2.value then
      return true;
    else
      return false;
    end if;
  end equals;

  ---------------------------------------------
  -- Checks 2 Temperatures to see if the first
  -- is less than the second.
  -- Can be destructive since the Tp is not 
  -- a reference or returned.
  ---------------------------------------------
  function lessThan( Tp1, Tp2 : in Temp ) return Boolean is
  t1, t2 : Temp;
  begin 
    t1 := Tp1;
    t2 := Tp2;
    getK( t1 );
    getK( t2 );
    if t1.value < t2.value then
      return true;
    else
      return false;
    end if;
  end lessThan;

  ---------------------------------------------
  -- Determines if the value and unit system 
  -- make sense.  If they don't returns false.
  -- Valid Temperature Ranges:
  -- Fahrenheit:	-459.67 to INF
  -- Rankine:		   0.00 to INF
  -- Celcius:		-273.15 to INF
  -- Kelvin:		   0.00 to INF
  ---------------------------------------------
  function isValid( value : Float; unitChar : Character ) return Boolean is
  unit : Character := unitChar;
  begin
    if unit /= 'F' and unit /= 'R' and unit /= 'C' and unit /= 'K' then
      return false;
    elsif ( value < 0.0 and ( unit = 'K' or unit = 'R' )) then
      return false;
    elsif ( value < -273.15 and unit = 'C' ) then
      return false;
    elsif ( value < -459.67 and unit = 'F' ) then
      return false;
    else
      return true;
    end if;
  end isValid;

  ---------------------------------------------
  -- readIn takes input from the user and  
  -- creates a Temperature.  It also checks to
  -- makes sure the input is valid, and if not
  -- asks again.
  ---------------------------------------------
  procedure readIn( Tp : out Temp ) is
  STR_LEN : String := "             ";
  str, str1, str2 : String := STR_LEN;
  num : Natural := 0;
  val : Float := -460.0;
  unit : Character := 'F';  
  begin
    Put_Line("The format is xxx.xx A where xxx.xx is a real value");
    Put_Line("and A is a character representing a unit system (F, R, C, K)");

    loop
      Put("Enter here: ");      
      Get_Line(str, num);
      move(str(str'First..(num - 1)), str1);
      move(str(str'First+(num-1)..str'Last), str2);
      val := Float'Value(str1);
      unit := To_Upper(str2(str2'First));
      exit when ( isValid( val, unit ) = true );
      
      Put("Value and unit do not constitute a valid");
      Put_Line("Temperature. Please try again.");
      str := STR_LEN;
    end loop;
    
    Init ( Tp, val, unit );
  end readIn;

  ---------------------------------------------
  -- writeOut takes a Temperature and prints 
  -- it to the terminal in all units systems
  -- for convenient output.
  -- Order is: F, C, R, K
  ---------------------------------------------
  procedure writeOut( Tp : in Temp ) is
  tF, tC, tR, tK : Temp;
  begin
    tF := Tp; getF(tF);
    tC := Tp; getC(tC);
    tR := Tp; getR(tR);
    tK := Tp; getK(tK);
   
    New_Line; 
    Put(toString(tF) & "  ");
    Put(toString(tC) & "  ");
    Put(toString(tR) & "  ");
    Put(toString(tK) & "  ");
  end writeOut;

end Temperature;
