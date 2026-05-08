#import "../../template.typ": *

#let ej03 = solu[Ejercicio 3 #estrellita][
  #set enum(numbering: "I.", spacing: 10pt)
  + Redefinir usando `foldr` las funciones `sum`, `elem`, `(++)`, `filter` y `map`.
  + Definir la función `mejorSegún :: (a -> a -> Bool) -> [a] -> a`, que devuelve el máximo elemento de la lista según una función de comparación, utilizando `foldr1`. Por ejemplo, `maximum = mejorSegún (>)`.
  + Definir la función `sumasParciales :: Num a => [a] -> [a]`, que dada una lista de números devuelve otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original desde la cabeza hasta la posición actual. Por ejemplo, `sumasParciales [1,4,-1,0,5]` $~>$ `[1,5,4,4,9]`.
  + Definir la función `sumaAlt`, que realiza la suma alternada de los elementos de una lista. Es decir, da como resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar `foldr`.
  + Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo, etc.). Pensar qué esquema de recursión conviene usar en este caso.
][][
  ```hs
  -- I.
  sum :: Num a => [a] -> a
  sum = foldr (+) 0

  elem :: Eq a => a -> [a] -> Bool
  elem e = foldr ((||) . (==e)) False

  (++) :: [a] -> [a] -> [a]
  (++) xs ys = foldr (:) ys xs

  filter :: (a -> Bool) -> [a] -> [a]
  filter f = foldr (\x rec -> if f x then x:rec else rec) []

  map :: (a -> b) -> [a] -> [b]
  map f = foldr ((:) . f) []
  -- II.
  mejorSegún :: (a -> a -> Bool) -> [a] -> a
  mejorSegún f = foldr1 (\x rec -> if f rec x then rec else x)
  -- III.
  sumasParciales :: Num a => [a] -> [a]
  sumasParciales xs = foldr (\x rec -> (\n -> (x+n):(rec (x+n)))) (\_ -> []) xs 0
  -- IV.
  sumaAlt :: Num a => [a] -> a
  sumaAlt = foldr (\x rec -> x + (rec * (-1))) 0
  -- V.
  sumaAltInv :: Num a => [a] -> a
  sumaAltInv = foldl (\rec x ->  x + (rec * (-1))) 0
  ```
]
