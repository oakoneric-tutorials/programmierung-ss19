-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE Z1 --
------------------------------------------------------------------------

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
