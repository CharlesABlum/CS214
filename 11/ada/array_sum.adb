-- array_sum.adb sums the values from an input file using an array.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by:
-- Date:
--
-- Usage: array_sum <inFileName>
-------------------------------------------------------------------

with Ada.Text_IO,            -- string output
     Ada.Integer_Text_IO,    -- integer output
     Ada.Command_Line,       -- Argument()
     Ada.Real_Time;          -- Clock, Time, etc.

use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Real_Time;

procedure array_sum is

   package Long_IO is new Integer_IO(Long_Integer); use Long_IO;

   type Int_Array is array (Integer range <>) of Long_Integer;
   type Int_Array_Pointer is access Int_Array;

   Values: Int_Array_Pointer;
   Total:  Long_Integer;
   Start_Time, Stop_Time:  Ada.Real_Time.Time;
   Time_Required: Duration;
   

   procedure Check_Command_Line is
   begin
      if Ada.Command_Line.Argument_Count /= 1 then
         New_line;
         Put("Usage: array_sum <inFileName>");
         New_line; New_line;
         Ada.Command_Line.Set_Exit_Status(1);
      end if;
   end Check_Command_Line;

   procedure Read_File(File_Name: in String; V: in out Int_Array_Pointer) is
      Size:   Integer;
      Number_File : File_Type;
   begin
     Open(File => Number_File,
            Mode => In_File,
            Name => File_Name); 
      Get(Number_File, Size);
      V := new Int_Array(0..Size-1);
      for i in V'Range loop
         Get(Number_File, V(i));
      end loop;
   end Read_File;

   function Sum(V: in Int_Array_Pointer) return Long_Integer is
      result: Long_Integer := 0;
   begin
      for i in V'Range loop
         result := result + V(i) ;
      end loop;
      return result;
   end sum;

   procedure Display(result: in Long_Integer; Compute_Time: in Duration) is
   begin
      New_line;
      Put("The sum is ");
      Put(Total);
      New_line;
      Put(" and computing it took "); 
      Put(Duration'Image (Compute_Time));
      Put(" secs.");
      New_line; New_line;
   end Display;


begin
   Check_Command_Line;
   Read_File( Ada.Command_Line.Argument(1), Values );
   Start_Time := Clock;
   Total := Sum(Values);
   Stop_Time := Clock;
   Time_Required := Ada.Real_Time.To_Duration(Stop_Time - Start_Time);
   Display(Total, Time_Required);
end array_sum;

