-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 3 --
------------------------------------------------------------------------

f :: [Int] -> Int
f xs = foldr product 1 (map square (filter even' xs))
  where
    even' x = mod x 2 == 0
    square x = x * x
    product x y = x * y

-- mit Haskell-Funktionen:
f' :: [Int] -> Int
f' xs = foldr (*) 1 (map (^2) (filter even xs))

-- mit Funktionskomposition:
f'' :: [Int] -> Int
f'' = foldr (*) 1 . map (^2) . filter even