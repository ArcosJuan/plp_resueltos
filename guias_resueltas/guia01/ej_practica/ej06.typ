#import "../../template.typ": *

#let ej06 = solu[Ejercicio 6 #estrellita][
  El siguiente esquema captura la recursión primitiva sobre listas.
  #no-codly[
    ```
    recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
    recr _ z [] = z
    recr f z (x : xs) = f x xs (recr f z xs)
    ```
    #set enum(numbering: "a.", spacing: 10pt)
    + Definir la función `sacarUna :: Eq a => a -> [a] -> [a]`, que dados un elemento y una lista devuelve el resultado de eliminar de la lista la primera aparición del elemento (si está presente).
    + Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función sacarUna del punto anterior.
    + Definir la función `insertarOrdenado :: Ord a => a -> [a] -> [a]` que inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento.
  ]
][
  b) FALTA RESPUESTA B
][
  ```hs
  recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
  recr _ z [] = z
  recr f z (x:xs) = f x xs (recr f z xs)

  --a
  sacarUna :: Eq a => a -> [a] -> [a]
  sacarUna e = recr (\x xs rec -> if x==e then xs else x:rec) []

  -- c
  insertarOrdenado :: Ord a => a -> [a] -> [a]
  insertarOrdenado e = recr (\x xs rec -> if e < x then e:x:xs else x:rec) [e]
  ```
]

