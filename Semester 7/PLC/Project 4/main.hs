{-
 - Author: Eric Pereira, epereira2015@my.fit.edu
 - Course: CSE 4250, Fall 2018
 - Project: Proj4, Decoding Text
 - Language implementation:
 -}
 module Main 
 where

    --defines a tree, stores a char or two tree nodes
    data Tree = Leaf Char | Node (Tree) (Tree) deriving(Show)  

    --defines how output is to be displayed and output
    output :: [String] -> [String] -> Tree -> [String] 
    output [] out _ = out
    output (_:[]) out _ = out
    output (_:xout) out tree = output (xout) (out++[find (xout) (tree)]) (tree)

    -- takes in a location and a char list and then splits it 
    splitUp :: Int -> [Char] -> [[Char]]
    splitUp _ [] = []
    splitUp a xs = [(take a xs),(drop a xs)]
 
    -- creates a line given on data given to describe tree
    lineCreate:: [Char] -> Tree
    lineCreate [] = error "ERROR: There is no data given to describe tree"
    lineCreate (ch:cs)
        |isAsterisk(ch) == True = nodeBegin ( splitTreeAsterisk  (cs)) 
        |otherwise = startOfLetters ( splitTreeLetter ([ch] ++ cs))

    -- only one letter 
    nodeBegin :: [[Char]] -> Tree
    nodeBegin [a,b] = Node (lineCreate a) (lineCreate b)
    nodeBegin _ = error "ERROR: Only one letter is thought to be entered"

    --shows lines that are made
    linesMade :: [String] -> [String] -> [String]
    linesMade  [] s = s 
    linesMade (x:xs) s =  output (xs) (s ++ [(find (xs) (lineCreate (x)))]) (lineCreate(x))

    input :: String -> [String]
    input [] = ["Empty",""]
    input inp = linesMade (lines inp) ([])
    
    --  splits if the first case is a letter
    splitTreeLetter :: [Char] -> ([[Char]])
    splitTreeLetter ch = splitUp(splitTree ch 0 0) (ch)
 
    --splits if the first case is an asterisk
    splitTreeAsterisk :: [Char] ->([[Char]])
    splitTreeAsterisk ch = splitUp (splitTree ch 1 0) (ch)

    -- checks if character is a '*'
    isAsterisk :: Char -> Bool
    isAsterisk ch
        |ch == '*' = True
        |otherwise = False 
    
    -- takes in chars and counter and index and outputs the final number for the sides of the tree
    splitTree :: [Char] -> Int -> Int -> Int -- ([[Char]])
    splitTree [] _ index = index
    splitTree _ counter index  
        |counter == 0 = index
    splitTree  (ch:cs) counter index
        |isAsterisk(ch) == True  = splitTree (cs) (counter + 1) (index + 1)
        |otherwise = splitTree (cs) (counter - 1) (index + 1)
    
    --like the name, builds a string, works with findpath to create recursive way to concat string
    stringBuilder :: [Char] -> Tree -> String -> String
    stringBuilder [] _ s = s
    stringBuilder x tree s = findpath (x) (tree) (tree) (s)
    
    --provides recursive way to concat string
    findpath :: [Char] -> Tree -> Tree -> String -> String
    findpath x (Leaf a) tree s = stringBuilder (x) (tree) (s ++ [a])
    findpath [] _ _ s = s
    findpath ('0':xs) (Node l _) tree s = findpath xs l tree s
    findpath ('1':xs) (Node _ r) tree s = findpath xs r tree s
    findpath _ _ _ _ = error "ERROR: Input is unrecognized, must be 0 or 1"

    -- this gets the String of all numbers to find and completed Tree
    find :: [String] -> Tree -> String
    find [] _ = ""
    find (x:_) tree = findpath (x) (tree) (tree) ("")

    -- gets called if it starts with *
    startOfLetters :: [[Char]] -> Tree
    startOfLetters [_,y:_] = Leaf y
    startOfLetters _ = error "ERROR: Program thinks a * is at the start"
    
    main:: IO ()
    main = interact (unlines . input)  
         
     
    