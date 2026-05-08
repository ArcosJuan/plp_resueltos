#import "../../template.typ": *

#let ej04 = solu[Ejercicio 4][
  #set enum(numbering: "I.", spacing: 10pt)
  + Definir la función `permutaciones :: [a] -> [[a]]`, que dada una lista devuelve todas sus permutaciones. Se recomienda utilizar `concatMap :: (a -> [b]) -> [a] -> [b]`, y también `take` y `drop`.
  + Definir la función `partes`, que recibe una lista L y devuelve la lista de todas las listas formadas por los mismos elementos de L, en su mismo orden de aparición. \
    Ejemplo: `partes [5, 1, 2]` $~>$ `[[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]]` \
    (en algún orden).
  + Definir la función `prefijos`, que dada una lista, devuelve todos sus prefijos. \
    Ejemplo: `prefijos [5, 1, 2]` $~>$ `[[], [5], [5, 1], [5, 1, 2]]`
  + Definir la función `sublistas` que, dada una lista, devuelve todas sus sublistas (listas de elementos que aparecen consecutivos en la lista original). \
    Ejemplo: `sublistas [5, 1, 2]` $~>$ `[[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]]` \
    (en algún orden).
][][
  ```hs
  -- I.
  permutaciones :: [a] -> [[a]]
  permutaciones = foldr (\x rec -> concatMap (insertV x) rec) [[]]
    where insertV v xs = map (\x -> (take x xs)++v:(drop x xs)) [0..(length xs)]
  -- II.
  partes :: [a] -> [[a]]
  partes = foldr (\x rec -> rec++(map (x:) rec)) [[]]
  -- III.
  prefijos :: [a] -> [[a]]
  prefijos xs = foldl (\rec x -> rec++[take x xs]) [[]] [1..(length xs)]
  -- IV.
  sublistas :: [a] -> [[a]]
  sublistas = foldr (\x rec -> sufijos x ++ rec) [[]] . prefijos
    where sufijos xs = foldr (\x rec -> (drop x xs):rec) [] [0..(length xs - 1)]
  ```
]
