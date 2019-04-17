-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 3 --
------------------------------------------------------------------------

data Tree = Node String [Tree] deriving (Show)

-- (a) 


-- (b) Knoten auf einem Level zählen
level :: Int -> Tree -> [String]


-- oder
level' :: Int -> Tree -> [String]
