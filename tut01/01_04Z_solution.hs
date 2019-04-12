-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE Z1 --
------------------------------------------------------------------------
-- zur Berechnung von Fibonacci-Zahlen siehe Aufgabe 2
-- fibs verwendet die langsamere und fibs' die schnellere Variante

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib' :: Int -> Int
fib' i = stack 1 1 i
    where stack f0 f1 0 = f0
          stack f0 f1 i = stack f1 (f0 + f1) (i-1)
       
       
fibs :: [Int]
fibs = fibAppend 0
  where
    fibAppend x = fib x : fibAppend (x+1)

fibs' :: [Int]
fibs' = fibAppend 0
  where
    fibAppend x = fib' x : fibAppend (x+1)
    
-- take 7 fibs liefert die ersten 7 Fibonacci-Zahlen
-- interessant sind insbesondere die Werte größer als 30
