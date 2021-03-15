with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

 
function getWord (N : Integer) return Unbounded_String  is
   File : File_Type;
   I : Integer := 0;
   S : Unbounded_String;
   word : Unbounded_String;
   
begin
   Open (File => File,
         Mode => In_File,
         Name => "hangmanWords.txt");
    While not End_Of_File (File) Loop
      I := I + 1;
      S := To_Unbounded_String (Get_Line (File));  
      if I = N then word := S;
      end if;
   end loop;
   Close (File);
   return word;
end getWord;

 