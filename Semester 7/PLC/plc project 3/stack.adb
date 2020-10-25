-- Author: Eric Pereira: epereira2015@my.fit.edu 
-- Author: Jessica Nguy, Jnguy2014@my.fit.edu
-- Course: CSE 4250, Fall 2018
-- Project: Project #3, Expression Evaluation

-- We used https://rosettacode.org/wiki/Stack#Ada for reference for stack.adb. We converted it to use generics.

-- This program compiles with gnat version :
-- GNAT 7.3.0
-- GNAT GPL 2017 (20170515-63)

with Ada.Containers.Doubly_Linked_Lists;
use Ada.Containers;
package body stack is

    --uses a doubly linked list to act as a stack
    package item_Container is new Doubly_Linked_Lists(item);
    use item_Container;
    The_Stack: List;
   
   --pushes into stack
    procedure Push(X: in item) is
    begin
        Append(The_Stack, X);    -- or The_Stack.Append(X);
    end Push;

    --pops top of stack
    procedure Pop(Result: out item) is
    begin
        if Is_Empty(The_Stack) then
            raise Stack_Empty;
        end if;
        Result := Last_Element(The_Stack);
        Delete_Last(The_Stack);
       end Pop;

    --gets size of stack
    procedure Size(X: out Integer) is
    begin
        X := Integer(Length(The_Stack));
    end Size;

    --clears the stack
    procedure Clear is --(A: in item; test: out item) is 
    begin
        while_loop:
        while not Is_Empty(The_Stack) loop 
            Delete_Last(The_Stack);
        end loop while_loop;
        --test:=A;
    end Clear;

    procedure lotsofoutput (X, z, y: out Integer, g: out float) is
    begin
    end lotsofoutput



end stack;
