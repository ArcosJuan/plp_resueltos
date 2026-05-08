#import "../../template.typ": *

#let ej16 = solu[Ejercicio 16][
  Se desea representar conjuntos mediante Hashing abierto _(chaining addressing)_. El hashing abierto consta de dos funciones: una _función de Hash_, que dado un elemento devuelve un valor entero (el cual se espera que no se repita con frecuencia), y una tabla de Hash, que dado un número entero devuelve los elementos del conjunto a los que la función de Hash asignó dicho número (es decir, la preimagen de la función de Hash para ese número). \
  #h(1em) Los representaremos en Haskell de la siguiente manera: \
  #h(1em) `data HashSet a = Hash (a -> Integer) (Integer -> [a])` \
  #h(1em) Por contexto de uso, vamos a suponer que la tabla de Hash es una función total, que devuelve listas vacías para los números que no corresponden a elementos del conjunto. Este es un *invariante* que deberá preservarse en todas las funciones que devuelvan conjuntos.

  Definir las siguientes funciones:

  #set enum(numbering: "I.")
  + vacío :: (a -> Integer) -> HashSet a, que devuelve un conjunto vacío con la función de Hash indicada.

  + pertenece :: Eq a => a -> HashSet a -> Bool, que indica si un elemento pertenece a un conjunto. Es decir, si se encuentra en la lista obtenida en la tabla de Hash para el número correspondiente a la función de Hash del elemento.

    Por ejemplo: \
    `pertenece 5 $ agregar 1 $ agregar 2 $ agregar 1 $ vacío (flip mod 5)` devuelve False. \
    `pertenece 2 $ agregar 1 $ agregar 2 $ agregar 1 $ vacío (flip mod 5)` devuelve True.

  + `agregar :: Eq a => a -> HashSet a -> HashSet a`, que agrega un elemento a un conjunto. Si el elemento ya estaba en el conjunto, se debe devolver el conjunto sin modificaciones.

  + `intersección :: Eq a => HashSet a -> HashSet a -> HashSet a`, que, dados dos conjuntos, devuelve un conjunto con la misma función de Hash del primero y con los elementos que pertenecen a ambos conjuntos a la vez.

  + `foldr1` (no relacionada con los conjuntos). Dar el tipo y definir la función `foldr1` para listas *sin usar recursión explícita*, recurriendo a alguno de los esquemas de recursión conocidos. \
    Se recomienda usar la función `error :: String -> a` para el caso de la lista vacía.
][][
  ```hs
  data HashSet a = Hash (a -> Integer) (Integer -> [a])
  -- I.
  vacio :: (a -> Integer) -> HashSet a
  vacio f = Hash f (\_ -> [])

  -- II.
  pertenece :: Eq a => a -> HashSet a -> Bool
  pertenece v (Hash fa fi) = foldr (\x rec -> v == x || rec ) False (fi (fa v))

  -- III.
  agregar :: Eq a => a -> HashSet a -> HashSet a
  agregar v (Hash fa fi) = if pertenece v (Hash fa fi)
                           then Hash fa fi
                           else Hash fa (\i -> if i == (fa v)
                                       then v : (fi (fa v))
                                       else fi i)

  -- IV.
  interseccion :: Eq a => HashSet a -> HashSet a -> HashSet a
  interseccion (Hash fa fi1) (Hash _ fi2) = Hash fa (\i -> foldr (\x rec -> if elem x rec then rec else x:rec) (fi1 i) (fi2 i))

  -- V.
  foldr1 :: (a -> a -> a) -> [a] -> a
  foldr1 f l = if null l
                then error "Lista vacia"
                else recr (\x xs rec -> if null xs then x else f x rec) (head l) l

  ```
]
