-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 2 --
------------------------------------------------------------------------

import Prelude hiding (unzip)

-- (a)
unzip :: [(a, b)] -> ([a], [b])
unzip ls = (f ls, g ls)
  where
    f [] = []
    f ((a,_):ls) = a : f ls
    
    g [] = []
    g ((_,b):ls) = b : g ls

-- oder:
unzip' :: [(a, b)] -> ([a], [b])
unzip' ls = f [] [] ls
  where
    f x y [] = (x, y)
    f x y ((a,b):ls) = f (x ++ [a]) (y ++ [b]) ls 

-- oder:
unzip'' :: [(a, b)] -> ([a], [b])
unzip'' [] = ([], [])
unzip'' ((x,y):ls) = (x:xs, y:ys)
  where
    (xs, ys) = unzip'' ls
    
-- (b)
map (uncurry (+)) [(1,2),(3,4)]
= uncurry (+) (1,2) : map (uncurry (+)) [(3,4)]
= (+) 1 2 : uncurry (+) (3,4) : map (uncurry (+)) []
= 3 : (+) 3 4 : []
= [3,7