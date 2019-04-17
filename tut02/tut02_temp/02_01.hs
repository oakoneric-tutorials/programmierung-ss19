-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 1 --
------------------------------------------------------------------------

-- (a) gleiche Buchstaben zusammenfassen

pack :: [Char] -> [[Char]]


-- Zusammenfassen gleicher Zeichen
collect :: Char -> [Char] -> [Char]


-- nächsten Abschnitt finden
next :: Char -> [Char] -> [[Char]]


-- oder alles in einer Funktion:
pack' :: [Char] -> [[Char]]


------------------------------------------------------------------------

-- (b) Liste lauflängenkodieren

encode :: [Char] -> [(Int, Char)]


encode' :: [Char] -> [(Int, Char)] 


encode'' :: [Char] -> [(Int, Char)] 


------------------------------------------------------------------------

-- (d) Liste lauflängendekodieren

decode :: [(Int, Char)] -> [Char]

    
decode' :: [(Int, Char)] -> [Char]

    
decode'' :: [(Int, Char)] -> [Char]


------------------------------------------------------------------------

-- (e) Liste rotieren

rotate :: [Int] -> Int -> [Int]


-- oder:

rotate' :: [Int] -> Int -> [Int]

-- oder:
rotate'' :: [Int] -> Int -> [Int]


-- oder kürzer:

rotate''' :: [Int] -> Int -> [Int]

