#import "@preview/curryst:0.6.0": rule, prooftree, rule-set
#import "../utils.typ": *

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

#show link: set text(fill: blue)

#set raw(lang: "haskell")
#set enum(indent: 5pt)
#set list(indent: 5pt)

#let teo(title, color: black, text) = [
  #callout()[
    #underline()[_ #title _] \
    #text
  ]
]

#let cr(body) = text(fill: red, body)
#let cb(body) = text(fill: blue, body)
#let cg(body) = text(fill: green, body)

#title[
  Clase 05 \
  Cálculo-$lambda$
]

#teo([Cálculo-$lambda$])[
  El cálculo-$lambda$ es un *lenguaje de programación* definido de manera rigurosa. \
  Se basa sólo en dos operaciones: construir funciones y aplicarlas.
]

= Cálculo-$lambda^b$: sintaxis y tipado.

#teo("Sintaxis de los tipos")[
  #pad(left: 2cm, top: -10pt)[#cb($tau$), #cb($sigma$),       #cb($rho$),... ::= bool]
  #pad(left: 3.8cm, top: -8pt)[| #cb($tau$) $->$ #cb($sigma$)]
]

#callout()[
  Suponemos dado un conjunto infinito numerable de varibles:
  #pad(left: 2cm, top: -5pt)[$cal(X) = {x,y,z,...}$]
  #underline()[_Sintaxis de los términos_] \
  #pad(left: 2cm, top: -8pt)[
    #cb("M"),
    #cb("N"),
    #cb("P"),
    ... := #cb("x")
  ]
  #pad(left: 4cm, top: -8pt)[
    | $lambda$#cb("x"): #cb($tau$). #cb("M") \
    | #cb("M N") \
    | true \
    | false \
    | if #cb("M") then #cb("N") else #cb("P") \
  ]
]

== Variables libres y ligadas
Una ocurrencia de x esta *ligada* si aparece adentro de una abstracción 
"$lambda$x". Una ocurrencia de x está *libre* si no está ligada.

=== Alfa equivalencia
Los términos que difieren sólo en el nombre de variables _ligadas_ se consideran iguales.

== Sistema de tipos
La noción de "tipabilidad" se formaliza con un sistema deductivo.
#pad(left: 2em)[
  === Contexto de tipado
  Un *contexto de tipado* es un conjunto finito de pares ($"x"_"i"$, $tau_"i"$)
  $ {"x"_1 : tau_1, ..., "x"_n : tau_n} $
  sin variables repetidas ($"i" eq.not "j" => "x"_"i" eq.not "x"_"j"$).
  se nota con letras griegas mayúsculas ($Gamma, Delta, ...$). \

  === Juicios de tipado
  El sistema de tipos predica sobre *juicios de tipado*, de la forma:
  $ Gamma tack "M": tau $
]

== Propiedades del sistema de tipos
#teo("Unicidad de tipos")[
  Si $Gamma tack "M": tau$ y $Gamma tack "M": sigma$ son derivables, entonces $tau = sigma$
]
#teo("Weakening + Strengthening")[
  Si $Gamma tack "M": tau$ es derivable y $"fv"(M) subset.eq "dom"(Gamma inter Gamma')$
  entonces $Gamma' tack "M": tau$ es derivable.
]

#pagebreak()

= Cálculo-$lambda^b$: semántica operacional.
== Semántica formal
#underline("Maneras de dar semántica formal")
1. *Semántica operacional* \
  Indica cómo se ejecuta el programa hasta llegar a un resultado. \
  #pad(left: 2em)[Semántica #underline([_small-step_]): ejecución paso a paso. \
                  Semántica _big-step_: evaluación directa al resultado. \
                  ]
2. *Semántica denotacional* \
  Interpreta los programas como objetos matemáticos.
3. *Semántica axiomática* \
  Establece relaciones lógicas entre el estado del programa antes y despues de la ejecución.

== Semántica operacional _small-step_
=== Programas
Un programa es un termino _M_ tipable y cerrado ( fv(M) = $nothing$ ): \
#pad(left:1.5em, top: -8pt)[- El juicio de tipado $tack "M": tau$ debe ser derviable para algún $tau$.] 

=== Juicios de evaluación
La semántica operacional predica sobre *juicios de evaluación*:
$ M -> N $
donde M y N son programas.

=== Valores
Los valores son los posibles resultados de evaluar programas:
$ "V" ::= "true" | "false" | lambda x : tau. "M" $

=== Sustitución
La operación de *sustitución*:
$ M{x:=N} $
denota el término que resulta de reemplazar todas las ocurrencias libres de x en M por N. \
#pad(left: 2cm, top: -3pt)[
  * _Definición de sustitución_ * \
  #pad(left: 6cm, top: -3pt)[
      $x{x:=N} =^"def" N$ \     
      $"a"{x:=N} =^"def" "a si a" in {"true","false"} union cal(X) \\ {x}$ \     
      #pad(left:-80pt, top: -8pt, bottom: -20pt)[
        (if M then P else Q)${x:=N} =^"def" "if M"{x:=N}$
      ] \     
      #pad(left:2.35cm, top: -8pt, bottom: -20pt)[
        then P{$x:=N$} \
        else Q{$x:=N$}
      ] \
      #pad(left:-33pt, top: -8pt, bottom: -20pt)[
        $(M_1 M_2){x:=N} =^"def" M_1{x:=N} M_2{x:=N}$ \     
      ] \     
      #pad(left:-47pt, top: -8pt, bottom: -20pt)[
        $(lambda "y": tau. M){x:=N} =^"def" lambda "y": tau. M{x:=N}$ \     
      ] \     
      #pad(left:2.35cm, top: -8pt, bottom: -20pt)[
        asumiendo y $in.not {x} union "fv"(N)$
      ] \     
  ]
]

== Juicio de valor en muchos pasos
$ M arrow.twohead N $
donde M y N son programas

#pagebreak()
== Propiedades de la evaluación
#teo("Determinismo")[
  Si $M->N_1$ y $M->N_2$ entonces $N_1 = N_2$.
]

#teo("Preservación de tipos")[
  Si $tack M : tau$ y $M->N$ entonces $tack N : tau$.
]

#teo("Progreso")[
  Si $tack M : tau$ y $M->N$ entonces $tack N : tau$.
  1. O bien M es un valor.
  2. O bien existe N tal que $M->N$.

]

#teo("Terminación")[
  Si $tack M : tau$, entonces no hay una cadena infinita de pasos:
  $ M->M_1->M_2->... $
]


#teo("Corolario: Canonicidad")[
  1. Si $tack M : "bool"$ es derivable, entonces la evaluación de M termina y 
  el resultado es true o false.
  2. Si $tack M : tau->sigma$ es derivable, entonces la evaluación de M termina y 
  el resultado es una abstracción.
]
= Cálculo-$lambda^(b n)$: extensión con números naturales.
#text(size: 6pt)[
  == 1.
  #derivar(
    t-abs(
      "x",
      tipo-bool(),
      t-if(
        t-var("x", tipo-var($tau$)),
        t-false(),
        t-var("x", tipo-var($sigma$))
      )
    ),
    ($Gamma$,), none
  ).derivacion \

  == 2.
  #derivar(
    t-app(
      t-abs(
        "x", tipo-bool(),
        t-abs(
        "y", tipo-bool(),
        t-var("x", tipo-bool())
        )
      ),
      t-var($sigma$, tipo-bool()),
           t-var($tau$, tipo-bool())
    ), ($nothing$,), none
  ).derivacion
]

