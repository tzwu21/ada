with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tryupdate;
with keepGuesses;


procedure Show_Increment is --use to show tryupdate works as a function, change S1/S2/S3 to anything, should return the immediate following state
   S1: String := "daddy";
   S2: String := "-----";
   guess: String := "d";
   start: String := S2; --set to same length as S1/S2
   tempguesses : Unbounded_String := To_Unbounded_String("ligma");
   updateguess : Unbounded_String;
begin
    start := tryupdate(S1,S2,guess);
    Put_Line("updated state: " & start);
    updateguess := keepGuesses(tempguesses);
    Put_Line("updated guesses: " & To_String(updateguess));
    
  
end Show_Increment;