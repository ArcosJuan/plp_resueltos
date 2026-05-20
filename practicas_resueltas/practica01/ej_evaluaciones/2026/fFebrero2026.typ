#import "../../../template.typ": *
#import "../../codigo.typ": *

#let fFebrero2026 = solu[Final Febrero 2026 (de Christian Cossio Mercado) #link("https://www.cubawiki.com.ar/images/6/69/Final_febrero_2025.pdf")[🔎]][
  #set enum(numbering: "a)")
  El tipo algebraico `ABBComp a` describe a los árboles binarios de búsqueda (ABB) parcialmente comprimidos con elementos de tipo `a` y sin repetidos. Los `ABBComp` son árboles que pueden tener algún subárbol donde, en vez de seguir con una estructura arbórea, sus elementos se incluyen directamente en una lista ordenada (se asume que `a` pertenece a la clase `Ord`).

  ```data ABBComp a = Nil | Comp [a] | Nodo a (ABBComp a) (ABBComp a)```

  Por ejemplo, las siguientes expresiones denotan árboles de tipo `ABBComp Int` que denotan los mismos elementos:
  - `Comp [0,2,14,22]`
  - `Nodo 2 (Nodo 0 Nil Nil) (Comp [14,22])`
  - `Nodo 14 (Nodo 2 (Nodo 0 Nil Nil) Nil) (Nodo 22 Nil Nil)`

  + Dar el tipo y definir una función `foldABBComp`, que abstraiga el esquema de recursión estructural sobre los _ABB parcialmente comprimidos_.

  + Sin usar recursión explícita, dar el tipo y definir una función `mapABBComp` que aplique una función dada a todos los valores de un árbol del tipo indicado anteriormente.

  + Dar el tipo y definir `recABBComp` que abstraiga el esquema de recursión primitiva sobre estos árboles.

  + Sin usar recursión explícita, dar el tipo y definir la función ordenado, que permitirá verificar el invariante de la estructura (i.e., que los elementos de un `ABBComp` estén ordenados).

  + Dar el tipo y definir la función `iguales(a1,a2)`, que recibe dos `ABBComp` y devuelve `True` si son iguales al recorrerlos inorder. Se deberá usar alguno de los esquemas de recursión anteriores y justificar por qué se lo usó.
][][
  #raw(codigo_fFebrero2026, lang: "Haskell", block: true)
]
