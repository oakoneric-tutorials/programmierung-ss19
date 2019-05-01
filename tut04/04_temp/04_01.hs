-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 1 --
------------------------------------------------------------------------

data Tree a = Branch a (Tree a) (Tree a) | Leaf a deriving Show


-- (a)


    
-- (b)
depth :: Tree a -> Int


-- (c)
-- paths :: Tree a -> Tree [a]

      
-- (d)
-- tmap :: (a -> b) -> Tree a -> Tree b