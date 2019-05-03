-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 1 --
------------------------------------------------------------------------

data Tree a = Branch a (Tree a) (Tree a) | Leaf a deriving Show


-- (a)
testTree :: Tree Int
testTree =
  Branch 1 
    (Branch 2
      (Leaf 3)
      (Leaf 4)
    )
    (Branch 5
      (Leaf 6)
      (Branch 7
        (Leaf 8)
        (Leaf 9)
      )
    )

    
-- (b)
depth :: Tree a -> Int
depth (Leaf _) = 1
depth (Branch _ l r) = min (depth l) (depth r) + 1


-- (c)
paths :: Tree a -> Tree [a]
paths t = paths' [] t
  where
    paths' ls (Leaf a) = Leaf (ls ++ [a])
    paths' ls (Branch a l r) =
      let ls' = ls ++ [a]
      in Branch ls' (paths' ls' l) (paths' ls' r)

      
-- (d)
tmap :: (a -> b) -> Tree a -> Tree b
tmap f (Leaf a) = Leaf (f a)
tmap f (Branch a l r) = Branch (f a) (tmap f l) (tmap f r)