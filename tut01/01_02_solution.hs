-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 2 --
------------------------------------------------------------------------

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib i = fib (i-1) + fib (i-2)

-- schnellere Lösung
fib' :: Int -> Int
fib' i = stack 1 1 i
    where stack f0 f1 0 = f0
          stack f0 f1 i = stack f1 (f0 + f1) (i-1)

-- um die Geschwindigkeit vergleichen zu können, kann z.B. fib 35 und fib' 50 getestet werden