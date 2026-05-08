#import "../../template.typ": *

#let ej20 = solu[Ejercicio 20 #estrellita][
  Escribir la función `listasQueSuman :: Int -> [[Int]]` que, dado un número natural $n$, devuelve todas las listas de enteros positivos (es decir, mayores o iguales que 1) cuya suma sea $n$. Para este ejercicio *se permite usar recursión explícita*. Pensar por qué la recursión utilizada no es estructural. (Este ejercicio no es de generación infinita, pero puede ser útil para otras funciones que generen listas infinitas de listas).
][][
  ```hs
  listasQueSuman :: Int -> [[Int]]
  listasQueSuman 0 = [[]]
  listasQueSuman n = [x:xs | x <- [1..n], xs <- listasQueSuman(n-x)]
  ```
]
