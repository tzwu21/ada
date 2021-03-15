with Ada.Text_IO; use Ada.Text_IO;
with tryupdate;

procedure Show_Increment is --use to show tryupdate works as a function, change S1/S2/S3 to anything, should return the immediate following state
   S1: String := "hellodad";
   S2: String := "--------";
   guess: String := "l";
   start: String := S2; --set to same length as S1/S2
begin
    start := tryupdate(S1,S2,guess);
    Put_Line("updated state: " & start);
  
end Show_Increment;