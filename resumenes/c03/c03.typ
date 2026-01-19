  
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
  Clase 03 \
  Razonamiento ecuacional \
  Inducción estructural 
]

#pad(.5em)[
  #highlight()[_¿Cómo mostramos que un programa hace lo que tiene que hacer?_]\
  _Prueba formal de propiedades_: Demostramos que ciertas expresiones son
  equivalentes para probar que un algoritmo es correcto con respecto a
  otro y para razonar sobre optimizaciones y alternativas.
]

#pad(.5em)[
  #highlight(fill: rgb("ADD8E6"))[_Hipótesis de trabajo_] \
  1. Trabajamos con estructuras de datos *finitas*.
  2. Trabajamos con *funciones totales*.
  3. El programa *no depende del orden* de las ecuaciones.
]

= Igualdades por definición
#callout()[
  #underline()[_Principio de reemplazo_] ⭐\
  Sea #raw("e1 = e2") una ecuación del programa. Las siguientes operaciones
  preservan la igualdad de expresiones:
  1. Reemplazar _cualquier instancia_ de #raw("e1") por #raw("e2").
  2. Reemplazar _cualquier instancia_ de #raw("e2") por #raw("e1").

  #fill(red)[
  Si la igualdad se puede demostrar usando sólo el principio de reemplazo 
  decimos que la igualdad vale *por definición*.
  ]
]

= Inducción estructural

#callout()[
  #underline()[_Principio de inducción estructural_] ⭐\
  #block(spacing: .5em)[
    Sea un tipo inductivo:
  ]
  ```haskell 
      data T = CBase₁ <parámetros>
               ...
             | CBaseₙ <parámetros>
             | CRecursivo₁ <parámetros>
               ...
             | CRecursivoₙ <parámetros>
  ```
  Sea $cal(P)$ una propiedad acerca de las expresiones tipo #raw("T")
  tal que:
  - $cal(P)$ vale sobre todos los constructores base de #raw("T"),
  - #block()[
    $cal(P)$ vale sobre todos los constructores recursivos de #raw("T"), \
    asumiendo como hipótesis inductiva que vale ara los parámetros de 
    tipo #raw("T"),
  ]
  entonces $forall x :: "T". cal(P)(x)$.
]

#callout()[
  #underline()[_Principio de inducción sobre booleanos_] \
  Si $cal(P)("True")$ y $cal(P)("False")$ entonces $forall x :: "Bool".
  thin cal(P)(x)$.
]
#callout()[
  #underline()[_Principio de inducción sobre pares_] \
  Si $forall x :: "a".thin forall y :: "b". thin cal(P)((x, y))$ \
  entonces $forall p :: ("a", "b"). thin cal(P)(p)$.
]

#callout()[
  #underline()[_Principio de inducción sobre naturales_] \
  Si $cal(P)("Zero") "y" forall"n" :: "Nat". ( cal(P)("n") =>
  cal(P)("Suc n") )$, \
  entonces $forall"n" :: "Nat". thin cal(P)("n")$.
]

#callout()[
  #underline()[_Principio de inducción sobre listas_] \
  Sea $cal(P)$ una propiedad sobre expresiones de tipo #raw("[a]") tal que: 
  - $cal(P)([ thin ])$
  - $forall"x" :: "a". thin forall"xs" :: "[a]". thin 
     (cal(P)("xs") => cal(P)("x" : "xs"))$
  Entonces $forall"xs" :: "[a]". thin cal(P)("xs")$.
]

#callout()[
  #underline()[_Principio de inducción sobre árboles binarios_] \
  Sea $cal(P)$ una propiedad sobre expresiones de tipo #raw("AB a") tal que:
  - $cal(P)("Nil")$
  - $forall"i" :: "AB a". thin forall"r" :: "a". thin 
     forall"d" :: "AB a".$ \
     $(cal(P)"(i)" and cal(P)"(d)") => cal(P)("Bin i r d")$

  Entonces $forall"x" :: "AB a". thin cal(P)("x")$.
]

