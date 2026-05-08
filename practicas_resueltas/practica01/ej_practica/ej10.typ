#import "../../template.typ": *

#let ej10 = solu[Ejercicio 10][
  #set enum(numbering: "I.")
  + Definir la función `genLista :: a -> (a -> a) -> Integer -> [a]`, que genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

  + Usando `genLista`, definir la función `desdeHasta`, que dado un par de números (el primero menor que el segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.
][][
  ```hs
  -- I.
  genLista :: a -> (a -> a) -> Integer -> [a]
  genLista e f n = foldr (\_ rec -> \y -> y:(rec (f y))) (\y -> []) [1..n] e

  -- II.
  desdeHasta :: Integer -> Integer -> [Integer]
  desdeHasta i j = genLista i (+1) (j-i+1)
  ```
]
