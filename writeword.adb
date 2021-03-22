with Ada.Text_IO;

procedure writeWord (S : String; N : String) is --N = name of file, S = word to add
   use Ada.Text_IO;
   F : File_Type;
begin
      Ada.Text_IO.Open (File => F,
                        Name => N,
                        Mode => Ada.Text_IO.Append_File);
   New_Line(1);
   Put_Line (F, S);
   Close (F);
end writeWord;