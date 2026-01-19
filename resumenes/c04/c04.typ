#import "@preview/curryst:0.6.0": rule, prooftree, rule-set

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
  Clase 04 \
  Sistemas deductivos \
  Deducción natural para lógica proposicional 
]

#let teo(title, color: black, text) = [
  #callout()[
    #underline()[#fill(color)[ _ #title _]] \
    #text
  ]
]


== Sistemas deductivos
Un *sistema deductivo* sirve para razonar acerca de #fill(blue)[*juicios*], para demostarlos. \
Los #fill(blue)[*juicios*] son *afirmaciones mátematicamente precisas* sobre programas en distintos lenguajes de programación. \
Un *sistema deductivo* está dado por *reglas de inferencia*, de la forma:
#prooftree(
  rule(
    $chevron.l"premisa"chevron.r _1$,
    $chevron.l"premisa"chevron.r _2$, "...",
    $chevron.l"premisa"chevron.r _n$,
    $chevron.l"conclusión"chevron.r _n$,
    name: $chevron.l"nombre de la regla"chevron.r$
  )
)

Las reglas que no tienen premisas ($n = 0$) se llaman *axiomas*.

Las premisas son *condiciones suficientes* para la conclusión.

- Lectura de arriba hacia abajo: \
  si tenemos evidencia de que valen las premisas, \
  podemos deducir que vale la conclusión.
- Lectura de abajo hacia arriba: \
  si queremos demostrar que vale la conclusión, \
  alcanza con demostrar que valen las premisas.

Una *derivación* es un árbol finito formado por reglas de inferencia.
Parte de ciertas premisas y llega a una conclusión. \
Un #fill(blue)[juicio] es *derivable* si hay alguna derivación sin premisas que lo concluye

== Deducción natural para lógica proposicional
=== Fórmulas de la lógica proposicional
Las #fill(green)[*fórmulas*] son las expresiones que se pueden generar a partir de la siguiente gramática:
#pad(left:1em)[$tau, sigma, phi,... ::= "P" | (tau and sigma) | (tau or sigma) | bot | not tau$]

Las gramáticas definen sistemas deductivos de manera abreviada.

=== Contextos y juicios
Un *contexto* es un conjunto finito de #fill(green)[fórmulas]. Los notamos con letras
griegas mayúsculas ($Gamma, Delta, Sigma, ...$).

El sistema de *deducción natural* predica sobre juicios de la forma:
$ Gamma tack tau $
Informalmente, un juicio afirma que a partir de las hipótesis en el contexto $Gamma$ es posible deducir la #fill(green)[formula] de la tesis.

El conectivo $bot$ representa la falsedad (contradicción, absurdo) y *no* tiene reglas de introducción.

== Semántica bivaluada


