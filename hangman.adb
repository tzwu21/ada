with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with getWord;
with randN;
 procedure hangman is
 
   I : Integer := randN;

begin
   Put_Line (To_String(getWord(I)));
end hangman;