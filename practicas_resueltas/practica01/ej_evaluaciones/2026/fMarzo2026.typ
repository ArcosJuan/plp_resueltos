#import "../../../template.typ": *
#import "../../codigo.typ": *

#let fMarzo2026 = solu[Final Marzo 2026 (de Christian Cossio Mercado) #link("https://www.cubawiki.com.ar/images/3/30/PLP_final_06-03-26.pdf")[🔎]][
  #set enum(numbering: "a)")
  El tipo algebraico `AdjAB a` describe a las _adjunciones de árboles binarios_ con elementos de tipo `a`. Las `AdjAB` representan listas de árboles binarios, donde cada uno de ellos está al mismo nivel que el otro, que pueden o no tener una raíz en común de acuerdo al constructor usado.

  ```
  data AdjAB a = Raiz a [AB a] | Adj [AB a]
  data AB a = Nil | Hoja a | Arb a (AB a) (AB a)
  ```
  Por ejemplo, las siguientes expresiones denotan distintos árboles de tipo `AdjAB Int`:

  - `Adj [Nil, Nil, Arb 3 Nil Nil, Hoja 6]`
  - `Raiz 5 [Arb 3 (Arb 1 Nil Nil) (Hoja 4), Arb 3 Nil Nil, Nil]`
  - `Raiz 10 []`

  + Dar el tipo y definir una función `foldAdjAB`, que abstraiga el esquema de recursión estructural sobre las _adjunciones de árboles binarios_, recorriendo todos los árboles por completo.

  + Sin usar recursión explícita, dar el tipo y definir una función `mapAdjAB` que aplique una función dada a todos los valores de una adjunción.

  + Dar el tipo y definir `recAdjAB` que abstraiga el esquema de recursión primitiva sobre las adjunciones, recorriendo todos los árboles por completo.

  + Sin usar recursión explícita, dar el tipo y definir la función `ordenado`, que permita saber si toda la adjunción está ordenada. Así, cada árbol debe estar ordenado como un `ABB` y, adicionalmente, si hubiera raíz común, esta debe ser mayor que la raíz de todos los árboles. En el caso de `Nil`, este árbol está trivialmente ordenado y, además, se lo puede ignorar para comparar con la raíz común.

][][
  #raw(codigo_fMarzo2026, lang: "Haskell", block: true)
]
