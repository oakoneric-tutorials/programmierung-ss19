partition ::  (a -> Bool) -> [a] -> ([a], [a])
partition p xs = ( [x | x <- xs , p x], [x | x <- xs , (not . p) x])

maxrep :: [Int] -> Int
maxrep xs = let (_,_,m) = f xs in m

f :: [Int] -> (Int, Int, Int)
f []  = (0,0,0)
f [x] = (x,1,1)
f (x:xs) = let (x', cxs, mxs) = f xs
               c = if x == x' then cxs + 1
                    else 1
               m = max c mxs
           in (x,c,m)
           
maxrep' :: [Int] -> Int
maxrep' = maximum . length' . pack

length' :: [[Int]] -> [Int]
length' = map length

pack :: [Int] -> [[Int]]
pack [] = []
pack (x:xs) = collect x (x:xs) : next x xs

collect :: Int -> [Int] -> [Int]
collect _ []= []
collect y (x:xs)
  | y == x = x : collect y xs
  | otherwise = []

next :: Int -> [Int] -> [[Int]]
next _ [] = []
next y (x:xs)
  | y == x = next y xs
  | otherwise = pack (x:xs)