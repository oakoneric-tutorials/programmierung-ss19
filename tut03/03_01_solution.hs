-- Übung Programmierung Sommersemester 2019
-- Eric Kunze
-- Github: https://github.com/oakoneric/programmierung-ss19
------------------------------------------------------------------------
-- AUFGABE 1 --
------------------------------------------------------------------------

data Tree = Node Int Tree Tree | NIL deriving (Show)
tree1 :: Tree -- Suchbaum  
tree1 = Node 5 
        (   Node 3 
            (Node 2 NIL NIL) 
            (Node 4 NIL NIL)
        ) 
        (
            Node 8 
            (   Node 7 
                (Node 6 NIL NIL) 
                (NIL)
            )
            (   Node 10 
                (NIL)
                (Node 13 NIL NIL)
            )
        )
    
tree2 :: Tree -- kein Suchbaum
tree2 = Node 5 
    (Node 3 
        (Node 2 NIL NIL)
        (Node 6 NIL NIL)
    )
    (Node 8 
        (Node 7 
            (Node 8 NIL NIL) 
            NIL) 
        (Node 10 
            (Node 15 NIL NIL)
            (Node 1 NIL NIL)
        )
    )

-- (a)
insert :: Tree -> [Int] -> Tree
insert t [] = t
insert NIL (x:xs) = insert (Node x NIL NIL) xs
insert (Node n t1 t2) (x:xs)
    | x < n = insert (Node n (insert t1 [x]) t2) xs
    | otherwise = insert (Node n t1 (insert t2 [x])) xs
            
            
-- (b)
treeEqual :: Tree -> Tree -> Bool
treeEqual NIL NIL = True
treeEqual NIL (Node x t1 t2) = False
treeEqual (Node x t1 t2) NIL = False
treeEqual (Node x t1 t2) (Node y ta tb) 
      = (x == y) && (treeEqual t1 ta) && (treeEqual t2 tb)

      
{- Operatornotation.
   Wir können eine Funktion in backticks "`" schreiben und diese damit in Infixnotation verwenden.
   Operatorpriorität: geringer als Präfixnotation, aber höher als Logikoperatoren
-}

treeEq :: Tree -> Tree -> Bool
treeEq NIL NIL = True
treeEq NIL (Node x t1 t2) = False
treeEq (Node x t1 t2) NIL = False 
treeEq (Node x t1 t2) (Node y ta tb) 
      = (x == y) && (t1 `treeEq` ta) && (t2 `treeEq` tb)
      -- augrund der Operatorpriorität könnte man hier auch alle Klammern weglassen
      
{- Bemerkung zur Nutzung von wildcards in treeEqual
   Die Pattern werden immer von oben nach unten "durchprobiert", d.h. wir können die beiden Fälle, dass je eines der Argumente NIL sind, auch in einen Fall zusammenfassen und diesen *unter* den allgemeinen Fall mit zwei Wildcards schreiben (somit wird dieser Fall nur gemachted, wenn keiner der beiden anderen matched.
   Vertauschen wir die beiden Fälle (wildcards vor allgemeinem Fall), dann meldet ghci auch Redundanz in den Patterns.
-}
treeEqual' :: Tree -> Tree -> Bool
treeEqual' NIL NIL = True
treeEqual' (Node x t1 t2) (Node y ta tb) 
      = (x == y) && (treeEqual' t1 ta) && (treeEqual' t2 tb)
treeEqual' _ _ = False