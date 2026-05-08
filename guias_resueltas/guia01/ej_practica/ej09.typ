#import "../../template.typ": *

#let ej09 = solu[Ejercicio 9 #estrellita][
  #set enum(numbering: "I.", spacing: 10pt)
  + Definir y dar el tipo del esquema de recursión `foldNat` sobre los naturales. Utilizar el tipo `Integer` de Haskell (la función va a estar definida sólo para los enteros mayores o iguales que 0).
  + Utilizando `foldNat`, definir la función `potencia`.

][][
  ```hs
  -- I.
  foldNat :: (Integer -> b -> b) -> b -> Integer -> b
  foldNat _ z 0 = z
  foldNat f z n = f n (foldNat f z (n-1))

  -- II.
  potencia :: Integer -> Integer -> Integer
  potencia n = foldNat (\_ rec -> n * rec) 1
  ```
]
