-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 3 --
------------------------------------------------------------------------

data Tree = Node String [Tree] deriving (Show)

-- (a) 
t = Node "Wurzel" [Node "l" [], Node "m" [Node "lu" [], Node "ru" []], Node "r" []]

-- (b) Knoten auf einem Level zählen
level :: Int -> Tree -> [String]
level 0 (Node s _) = [s]
level i (Node _ []) = []
level i (Node s (t:ts)) = level (i-1) t ++ level i (Node s ts)

-- oder
level' :: Int -> Tree -> [String]
level' 0 (Node s _) = [s]
level' i (Node _ ts) = concatMap (level' (i-1)) ts