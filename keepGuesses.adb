with Ada.Strings.Unbounded;    use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_Io; use Ada.Text_IO.Unbounded_IO;
with Ada.Text_IO, Ada.Integer_Text_IO;

function keepGuesses
  (S1    : Unbounded_String
  ) return Unbounded_String is --input is unbound guess string, returns updated guess string (unbounded)
    
   guess : Unbounded_String := S1; --so we can modify S1
   
begin
   Ada.Text_IO.Put ("Enter a character: ");
   declare
      S : String := Ada.Text_IO.Get_Line; --currently allows more than one character in
   begin
      Ada.Text_IO.Put_Line (S);
      Append(guess, S);
   end;
   
   return guess;
end keepGuesses;
