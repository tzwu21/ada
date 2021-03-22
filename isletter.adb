with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with getWord;
with printHangman;

function isLetter (L : Character) return Boolean is
   subtype UpperCaseLetter is Character range 'A' .. 'Z';
   subtype LowerCaseLetter is Character range 'a' .. 'z';
begin
   return L in UpperCaseLetter or L in LowerCaseLetter; 
end isLetter;

