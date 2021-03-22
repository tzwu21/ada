with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;
with Ada.Strings.Bounded;   use Ada.Strings.Bounded;

function tryupdate
  (S1    : Unbounded_String;
   S2    : Unbounded_String;
   S3    : Unbounded_String) return Unbounded_String is --returns updated guessing string

   word : String := To_String(S1);
   status : String := To_String(S2);
   guess : String := To_String(S3); 
  

   
   Cnt: Natural;
   Idx: Natural;
   Upd: String := To_String(S2); -- copy of state, will return updated copy of state
   Res: Unbounded_String := S2; --unbounded string
   
begin
   --Put_Line("Output from tryUpdate: "); --error check, can delete
   --Put_Line("Word: " & word); --error checks, can delete later
   --Put_Line("State: " & status);
   --Put_Line("Guess: " & guess);
    
   
   Cnt := Ada.Strings.Fixed.Count --gets number of instances of guess in word
     (Source  => word,
      Pattern => guess);
   
   Put_Line ("Count for '" & guess & "': " & Natural'Image (Cnt)); --error check, can delete

   Idx := 0;
   for I in 1 .. Cnt loop --for every instance of guess, find the index, update S2
      Idx := Index
        (Source  => word,
         Pattern => guess,
         From    => Idx + 1);
        
      --Put_Line ("Found instance of '" & guess & "' at position: "
      --        & Natural'Image (Idx)); --error check, can delete

      Upd(Idx) := guess(1); --assign state with guess, fixed string
      Res := To_Unbounded_String(Upd); --now unbounded string
      --nice job!
    

   end loop;
   return Res; --returns unbound Upd = updated S2
end tryupdate;
