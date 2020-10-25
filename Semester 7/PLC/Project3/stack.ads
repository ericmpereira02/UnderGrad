-- Author: Eric Pereira: epereira2015@my.fit.edu 
-- Author: Jessica Nguyen, Jnguy2014@my.fit.edu
-- Course: CSE 4250, Fall 2018
-- Project: Project #3, Expression Evaluation

generic
    max : integer;
    type item is private;
package stack is
    procedure Push(X: in item);
   function Pop return item;
   function Size return Integer;
   Stack_Empty : exception;
end;