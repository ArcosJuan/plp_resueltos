#import "../../template.typ": *

#let ej07 = solu[Ejercicio 7 #estrellita][
  Definir las siguientes funciones para trabajar sobre listas, y dar su tipo. Todas ellas deben poder aplicarse a listas _finitas_ e _infinitas_.

  #enum(numbering: "I.", spacing: 10pt)[
    `mapPares`, una versión de `map` que toma una función currificada de dos argumentos y una lista de pares. \ *Pista:* recordar `curry` y `uncurry`.
  ][
    `armarPares`, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra, ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en Haskell se llama `zip`. \ *Pista:* aprovechar la currifiación y utilizar evaluación parcial.
  ][
    `mapDoble`, una variante de mapPares, que toma una función currificada de dos argumentos y dos listas (de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de las dos listas. Esta función en Haskell se llama `zipWith`.
  ]
][][
  ```hs
  -- I.
  mapPares :: (a -> b -> c) -> [(a, b)] -> [c]
  mapPares f xs = [f x y | (x, y) <- xs]

  -- II.
  armarPares :: [a] -> [b] -> [(a,b)]
  armarPares xs ys = foldr (\x rec -> \zs ->
    if length zs == 0
      then []
      else (x, head zs):(rec (tail zs))) (\_ -> []) xs ys

  -- III.
  mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
  mapDoble f xs ys = foldr (\x rec -> \zs ->
    if length zs == 0
      then []
      else (f x (head zs)):(rec (tail zs))) (\_ -> []) xs ys
  ```
]
