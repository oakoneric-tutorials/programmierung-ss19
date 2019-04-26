# Übung 3: Algebraische Datentypen und Funktionen höherer Ordnung

## Übungsinhalt
* Baumstrukturen und Funktionen darauf
  * Einfügen in Suchbäume
  * Test auf Gleichheit
  * Anzahl der Blattknoten bestimmen
  * Test auf gerade Anzahl an Kindbäumen
* Funktionen höherer Ordnung `map` , `filter`, `foldr`

## Funktionen höherer Ordnung
Funktionen höherer Ordnung sind Funktionen, die wiederum Funktionen als Argumente und Resultate besitzen. Zum Beispiel:
* `map`: Anwenden einer Funktion auf alle Elemente einer Liste
* `filter`: Auswählen von Listenelementen anhand einer Funktion (eines sog. Prädikates)
* `foldr`: Falten einer Liste von rechts beginnend mit einem Startelement und einer Verknüpfung (repräsentiert durch eine Funktion)

Beachte dazu auch die Hinweise, Definitionen und Beispiele im Skript, sowie in den [Folien zu Übung 2](../tut02/tut02-handout.pdf).

## Operatoren
Wir können eine Funktion `f :: a -> a -> b` auch als Operator auffassen und dann mit backticks in Infixnotation übergehen.
z.B.
```
4 `mod` 2
tree1 `treeEq` tree2
```
Beachte dazu auch das Beispiel der Modulo-Funktion aus [Übung 2](../tut02/02_01_solution.hs) und `treeEq` in [Aufgabe 1 von Blatt 3](./03_01_solution.hs).

## Partielle Applikation

Funktionen können gezielt mit Argumenten unterversorgt werden, d.h. wir lassen entsprechende Argumente weg. Betrachten wir zum Beispiel die Funktion `mod :: Int -> Int -> Int` zur Berechnung der Restklasse zweier Zahlen, dann ist dies ja aufgrund der Rechtsassoziativität mit der Klammerung `mod :: Int -> (Int -> Int)` zu verstehen. Nun liefert `mod 3` eine Funktion `Int -> Int`, die wir beispielsweise an die `map`-Funktion übergeben könnten.

Analog kann man auch Operatoren unterversorgen. Dies geht sogar mit beiden Argumenten! Beispielsweise liefert `map (/2) [1 , 2 , 3 , 4] = [0.5 , 1.0 , 1.5 , 2.0]`, also ist `(/2)` eine Funktion, die ein Argument halbiert. Andersherum liefert `(1/)` eine Funktion, die jeweils das Reziproke, d.h. `map (1/) [1 , 2 , 3 , 4] = [1.0 , 0.5 , 0.3333333333333333 , 0.25]`.

Wollen wir nun nicht etwa das erste Argument einer Funktion "weglassen", so kann man mittels der Funktion `flip`, die die ersten beiden Argumente einer Funktion vertauschen und unter Nutzung der Funktionen `curry` und `uncurry` kompliziertere Konstrukte realisieren. Übersichtlicher ist dann aber die Nutzung von anonymen Funktionen und damit gezielt einen Teil der Argumente mit neuen Werten und Variablen zu binden.
Liegt eine Funktion mit zwei Argumenten vor, so können wir aber einfach in die Operatorschreibweise übergehen und dort beliebig unterversorgen. Ein Test auf gerade Zahlen (wie es z.B. `even` tut) lässt sich dann einfach als ```(0 ==) . (`mod` 2)``` implementieren. Dann liefert ```(0 ==) . (`mod` 2) 3``` den Wert `False`.
