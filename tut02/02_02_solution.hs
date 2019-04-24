-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 2 --
------------------------------------------------------------------------

import Prelude hiding (words, unwords)

-- (a) Wörter aneinanderfügen

unwords :: [String] -> String
unwords [] = ""
unwords [x] = x -- oder: (x:[]) = x
unwords (x:xs) = x  ++ ' ' : unwords xs
-- oder: unwords (x:xs) = x  ++ " " ++ unwords xs

------------------------------------------------------------------------

-- (b) Wörter trennen
words :: String -> [String]
words s = f [] s
    where
        f save [] = [save]
        f save (c:cs)
            | c == ' ' = save : f [] cs
            | otherwise = f (save ++ [c]) cs
  
  
-- oder:
words' :: String -> [String]
words' [] = []
words' (' ':cs) = words' cs
words' cs = let (w, cs') = takeWord cs in w : words' cs'
    where
        takeWord [] = ([], [])
        takeWord (' ':cs) = ([], cs)
        takeWord (c:cs) = let (w, cs') = takeWord cs in (c:w, cs')