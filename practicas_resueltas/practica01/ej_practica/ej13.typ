#import "../../template.typ": *

#let ej13 = solu[Ejercicio 13][
  Dado el tipo `AB a` del ejercicio 12:
  #set enum(numbering: "I.")
  + Definir las funciones `ramas` (caminos desde la raíz hasta las hojas), `cantHojas` y `espejo`.

  + Definir la función `mismaEstructura :: AB a -> AB b -> Bool` que, dados dos árboles, indica si éstos tienen la misma forma, independientemente del contenido de sus nodos. \ *Pista:* usar evaluación parcial y recordar el ejercicio 7.
][][
  #show raw: set text(size: 7.1pt)
  ```hs
  -- I.
  ramas :: AB a -> [[a]]
  ramas = foldAB (\rec_i x rec_d -> (map (x:) rec_i)++(map (x:) rec_d)) [[]]

  cantHojas :: AB a -> Int
  cantHojas = foldAB (\rec_i _ rec_r -> rec_i + rec_r) 1

  espejo :: AB a -> AB a
  espejo = foldAB (\rec_i x rec_d -> Bin rec_d x rec_i) Nil

  -- II.
  mismaEstructura :: AB a -> AB b -> Bool
  mismaEstructura = foldAB (\rec_i x rec_d -> \ab -> case ab of
                                                Nil -> False
                                                (Bin i r d) -> (rec_i i) && (rec_d d)
                                                ) (\ab -> case ab of
                                                     Nil -> True
                                                     _ -> False
                                                     )
  ```
]

