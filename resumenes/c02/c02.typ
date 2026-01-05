#import "@preview/flow:0.3.2": *

#set page(
  margin: (right: 3cm, x: 1.8cm, y: 2cm),
) 
#set par(
  justify: true,
  leading: 0.45em,
)

#show title: set text(size: 20pt)
#show title: set align(center)

#show enum: set par(spacing: 0.5em)

#let hh(color, ss) = highlight(fill: color)[#ss]
#let fill(color, ss) = text(fill: color, weight: "semibold")[#ss]

#show link: set text(fill: blue)

#set raw(lang: "haskell")
#set enum(indent: 5pt)
#set list(indent: 5pt)


#title[
  Clase 02 \
  Esquemas de recursión \
  Tipos de datos inductivos
]


= Esquemas de recursión sobre listas
== Recursión estructural ~ _foldr_

#callout()[
  #block(spacing: .5em)[
    Sea `g :: [a] -> b` definida por dos ecuaciones:
  ]
  ```haskell
    g []       = <caso base>
    g (x : xs) = <caso recursivo>
  ```

  `g` está dada por recursión estructural si:
  1. El _caso base_ devuelve un valor z "fijo" (no depende de `g`).
  2. #block()[
    El _caso recursivo_ no puede usar las variables `g` ni `xs`, salvo en la expresión (`g xs`).
    #v(0em)
    ```haskell
    g []       = z 
    g (x : xs) = ...x...(g xs)...
    ```
  ]
]
*Toda recursión estructural es una instancia de _foldr_.*


== Recursión primitiva ~ _recr_
#callout()[
#block(spacing: .5em)[
  Sea `g :: [a] -> b` definida por dos ecuaciones: \
  ]
  ```haskell
    g []       = <caso base> 
    g (x : xs) = <caso recursivo>
  ```
  `g` está dada por recursión primitiva si:
  1. El caso base devuelve un valor z "fijo" (no depende de `g`).
  2. #block()[
  El caso recursivo no puede usar las variables g, salvo en la expresión (`g xs`). (sí la variable `xs`)\
  ```haskell
    g []       = z
    g (x : xs) = ...x...xs...(g xs)...
  ```
  ]
]

#underline()[Observación:] \
- Todas las definiciones dadas por _recursión estructural_ también están dadas por recursión primitiva.
- Hay definiciones dadas por _recursión primitiva_ que no están dadas por recursión estructural.

*Toda recursión primitiva es una instancia de _recr_*

== Recursión iterativa ~ _foldl_
#callout()[
  #block(spacing: .5em)[
  Sea `g :: b -> [a] -> b` definida por dos ecuaciones:
  ]
  ```haskell
    g []       = <caso base>
    g (x : xs) = <caso recursivo>
  ```

  `g` está dada por recursión iterativa si:
  1. El caso base devuelve el acumulador `ac`.
  2. El caso recursivo invoca inmediatamente a (`g ac' xs`), donde `ac'` es el acumulador actualizado en función de su valor anterior y el valor de `x`.
]

*Toda recursión iterativa es una instancia de _foldl_.*

#pagebreak()
= Tipos de datos algebraicos
En general un tipo de dato algebraico tiene la siguiente forma: \
```haskell
  data T = CBase₁      <parámetros>
           ...
         | CBaseₙ      <parámetros>
         | CRecursivo₁ <parámetros>
           ...
         | CRecursivoₙ <parámetros>
```

- Los _constructores base_ no reciben parámetros de tipo  #raw("T").
- Los _constructores recursivos_ reciben al menos un parámetro de tipo #raw("T").
- #block()[
  Los valores de tipo #raw("T") son los que se pueden construir aplicando
  _constructores base y recursivos_ un número finito de veces y sólo esos.
] 

= Esquemas de recursión sobre otras estructuras
Un esquema de recursión estructural espera recibir *un argumento por cada
constructor*, y además *la estructura que va a recorrer*. El tipo de cada
argumento va a depender de lo que reciba el constructor correspondiente. 
*Si el constructor es recursivo*, el argumento corresepondiente del fold va
a recibir el resultado de cada llamada recursiva.

La recursión estructural se generaliza a tipos algebraicos en general. \
#callout()[
  Supongamos que #raw("T") es un tipo algebraico. \
  Dada una función #raw("g :: T -> Y") definida por ecuaciones:
  ```haskell
    g(CBase₁      <parámetros>) = <caso base₁>
    ...
    g(CBaseₙ      <parámetros>) = <caso baseₙ>
    g(CRecursivo₁ <parámetros>) = <caso recursivo₁>
    ...
    g(CRecursivoₙ <parámetros>) = <caso recursivoₙ>
  ```
  g está dada por _recursión estructural_ si:
  1. Cada _caso base_ se escribe combinando los parámetros.
  2. Cada _caso recursivo_ se escribe combinando:
    - Los parámetros del constructor que no son de tipo #raw("T").
    - El llamado recursivo sobre cada parámetro de tipo #raw("T").
    Pero:
    - Sin usar los parámetros del constructor que son de tipo #raw("T").
    - Sin hacer a otros llamados recursivos.
]

