#import "../../template.typ": *

#let ej14 = solu[Ejercicio 14][
  Se desea modelar en Haskell los árboles con información en las hojas (y sólo en ellas). Para esto introduciremos el siguiente tipo:

  #h(2em) `data AIH a = Hoja a | Bin (AIH a) (AIH a)`

  #enum(numbering: "a)", spacing: 10pt)[
    Definir el esquema de recursión estructural `foldAIH` y dar su tipo. Por tratarse del primer esquema de recursión que tenemos para este tipo, se permite usar recursión explícita.
  ][
    Escribir las funciones `altura :: AIH a -> Integer` y `tamaño :: AIH a -> Integer`. \
    Considerar que la altura de una hoja es 1 y el tamaño de un `AIH` es su cantidad de hojas.
  ]
][][
  ```hs
  data AIH a = Hoja a | Bin (AIH a) (AIH a)

  -- a)
  foldAIH :: (b -> b -> b) -> (a -> b) -> AIH a -> b
  foldAIH _ fb (Hoja x) = fb x
  foldAIH f fb (Bin x y) = f (foldAIH f fb x) (foldAIH f fb y)

  -- b)
  altura :: AIH a -> Integer
  altura = foldAIH (\x y -> 1 + (max x y)) (const 1)

  tamaño :: AIH a -> Integer
  tamaño = foldAIH (\x y -> 1 + x + y) (const 1)
  ```
]
