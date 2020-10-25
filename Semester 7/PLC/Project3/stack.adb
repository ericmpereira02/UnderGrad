-- Author: Eric Pereira: epereira2015@my.fit.edu 
-- Author: Jessica Nguyen, Jnguy2014@my.fit.edu
-- Course: CSE 4250, Fall 2018
-- Project: Project #3, Expression Evaluation

with Ada.Containers.Doubly_Linked_Lists;
use Ada.Containers;
package body stack is

   package Float_Container is new Doubly_Linked_Lists(Float);
   use Float_Container;
   The_Stack: List;
   
   procedure Push(X: in item) is
   begin
      Append(The_Stack, X);    -- or The_Stack.Append(X);
   end Push;

   function Pop return item is
      Result: item;
   begin
      if Is_Empty(The_Stack) then
         raise Stack_Empty;
      end if;
      Result := Last_Element(The_Stack);
      Delete_Last(The_Stack);
      return Result;
   end Pop;

   function Size return Integer is
   begin
      return Integer(Length(The_Stack));
   end Size;

end stack;