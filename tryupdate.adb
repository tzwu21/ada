with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;
with Ada.Strings.Bounded;   use Ada.Strings.Bounded;
with Ada.Strings.Maps.Constants;

function tryupdate
  (S1    : Unbounded_String;
   S2    : Unbounded_String;
   S3    : Unbounded_String) return Unbounded_String is --returns updated guessing string

   word : String := To_String(S1); --still uppercase
   status : String := To_String(S2);
   guess : String := To_String(S3); --given as lowercase
   tempword : Unbounded_String := S1;
   tempwordone : String := word;
  

   
   Cnt: Natural;
   Idx: Natural;
   Upd: String := To_String(S2); -- copy of state, will return updated copy of state
   Res: Unbounded_String := S2; --unbounded string
   
begin

   tempword := Ada.Strings.Unbounded.Translate(tempword, Ada.Strings.Maps.Constants.Lower_Case_Map); --convert tempword to lowercase
   tempwordone := To_String(tempword);
   Cnt := Ada.Strings.Fixed.Count --gets number of instances of guess in word
     (Source  => tempwordone,
      Pattern => guess);
   
   Put_Line ("Count for '" & guess & "': " & Natural'Image (Cnt)); --error check, can delete

   Idx := 0;
   for I in 1 .. Cnt loop --for every instance of guess, find the index, update S2
      Idx := Index
        (Source  => tempwordone,
         Pattern => guess,
         From    => Idx + 1);

      Upd(Idx) := word(Idx); --assign state with guess, fixed string
      Res := To_Unbounded_String(Upd); --now unbounded string
      --nice job!
    

   end loop;
   return Res; --returns unbound Upd = updated S2
end tryupdate;
