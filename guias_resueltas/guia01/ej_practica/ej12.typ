#import "../../template.typ": *

#let ej12 = solu[Ejercicio 12][
  Considerar el siguiente tipo, que representa a los árboles binarios:
  #h(1em)`data AB a = Nil | Bin (AB a) a (AB a)`
  #set enum(numbering: "I.")
  + Usando recursión explícita, definir los esquemas de recursión estructural (`foldAB`) y primitiva (`recAB`), y dar sus tipos.

  + Definir las funciones `esNil`, `altura` y `cantNodos` (para `esNil` puede utilizarse case en lugar de `foldAB` o `recAB`)

  + Definir la función `mejorSegún :: (a -> a -> Bool) -> AB a -> a`, análoga a la del ejercicio 3, para árboles.\ Se recomienda definir una función auxiliar para comparar la raíz con un posible resultado de la recursión para un árbol que puede o no ser `Nil`.

  + Definir la función `esABB :: Ord a => AB a -> Bool` que chequea si un árbol es un árbol binario de búsqueda. \ Recordar que, en un árbol binario de búsqueda, el valor de un nodo es mayor o igual que los valores que aparecen en el subárbol izquierdo y es estrictamente menor que los valores que aparecen en el subárbol derecho.

  + Justificar la elección de los esquemas de recursión utilizados para los tres puntos anteriores.
][][
  #show raw: set text(size: 7.1pt)
  ```hs
  data AB a = Nil | Bin (AB a) a (AB a)

  -- I.
  foldAB :: (b -> a -> b -> b) -> b -> AB a -> b
  foldAB _ v (Nil) = v
  foldAB fb v (Bin i x d) = fb (foldAB fb v i) x (foldAB fb v d)

  recAB :: (AB a -> b -> a -> AB a -> b -> b) -> b -> AB a -> b
  recAB _ v (Nil) = v
  recAB fb v (Bin i x d) = fb i (recAB fb v i) x d (recAB fb v d)

  -- II.
  esNil :: AB a -> Bool
  esNil = foldAB (\rec_i _ rec_r -> False && rec_i && rec_r) True

  altura :: AB a -> Int
  altura = foldAB (\rec_i _ rec_r -> 1 + max rec_i rec_r) 1

  cantNodos :: AB a -> Int
  cantNodos = foldAB (\rec_i _ rec_r -> 1 + rec_i + rec_r) 1

  -- III.
  mejorSegun :: (a -> a -> Bool) -> AB a -> a
  mejorSegun f (Bin i r d)= foldAB (\fi x fd -> \y -> mejor y (mejor (fi x) (fd x))) (id) (Bin i r d) r
    where mejor x y = if f x y then x else y

  -- IV.
  esABB :: Ord a => AB a -> Bool
  esABB = recAB (\i rec_i x d rec_d -> (valido (>=) x i) && (valido (<) x d)) True
    where valido f x ab = case ab of
                            Nil -> True
                            (Bin i r d) -> f x r
  ```
]

