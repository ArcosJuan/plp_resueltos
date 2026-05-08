#import "../../template.typ": *

#let ej02 = solu[Ejercicio 2 #estrellita][
  #set enum(numbering: "I.", spacing: 10pt)
  + Definir la función `curry`, que dada una función de dos argumentos, devuelve su equivalente currificada.
  + Definir la función `uncurry`, que dada una función currificada de dos argumentos, devuelve su versión no currificada equivalente. Es la inversa de la anterior.
  + ¿Se podría definir una función `curryN`, que tome una función de un número arbitrario de argumentos y devuelva su versión currificada? \
    *Sugerencia*: pensar cuál sería el tipo de la función.
][
  III. No. no puedo definir el tipo de una función de infinitos argumentos.
][
  ```hs
  -- I.
  curry :: ((a, b) -> c) -> (a -> b -> c)
  curry f = (\x y -> f (x, y))

  -- II.
  uncurry ::  (a -> b -> c) -> ((a, b) -> c)
  uncurry f = (\(x, y) -> f x y)
  ```
]

