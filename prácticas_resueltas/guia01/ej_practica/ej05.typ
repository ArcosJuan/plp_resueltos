#import "../../template.typ": *

#let ej05 = solu[Ejercicio 5 #estrellita][
  #set enum(numbering: "I.", spacing: 10pt)
  Considerar las siguientes funciones:
  #no-codly[
    ```
      elementosEnPosicionesPares :: [a] -> [a]
      elementosEnPosicionesPares [] = []
      elementosEnPosicionesPares (x:xs) = if null xs
                                            then [x]
                                            else x : elementosEnPosicionesPares (tail xs)`

      entrelazar :: [a] -> [a] -> [a]
      entrelazar [] = id
      entrelazar (x:xs) = \ys -> if null ys
                                   then x : entrelazar xs []
                                   else x : head ys : entrelazar xs (tail ys)
    ```

    Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando `foldr`. \
    En caso contrario, explicar el motivo.
  ]
][][
  ```hs
  entrelazar :: [a] -> [a] -> [a]
  entrelazar = foldr (\x rec -> \ys -> if null ys
                                       then ys ++ rec ys
                                       else x : head ys : rec (tail ys))
                                       (\_ -> [])
  ```
]

