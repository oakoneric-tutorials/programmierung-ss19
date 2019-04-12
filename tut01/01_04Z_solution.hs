-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE Z1 --
------------------------------------------------------------------------

fibs :: [Int]
fibs = fibs' 0
  where
    fibs' x = fib x : fibs' (x+1)

-- take 7 fibs liefert die ersten 7 Fibonacci-Zahlen
