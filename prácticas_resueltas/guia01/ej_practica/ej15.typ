#import "../../template.typ": *

#let ej15 = solu[Ejercicio 15 #estrellita][
  #set enum(numbering: "I.", spacing: 8pt)
  + Definir el tipo `RoseTree` de árboles no vacíos, con una cantidad indeterminada de hijos para cada nodo.
  + Escribir el esquema de recursión estructural para `RoseTree`. *Importante* escribir primero su tipo.
  + Usando el esquema definido, escribir las siguientes funciones:
    #set enum(numbering: "a)", spacing: 8pt)
    + `hojas`, que dado un `RoseTree`, devuelva una lista con sus hojas ordenadas de izquierda a derecha, según su aparición en el `RoseTree`.
    + `distancias`, que dado un `RoseTree`, devuelva las distancias de su raíz a cada una de sus hojas.
    + `altura`, que devuelve la altura de un `RoseTree` (la cantidad de nodos de la rama más larga). Si el `RoseTree` es una hoja, se considera que su altura es 1.

][][
  ```hs
  -- I.
  data RoseTree a = Hoja a | Tree [RoseTree a]
  -- II.
  foldRT :: ([b] -> b) -> (a -> b) -> RoseTree a -> b
  foldRT _ fb (Hoja x) = fb x
  foldRT f fb (Tree xs) = f (map (foldRT f fb) xs)
  -- III. a)
  hojas :: RoseTree a -> [a]
  hojas = foldRT (foldr (++) []) (:[])
  -- III. b)
  distancias :: RoseTree a -> [Int]
  distancias = foldRT (foldr (\x rec -> (map (+1) x)++rec) []) (const [0])
  -- III. c)
  altura :: RoseTree a -> Int
  altura t = 1 + (foldr1 max (distancias t))
  ```
]
