#import "../../template.typ": *

#let ej22 = solu[Ejercicio 22][
  Dado el tipo de datos `AIH a` definido en el ejercicio 14:

  #set enum(numbering: "a)")
  + Definir la lista (infinita) de todos los `AIH` cuyas hojas tienen tipo `()` . Se recomienda definir una función auxiliar. Para este ejercicio *se permite utilizar recursión explícita*.
  + Explicar por qué la recursión utilizada en el punto a) no es estructural.
][
  #block(inset: (x: -5pt))[
    ```hs
    -- a)
    [x | n <- [1..], x <- arbolesNNodos n]

    arbolesNNodos :: Int -> [AIH ()]
    arbolesNNodos 1 = [Hoja ()]
    arbolesNNodos n = [(Bin x y) | m <- [1..n-1], x <- (arbolesNNodos m), y <- (arbolesNNodos (n-m))]
    ```
  ]
][
  #block(inset: (x: 5pt))[

    b) En `arbolesNNodos` hago recursion sobre los naturales, de `n` a 1. Pero en lugar de utilizar el anterior inmediato a `n` en el caso recursivo, como seria apropiado en recursion estructural, uso todas las combinaciones de entre todos los anteriores a `n`.

  ]
]
