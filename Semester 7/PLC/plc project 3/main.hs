{-
 - Author: Eric Pereira, epereira2015@my.fit.edu
 - Course: CSE 4250, Fall 2018
 - Project: Proj4, Decoding Text
 - Language implementation:
 -}

 data Tree a = Empty | Node a (Tree a) (Tree a) deriving (show)