#callout()[
  #underline()[_Principio de inducción sobre polinomios_] \
  ```haskell
    data Poli a = X
                | Cte a
                | Suma (Poli a) (Poli a)
                | Prod (Poli a) (Poli a)
  ```
  Sea $cal(P)$ una propiedad sobre expresiones de tipo #raw("Poli") a tal
  que:
  - $cal(P)("X")$
  - $forall"k" :: "a". thin cal(P)("Cte k")$
  - $forall"p" :: "Poli a". thin forall"q" :: "Poli a".$ \
    $((cal(P)("p") and cal(P)("q"))) => cal(P)("Suma p q")$
  - $forall"p" :: "Poli a". thin forall"q" :: "Poli a".$ \
    $((cal(P)("p") and cal(P)("q"))) => cal(P)("Prod p q")$
  Entonces $forall"x" :: "Poli a". thin cal(P)("x")$
]

== Lemas de generación
Usando el principio de inducción estructural, se puede probar: \
#callout()[
  #underline()[_Lema de generación para pares_] \
  Si #raw("p :: (a, b)"), entonces $exists"x" :: "a". thin
  thin exists"y" :: "b". thin thin "p = (x, y)"$.
]

#callout()[
  #underline()[_Lema de generación para sumas_] \
  Si #raw("e :: Either a b"), entonces:
  - o bien $exists"x" :: "a". "e = Left x"$
  - o bien $exists"y" :: "b". "e = Right y"$
]

#callout()[
  #underline()[_Lema de generación para listas_] \
  Si #raw("xs :: [a]"), entonces:
  - o bien $"xs = [ ]"$
  - o bien $exists"y" :: "a".thin exists"ys" :: "[a]". "xs = (y:ys)"$
]

#callout()[
  #underline()[_Lema de generación para booleanos_] \
  Si #raw("x :: Bool"), entonces:
  - o bien x = True
  - o bien x = False
]

#pagebreak()
= Extensionalidad
Una equivalencia puede valer dependiendo el punto de vista. \

#underline()[#highlight()[Punto de vista #fill(red)[intencional]]] \
Dos valores son iguales si están construidos de la misma manera.

#underline()[#highlight()[Punto de vista #fill(blue)[extensional]]] \
Dos valores son iguales si son indistinguibles al observarlos.

#callout()[
  #underline()[_Principio de extensionalidad funcional_] ⭐\
  Sean #raw("f, g :: a -> b"). \
  Si ($forall"x" :: "a". "f x = g x"$) entonces f = g 

  Entonces, probar f = g se reduce a probar: \
  $forall"x"::"a". thin "f x = g x"$
]

== Algunas propiedades utiles para demostraciones
#callout()[
  Sea $forall"F" :: "a" -> "b". quad forall"G" :: "a" -> "b".
      quad forall"Y" :: "b". quad forall"Z" :: "a".$

  #raw("F = G") #h(3.3em) $<=> forall"x" :: "a. F x = G x"$ \
  #raw("F = \x -> Y") #h(.4em) $<=> forall"x" :: "a. F x = Y"$\
  #raw("(\x -> Y) Z") #h(.5em) $=_beta "Y reemplazando x por Z"$\
  #raw("\x -> F x") #h(1.5em) $=_eta "F"$\

  #underline()[x no puede aparecer libre en F, G ni Z.]
]

== Pasos a seguir en una demostración
- Leer la propiedad, entenderla y convencerse de que es verdadera.
- Plantear la propiedad como predicado unario
  #footnote[Un predicado unario es un predicado $cal(P)$ de aridad 1, es decir que solo acepta un unico argumento].
- Plantear el esquema de inducción.
- Plantear y resolver el o los caso(s) base.
- Plantear y resolver el o los caso(s) inductivo(s).

= Isomorfismos de tipos
Dos tipos de datos son isomorfos cuando representan la misma información,
pero escrita de distinta manera.
#callout()[
  Decimos que dos tipos de datos A y B son *isomorfos* si:
  1. Hay una función f :: A -> B total.
  2. Hay una función g :: B -> A total.
  3. Se puede demostrar que g . f = id :: A -> A.
  4. Se puede demostrar que f . g = id :: B -> B.
  Escribimos A $tilde.eq$ B para indicar que A y B son isomorfos.
]
