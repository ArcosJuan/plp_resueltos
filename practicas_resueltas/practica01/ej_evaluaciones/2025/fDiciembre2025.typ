#import "../../../template.typ": *
#import "../../codigo.typ": *


#let fDiciembre2025 = solu[Final Diciembre 2025 (de Christian Cossio Mercado) #link("https://www.cubawiki.com.ar/index.php/Final_17/12/25_(PLP)")[🔎]][
  #set enum(numbering: "a.")
  Sean los siguientes tipos:
  ```
  data Indice = I1 | I2 | I3
  data AT a = Hoja a | Nodo (Indice -> AT a)
  ```
  En donde `AT` a representar el tipo de dato "Árbol Trébol", dar:
  + Dar el tipo e implementar `foldAT`
  + Definir la función `altura :: AT a → Int`
  + Dar el tipo e implementar `mapAT` que, dada una función, se la aplica a todas las hojas de un árbol trébol.

  Todo nodo SIEMPRE tiene 3 árboles trébol asociados.
][][
  #raw(codigo_fDiciembre2025, lang: "Haskell", block: true)
]
