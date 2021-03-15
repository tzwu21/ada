with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

function tryupdate
  (S1    : String;
   S2    : String;
   S3    : String) return String is --returns updated guessing string
    
    Cnt: Natural;
    Idx: Natural;
    Upd: String := S2; -- copy of state, will return updated copy of state
   
begin
    Put_Line("Word: " & S1); --error checks, can delete later
    Put_Line("State: " & S2);
    Put_Line("Guess: " & S3);

    Cnt := Ada.Strings.Fixed.Count --gets number of instances of guess in word
     (Source  => S1,
      Pattern => S3);
   
   Put_Line ("Count for '" & S3 & "': " & Natural'Image (Cnt)); --error check, can delete

   Idx := 0;
   for I in 1 .. Cnt loop --for every instance of guess, find the index, update S2
      Idx := Index
        (Source  => S1,
         Pattern => S3,
         From    => Idx + 1);
        
      Put_Line ("Found instance of '" & S3 & "' at position: "
                & Natural'Image (Idx)); --error check, can delete

       Upd(Idx) := S3(1); --assign state with guess
    

    end loop;
    return Upd; --returns Upd = updated S2
end tryupdate;