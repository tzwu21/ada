with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Strings;              use Ada.Strings;
with Ada.Strings.Unbounded;    use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;        use Ada.Strings.Fixed;
with Ada.Text_IO.Unbounded_Io; use Ada.Text_IO.Unbounded_IO;
with Ada.Containers.Generic_Array_Sort;
with tryupdate;
with keepGuesses;
with printhangman;
with getword;
with hideword;
with isLetter;

--with String_Sort;

Procedure hangman is


   --VARIABLES--
   response  : character := 'y'; --keeps loop running, don't use this anymore
   num : integer := 0; --random number for word
   word : Unbounded_String; --word from dictionary
   status: Unbounded_String;
   tempstatus : Unbounded_String;
   guesses: Unbounded_String := To_Unbounded_String("");
   currguess: Unbounded_String;




   mistakes : integer := 0;

   procedure Sort is new Ada.Containers.Generic_Array_Sort
      (Index_Type   => Positive,
      Element_Type => Character,
      Array_Type   => String);

Begin
   --- INITIALIZE GUESSES ---

   --WELCOME TO HANGMAN--
   Put("***** W E L C O M E  T O  H A N G M A N  *****");
   New_Line;
   Put(" By: Kevin E, Adam H, and Timmy W");
   New_Line;
   New_Line;


   --num := randN;
   --Put_Line("random number is: " & Integer'Image(num)); --error check
   word := getword;
   Put_Line("got word: " & To_String(word)); --error check
   status := hideword(word);
   Put_Line("current status: " & To_String(status));

   Put_Line("Game Start: ");

   --- START THE ROUND ---
   while (status /= word ) AND (mistakes < 6) loop --status /= word
      printhangman(mistakes);

      Put_Line("You have guessed the following character(s): " & To_String(guesses));
      Ada.Text_IO.Put ("Enter a character to guess: "); --error check for already picked character
      declare
         S : String := Ada.Text_IO.Get_Line; --currently allows more than one character in
         Letter: Boolean := FALSE;
         IsIn : Boolean := FALSE;
      begin
         --Ada.Text_IO.Put_Line (S);
         currguess := To_Unbounded_String(S);
         
         for i in 1 .. Length(currguess) loop
            if i = 2 then
               Put_Line("Oops! You can only guess one letter at a time!");
               Letter := TRUE;
            end if;
         end loop;
         
         if Letter = FALSE then 
            Put_Line(currguess);
            for i in 1 .. Length(guesses) loop
               if (To_String(currguess)(1)) = (To_String(guesses)(i)) then
                  IsIn := TRUE;
               end if;
            end loop;
                
            if IsIn = TRUE then
               Put_Line("Oops! You already guessed that! Try Again!");
            
            else
               Append(guesses, currguess);
               --String_Sort(guesses);

               declare
                  tempString : String := To_String(guesses); --switch to string 
               begin
               Sort(tempString);
               guesses := To_Unbounded_String(tempString); --switch to unbounded string
               end;
            
               Put_Line("You have guessed the following character(s): " & To_String(guesses)); --error check
               --send word, status, currguess to tryupdate, returns unbounded string
               tempstatus := status;
               status := tryupdate(word, status, currguess); --Character'Image(currguess)
               Put_Line("current status: " & To_String(status));
               if tempstatus = status then
                  mistakes := mistakes + 1;
               end if;

               Put_Line("mistakes: " &  Integer'Image(mistakes));
            end if;
         end if;

      end;
   end loop;

   if mistakes = 6 then
      printhangman(mistakes);
      Put_Line("The word was: " & word);
      Put_Line("Better luck next time!");
      
   elsif status = word then
      Put_Line("You Win!");
   end if;

end hangman;
