with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

 
procedure printHangman (N : Integer) is --N is integer 0 through 6
  A : String := "   +----_";
  B : String := "   |    |";
  C : String := "   O    |";
  D : String := "  /|\   |";
  E : String := "  / \   |";
  F : String := "        |";
  G : String := " (:=====|=====:)";

   
begin
  case N is
         when 0 =>
             C := "        |";
             D := "        |";
             E := "        |";
         when 1 =>
             D := "        |";
             E := "        |";
         when 2 =>
             D := "   |    |";
             E := "        |";
         when 3 =>
             D := "   |\   |";
             E := "        |";
         when 4 =>
             E := "        |";
         when 5 =>
             E := "  /     |";
         when 6 =>
            Put_Line ("YOU DIED");
         when others =>
            Put_Line ("Error, N of mistakes greater than max amount or less than 0");
      end case;
                    --sadly falling through branches isn't a thing in ada
  Put_Line (A);
  Put_Line (B);
  Put_Line (C);
  Put_Line (D);
  Put_Line (E);
  Put_Line (F);
  Put_Line (G);
end printHangman;

 