#import "../../template.typ": *

#let ej11 = solu[Ejercicio 11][
  Definir el esquema de recursión estructural para el siguiente tipo:
  #no-codly[
    ```
        data Polinomio a = X
                        | Cte a
                        | Suma (Polinomio a) (Polinomio a)
                        | Prod (Polinomio a) (Polinomio a)
    ```
  ]
  Luego usar el esquema definido para escribir la función `evaluar :: Num a => a -> Polinomio a -> a` que, dado un número y un polinomio, devuelve el resultado de evaluar el polinomio dado en el número dado.
][][
  ```hs
  data Polinomio a = X
                   | Cte a
                   | Suma (Polinomio a) (Polinomio a)
                   | Prod (Polinomio a) (Polinomio a)

  foldPoli :: (b -> b -> b) -> (b -> b -> b) -> (a -> b) -> b -> Polinomio a -> b
  foldPoli _ _ _ v X = v
  foldPoli _ _ fc _ (Cte c) = fc c
  foldPoli fp fs fc v (Suma x y) = fs (foldPoli fp fs fc v x) (foldPoli fp fs fc v y)
  foldPoli fp fs fc v (Prod x y) = fp (foldPoli fp fs fc v x) (foldPoli fp fs fc v y)

  evaluar :: Num a => a -> Polinomio a -> a
  evaluar v = foldPoli (*) (+) (id) v
  ```
]

