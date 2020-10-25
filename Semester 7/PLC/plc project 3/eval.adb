-- To run ada run:
-- gcc -c <name>.adb
-- gnatbind <name>
-- gnatling <name>
-- ./<name>.exe
-- 
-- Author: Eric Pereira: epereira2015@my.fit.edu 
-- Author: Jessica Nguy, Jnguy2014@my.fit.edu
-- Course: CSE 4250, Fall 2018
-- Project: Project #3, Expression Evaluation
-- This program compiles with gnat version :
-- GNAT 7.3.0
-- GNAT GPL 2017 (20170515-63)

with stack;
with Ada.Text_IO; use Ada.Text_IO;
procedure eval is

	--variables to be used
	temp1, temp2 : Integer;
	infinityFlag : BOOLEAN := FALSE;
	read_In : Character;
	equationToParse : String (1 .. 300);
	Last : Natural;
	package string_stack is new stack(Integer);
	use string_stack;

	--functions to be used
	function Minimum(leftValue, rightValue: in Integer) return Integer is
    pushIntValue : Integer := 0;
    begin
		--if leftval is -1 it is infinity, anything is smaller than infinity so rightval.
		--if rightval is 1 it is the smallest because we only add positive numbers, it is rightval
		if leftValue = -1 or rightValue = 1 then
			pushIntValue := rightValue;
		--if rightval is -1 it is infinity, anything is smaller than infinity so leftval.
		--if leftval is 1 it is the smallest because we only add positive numbers, it is leftval
		elsif rightValue = -1 or leftValue = 1 then
			pushIntValue := leftValue;
		--compare numbers otherwise
		else
			if leftValue <= rightValue then
				pushIntValue := leftValue;
			elsif rightValue < leftValue then
				pushIntValue := rightValue;
			end if;
		end if;

		return pushIntValue;
    end Minimum;

	--adds two numbers from the stack
	function Add(leftValue, rightValue: in Integer) return Integer is
    pushIntValue : Integer;
    begin
		--if leftval is -1 equation becomes infinity+rightval, which is just rightval
		--if rightval is 1 equation becoms leftval+0, which is just leftval 
		if leftValue = -1 or rightValue = 1 then
			return leftValue;
		--if rightval is -1 equation becomes leftval+infinity, which ends up being rightval
		--if leftval is 1 equation becomes 0+rightval, which ends up being rightval
		elsif rightValue = -1 or leftValue = 1 then
			return rightValue;
		--if its not above two cases its just rightval add leftval
		else
        	pushIntValue := leftValue + rightValue;
		return pushIntValue;
		end if;
    end;

begin
-- procedure someStackTest(integer : in  )
    -- Put_Line ('Hello WORLD!');

	

    
	equationCalc : loop		 -- Loop while still on a single line else, continue to next line. (clear stack).
		-- loop zeroes string
		zeroing_loop:
		for i in equationToParse'Range loop
			equationToParse(i) := ' ';
		end loop zeroing_loop;
		Ada.Text_IO.Get_Line(equationToParse, Last);

		--loop reads through each character in a line of standard input
		for_loop:
		for i in equationToParse'Range loop		-- Read in 1 char at a time.
			read_In := equationToParse(i);
			if read_In = '*' then
				infinityFlag := TRUE;
			end if;
				case read_In is
					when '0'    => Push(-1);
					when '1'    => Push(1);         -- 1 -> Zero
					when '2'    => Push(2);
					when '3'    => Push(3);
					when '4'    => Push(4);
					when '5'    => Push(5);
					when '6'    => Push(6);
					when '7'    => Push(7);
					when '8'    => Push(8);
					when '9'    => Push(9);
					when '.'    => 
						Pop(temp1);
						Pop(temp2);
						Push(Add(temp1, temp2));
					when '+'    => 
						Pop(temp1);
						Pop(temp2);
						Push(Minimum(temp1, temp2));
					when ' '    => null;
					when others => Exit for_loop;   -- Calls a complaint to the compiler?
					
				-- Suggested to look at subtypes for case 2...9    
				end case;
        end loop for_loop;
		
		--if infinity flag is set print out character for infinity
		if infinityFlag = TRUE then
			Put_Line("0");
			infinityFlag := FALSE;
		--if infinity flag is not set do other instructions
		elsif infinityFlag = FALSE then
			--temp1 holds the most recent value in pop, -temp2 holds size
			Pop(temp1);
			Size(temp2);
			--if temp2 is greater than 0 at this moment there were more numbers than operations
			if temp2 > 0 then
				Put_Line("Uneven amount of operations to numbers, try again");
			--per case statement, if temp is -1 return 0
			elsif temp1 = -1 then
				Put_Line("0");
			--in any other case print the most recent thing in the stack
			else
				Put_Line(Integer'Image(temp1));
			end if;
		end if;

		--always clears stack at the end just in case
		Clear;
	end loop equationCalc;

end eval;
