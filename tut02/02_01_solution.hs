-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 1 --
------------------------------------------------------------------------

-- (a) gleiche Buchstaben zusammenfassen

pack :: [Char] -> [[Char]]
pack [] = []
pack (x:xs) = collect x (x:xs) : next x xs

-- Zusammenfassen gleicher Zeichen
collect :: Char -> [Char] -> [Char]
collect _ []= []
collect y (x:xs)
  | y == x = x : collect y xs
  | otherwise = []

-- nächsten Abschnitt finden
next :: Char -> [Char] -> [[Char]]
next _ [] = []
next y (x:xs)
  | y == x = next y xs
  | otherwise = pack (x:xs)

-- oder alles in einer Funktion:
pack' :: [Char] -> [[Char]]
pack' [] = []
pack' (x:xs) = ys : pack' zs
  where
    (ys, zs) = takeall x (x:xs)
    takeall _ [] = ([], [])
    takeall x (y:ys)
      | x == y = let (us, vs) = takeall x ys in (y:us, vs)
      | otherwise = ([], (y:ys))

------------------------------------------------------------------------

-- (b) Liste lauflängenkodieren

encode :: [Char] -> [(Int, Char)]
encode = f . pack
  where
    f [] = []
    f ((x:xs):ys) = (length (x:xs), x) : f ys
    -- oder: f (y@(x:xs):ys) = (length y, x) : f ys
    -- oder: f (y:ys) = (length y, head y) : f ys

encode' :: [Char] -> [(Int, Char)] 
encode' = map (\ (x:xs) -> (length xs + 1, x)) . pack
-- encode' list = map (\ (x:xs) -> (length xs + 1, x)) (pack list)

encode'' :: [Char] -> [(Int, Char)] 
encode'' = (map f) . pack
    where f (x:xs) = (length xs + 1, x)

------------------------------------------------------------------------

-- (d) Liste lauflängendekodieren

decode :: [(Int, Char)] -> [Char]
decode [] = []
decode ((n, x):xs) = repeat n x ++ decode xs
  where
    repeat 0 _ = []
    repeat n x = x : repeat (n-1) x
    
decode' :: [(Int, Char)] -> [Char]
decode' = concat . map (\ (n,c) -> repeat n c)
  where
    repeat 0 _ = []
    repeat n x = x : repeat (n-1) x
    
decode'' :: [(Int, Char)] -> [Char]
decode'' = concat . map (uncurry repeat)
  where
    repeat 0 _ = []
    repeat n x = x : repeat (n-1) x

------------------------------------------------------------------------

-- (e) Liste rotieren

rotate :: [Int] -> Int -> [Int]
rotate [] _ = []
rotate xxs@(x:xs) n
  | n == 0 = xxs
  | n > 0 = rotate (xs ++ [x]) (n-1)
  | otherwise = rotate (last xxs : take (length xxs - 1) xxs) (n+1)

-- oder:

rotate' :: [Int] -> Int -> [Int]
rotate' [] _ = []
rotate' xxs@(x:xs) n
  | n == 0 = xxs
  | n > 0 = rotate' (xs ++ [x]) (n-1)
  | otherwise = rotate' xxs (length xxs + n)

-- Verwendung von n `mod` length xxs zur Reduzierung der Durchläufe:

rotate'' :: [Int] -> Int -> [Int]
rotate'' [] _ = []
rotate'' xxs@(x:xs) n
  | n `mod` length xxs == 0 = xxs
  | n > 0 = rotate'' (xs ++ [x]) (n `mod` length xxs - 1)
  | otherwise = rotate'' xxs (length xxs + n `mod` length xxs)

-- Es gilt: mod n (length xxs) <=> n `mod` length xxs

-- oder kürzer:

rotate''' :: [Int] -> Int -> [Int]
rotate''' [] _ = []
rotate''' xxs@(x:xs) n
  | n `mod` length xxs == 0 = xxs
  | n > 0 = rotate''' (xs ++ [x]) (n' - 1)
  | otherwise = rotate''' xxs (length xxs + n')
  where n' = n `mod` length xxs
