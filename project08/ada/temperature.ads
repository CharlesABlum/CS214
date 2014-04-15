-- temperature.ads declares the Temperature Type and its     
-- operations.
--
-- Begun by: Charles Blum, 214 at Calvin College.
-- Completed by: Charles Blum
-- Date: 14 April 2014
----------------------------------------------------------
package Temperature is
  type Temp is private; 
   
  procedure Init(aTemp: out Temp; aValue : in Float; aUnit : in Character);
  function getValue( aTemp: in Temp ) return Float;
  function getUnit( aTemp : in Temp ) return Character;
  procedure setValue( aTemp : in out Temp; aValue : in Float );
  procedure setUnit( aTemp : in out Temp; aUnit : in Character );
  procedure getF( Tp : in out Temp);
  procedure getC( Tp : in out Temp);
  procedure getK( Tp : in out Temp);
  procedure getR( Tp : in out Temp);
  function toString( aTemp : in Temp ) return String;
  procedure raiseTemp( Tp : in out Temp; degrees : in Float );
  procedure lowerTemp( TP : in out Temp; degrees : in Float );
  function equals( Tp1, Tp2 : in Temp ) return Boolean;
  function lessThan( Tp1, Tp2 : in Temp ) return Boolean;
  function isValid( value : Float; unitChar : Character ) return Boolean;
  procedure readIn( Tp : out Temp );
  procedure writeOut( Tp : in Temp );
  
private   
  type Temp is
      record
	 --Fahrenheit: F = 9C/5 + 32
	 --Rankine: R = F + 459.67
	 --Celcius: C = 5(F - 32)/9
	 --Kelvin: K = C + 273.15
         value : Float;
         unit  : Character;
      end record;

  aTemp : Temp ;
end Temperature;
