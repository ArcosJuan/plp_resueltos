#import "../../template.typ": *

#let ej19 = solu[Ejercicio 19][
  Una tripla pitagórica es una tripla $(a,b,c)$ de enteros positivos tal que $a^2 + b^2 = c^2$. \
  #h(1em) La siguiente expresión intenta ser una definición de una lista (infinita) de triplas pitagóricas:
  #no-codly[
    ```
    pitagóricas :: [(Integer, Integer, Integer)]
    pitagóricas = [(a, b, c) | a <- [1..], b <- [1..], c <- [1..], a^2 + b^2 == c^2]
    ```
  ]
  Explicar por qué esta definición no es útil. Dar una definición mejor.
][
  Esta definición no es útil porque $a$ nunca deja de buscar un número que cumpla la condición $a^2 + 1 == 1$. \
  Una definición mejor seria de la forma:
][
  ```hs
  pitagóricas :: [(Integer, Integer, Integer)]
  pitagóricas = [(a, b, c) | c <- [1..], a <- [1..c], b <- [1..c], a^2 + b^2 == c^2]
  ```
]

