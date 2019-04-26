-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 2 --
------------------------------------------------------------------------

import Prelude hiding (even)

data Tree = Node Int [Tree] deriving (Show)

tree1 :: Tree
tree1 = Node 4 [
            Node 2 [
                Node 1 [],
                Node 3 [] ],
            Node 8 [] ]
            
tree2 :: Tree
tree2 = Node 4 [
            Node 2 [
                Node 1 [],
                Node 3 [
                    Node 5 [] ] ],
            Node 8 [] ]

-- (a)
noLeaves :: Tree -> Int
noLeaves (Node _ []) = 1
noLeaves (Node _ xxs) = f xxs
    where
        f [] = 0
        f (x:xs) = (noLeaves x) + (f xs)

-- oder in einer Funktion
noLeaves' :: Tree -> Int
noLeaves' (Node _ []) = 1
noLeaves' (Node _ [x]) = noLeaves' x
noLeaves' (Node a (x:xs)) = noLeaves' (Node a [x]) + noLeaves' (Node a xs)

-- mit foldr und map
noLeaves'' :: Tree -> Int
noLeaves'' (Node _ []) = 1
noLeaves'' (Node _ ts) = foldr (+) 0 (map noLeaves'' ts)

-- (b)
even :: Tree -> Bool
even (Node a ls) = (((length ls) `mod` 2) == 0) && (everyEven ls)

everyEven :: [Tree] -> Bool
everyEven [] = True
everyEven (a:ls) = (even a) && (everyEven ls)

-- oder in einer Funktion
even' :: Tree -> Bool
even' (Node _ []) = True
even' (Node _ [x]) = False
even' (Node a (x:y:xs)) 
    = (even' x) && (even' y) && (even' (Node a xs))