#import "../../template.typ": *

#let ej21 = solu[Ejercicio 21 #estrellita][
  Definir en Haskell una lista que contenga todas las listas finitas de enteros positivos (esto es, con elementos mayores o iguales que 1).
][][
  ```hs
  [xs | n <- [1..], xs <- listasQueSuman(n)]
  ```
]

