-- namer.adb "test-drives" the Name type.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:Charles Blum
-- Date: 09 April 2014
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure namer is

  NAME_SIZE : constant Integer := 8;

  type Name is
    record
      myFirst, myMiddle, myLast : String( 1..NAME_SIZE );
    end record;

  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------
  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
    TheName.myFirst := First;
    TheName.myMiddle := Middle;
    TheName.myLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst     -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------
  function getFirst(TheName : in Name) return String is
  begin 
    return TheName.myFirst;
  end getFirst;

  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.myMiddle   -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle                  -
  ----------------------------------------------
  function getMiddle(TheName : in Name) return String is
  begin 
    return TheName.myMiddle;
  end getMiddle;

  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast       -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast                    -
  ----------------------------------------------
  function getLast(TheName : in Name) return String is
  begin 
    return TheName.myLast;
  end getLast;

  ------------------------------------------------
  -- getFullName(Name) retrieves Name as a String-
  -- Receive: theName, a Name.                   -
  -- PRE: theName has been initialized.          -
  -- Return: a String representation of theName  -
  ------------------------------------------------
  function getFullName(TheName : in Name) return String is
  fullName : String(1..(3 * NAME_SIZE + 2));
  begin
    fullName := getFirst(TheName) & " " & getMiddle(TheName) & " " & getLast(TheName);
    return fullName;
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------
  procedure Put(TheName : in Name) is
  begin
    Put(getFirst(TheName) & " " & getMiddle(TheName) & " " & getLast(TheName));
  end Put;

  ---------------------------------------------
  -- project07 changes                       --
  ---------------------------------------------

  ---------------------------------------------
  -- setters for the Name class              --
  -- sets the corresponding name to the Name --
  -- variable                                --
  ---------------------------------------------
  procedure setFirst( TheName : out Name; first : in String ) is
  begin
    TheName.myFirst := first;
  end setFirst;

  procedure setMiddle( TheName : out Name; middle : in String ) is
  begin
    TheName.myMiddle := middle;
  end setMiddle;

  procedure setLast( TheName : out Name; last : in String ) is
  begin
    TheName.myLast := last;
  end setLast;

  ---------------------------------------------
  -- lmfi() prints out the Name in           --
  -- last, first (iddle initial). format     --
  ---------------------------------------------
  function lfmi( TheName : in Name ) return String is
  middleInitial : Character := ' ';
  begin
    middleInitial := getMiddle(TheName)(getMiddle(TheName)'First);
    return getLast(TheName) & ", " & getFirst(TheName) & " " & MiddleInitial & ".";
  end lfmi;

  ---------------------------------------------
  -- project07 changes                       --
  ---------------------------------------------
  procedure readName(TheName : in out Name) is
  someName : String := "no name ";
  begin
    New_Line;
    Put("enter a new name, first, middle, and last:");
    New_Line;
    Get(someName);
    TheName.myFirst := someName;
    Get(someName);
    TheName.myMiddle := someName;
    Get(someName);
    TheName.myLast := someName;
  end readName;

begin
   Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");
   Put(aName); New_line;
   Put("lab07 tests passed!");

   setFirst( aName, "Paul    " );
   setMiddle( aName, "John    " );
   setLast( aName, "Smith   " );

   pragma Assert( getFirst(aName) = "Paul    ", "setFirst() failed" );
   pragma Assert( getMiddle(aName) = "John    ", "setMiddle() failed" );
   pragma Assert( getLast(aName) = "Smith   ", "setLast() failed" );
   Put(lfmi(aName));
   pragma Assert( lfmi(aName) = "Paul    , John    S.", "lfmi() failed" );
   readName(aName);
   pragma Assert( getFirst(aName) /= "Paul    ", "readName() failed" );
   pragma Assert( getFirst(aName) /= "John    ", "readName() failed" );
   pragma Assert( getFirst(aName) /= "Smith   ", "readName() failed" );
   
   New_Line;
   Put("project07 tests passed!");
   New_Line;

   New_Line;
   Put("All tests passed!"); New_line;

end namer;

