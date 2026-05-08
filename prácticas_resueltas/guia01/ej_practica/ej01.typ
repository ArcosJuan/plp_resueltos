#import "../../template.typ": *

#let ej01 = solu[Ejercicio 1 #estrellita][
  #no-codly[
    #stack(dir: ltr, spacing: 5em)[
      ```
      - max2 (x, y)  | x >= y = x
                     | otherwise = y
      - normaVectorial (x, y) = sqrt (x^2 + y^2)
      - subtract = flip (-)
      - predecesor = subtract 1
      ```
    ][
      ```
      - evaluarEnCero = \f -> f 0
      - dosVeces = \f -> f . f
      - flipAll = map flip
      - flipRaro = flip flip
      ```
    ]

  ]
  #set enum(numbering: "I.", spacing: 10pt)
  + ¿Cuál es el tipo de cada función? (Suponer que todos los números son de tipo `Float`).
  + Indicar cuáles de las funciones anteriores _no_ están currificadas. Para cada una de ellas, definir la función currificada correspondiente. Recordar dar el tipo de la función.
][
  #no-codly[
    #stack(dir: ltr, spacing: 5em)[
      ```
      - (Float, Float) -> Float
      - (Float, Float) -> Float
      - Float -> Float -> Float
      - Float -> Float
      ```
    ][
      ```
      - (Float -> a) -> a
      - (a -> b) -> a -> b
      - [(a -> b -> c)] -> [(b -> a -> c)]
      - b -> (a -> b -> c) -> a -> c
      ```
    ]
  ]
][
  ```hs
  max2 :: Float -> Float -> Float
  max2 x y | x >= y = x
           | otherwise = y

  normaVectorial :: Float -> Float -> Float
  normaVectorial x y = sqrt (x^2 + y^2)
  ```
]

