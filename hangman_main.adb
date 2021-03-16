with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO.Unbounded_Io; use Ada.Text_IO.Unbounded_IO;
with tryupdate;
with keepGuesses;
with printhangman;
with randN;
with getword;
with hideword;

Procedure hangman_main is 

 
	--VARIABLES--
    response  : character := 'y'; --keeps loop running
    num : integer := 0; --random number for word
    word : Unbounded_String; --word from dictionary
    status: Unbounded_String;
    tempstatus : Unbounded_String;
    guesses: Unbounded_String := To_Unbounded_String("");
    currguess: Unbounded_String;
    
    
    
    mistakes : integer := 0; 


	
Begin 
	--- INITIALIZE GUESSES ---
	
	--WELCOME TO HANGMAN--
	Put("***** W E L C O M E  T O  H A N G M A N  *****");
	New_Line;
	Put(" By: Kevin E, Adam H, and Timmy W"); 
	New_Line;
	New_Line;
	
    
    num := randN;
	Put_Line("random number is: " & Integer'Image(num)); --error check
    word := getword(num);
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
        begin
        Ada.Text_IO.Put_Line (S);
        
        currguess := To_Unbounded_String(S);
        Append(guesses, currguess); --append to guess memory
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

        
    end loop;

    --if mistakes == 6 : you lose, print stats
    --if status == word: you win, print stats
end hangman_main;