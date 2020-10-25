-- Author: Eric Pereira: epereira2015@my.fit.edu 
-- Author: Jessica Nguy, Jnguy2014@my.fit.edu
-- Course: CSE 4250, Fall 2018
-- Project: Project #3, Expression Evaluation

-- This program compiles with gnat version :
-- GNAT 7.3.0
-- GNAT GPL 2017 (20170515-63)


package stack is
    procedure Push(X: in item);
    procedure Pop(Result: out item);
    procedure Size(X: out Integer);
    procedure Clear;--test: out item);
    Stack_Empty : exception;
end;
