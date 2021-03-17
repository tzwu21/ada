with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with ada.numerics.discrete_random;
 
function getWord return Unbounded_String  is

      function randN (Size : Integer) return Integer is      
         package Rand_Int is new ada.numerics.discrete_random(Positive);
         use Rand_Int;
         gen : Generator;
         num : Positive;
      begin
         reset(gen);
         num := random(gen);
         return (Integer (num) mod Size) + 1;
      end randN;
     
      function fileLineCount (fileName: String) return Integer is
         File : File_Type;
         fileSize : Integer := 0;
      begin
         Open (File => File,
            Mode => In_File,
            Name => fileName);
         While not End_Of_File (File) Loop
            fileSize := fileSize + 1;
            Skip_Line (File);
            end loop;
            Close (File);
            return fileSize;
      end fileLineCount;



   File : File_Type;
   I : Integer := 0;
   S : Unbounded_String;
   FileName : String := "dictionary.txt";
   word : Unbounded_String;
   N : Integer;    

begin
   N := randN(fileLineCount(FileName));
   Open (File => File,
         Mode => In_File,
         Name => FileName);
    While not End_Of_File (File) Loop
      I := I + 1;
      S := To_Unbounded_String (Get_Line (File));  
      if I = N then word := S;
                    -- would like to exit loop here
      end if;
   end loop;
   Close (File);
   return word;
end getWord;

 