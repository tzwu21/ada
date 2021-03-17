with Ada.Text_IO;

procedure writeWord (S : String; N : String) is
   use Ada.Text_IO;
   F : File_Type;
begin
      Ada.Text_IO.Open (File => F,
                        Name => N,
                        Mode => Ada.Text_IO.Append_File);
   Put_Line (F, S);
   Close (F);
end writeWord;