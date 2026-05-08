#import "../../template.typ": *

#let ej17 = solu[Ejercicio 17][
  ¿Cuál es el valor de esta expresión? \
  `[ x | x <- [1..3], y <- [x..3], (x + y) 'mod' 3 == 0 ]`
][
  El valor es: \
  [1, 3]
][]
