#import "../../template.typ": *

#let ej18 = solu[Ejercicio 18 #estrellita][
  Definir la lista infinita `paresDeNat::[(Int,Int)]`, que contenga todos los pares de números naturales: `(0,0),(0,1),(1,0),` etc.
][][
  ```hs
  paresDeNat :: [(Int, Int)]
  paresDeNat = [(x, y) | z <- [0..], x <- [0..z], y <- [0..z], x + y == z]
  ```
]
