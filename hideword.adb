with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_Io; use Ada.Text_IO.Unbounded_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Ada.Text_IO, Ada.Integer_Text_IO;

function hideword
  (S1    : Unbounded_String
   ) return Unbounded_String is --input is unbound guess string, returns hidden string (unbounded)
    
   hideword : Unbounded_String; 
   
begin
    for i in 1 .. Length(S1) loop
    Append(hideword, "-");
    end loop;
    
   return hideword;
end hideword;