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
#let fill(color, ss) = text(fill: color, weight: "semibold")[#ss]

#show link: set text(fill: blue)

#set raw(lang: "haskell")
#set enum(indent: 5pt)
#set list(indent: 5pt)

#let teo(title, color: black, text) = [
  #callout()[
    #underline()[#fill(color)[ _ #title _]] \
    #text
  ]
]

#title[
  Clase 04 \
  Sistemas deductivos \
  Deducción natural para lógica proposicional 
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
Informalmente, un #fill(blue)[juicio] afirma que a partir de las hipótesis en el contexto $Gamma$ es posible deducir la #fill(green)[formula] de la tesis.

#pagebreak()

#align(center)[
  #underline()[== Reglas de inferencia - Deducción natural intuicionista]
  #axioma($tau$)
  #columns(2)[
    === Introducción 
    #i-conj($tau$, $sigma$, $Gamma tack tau$, $Gamma tack sigma$)
    #i-impl(
      $tau$, $sigma$,
      $Gamma, tau tack sigma$
    )
    #columns(2)[
      #i-dis1(
        $tau$, $sigma$,
        $Gamma tack tau$
      )
      #colbreak()
      #i-dis2(
        $tau$, $sigma$,
        $Gamma tack sigma$
      )
    ]
    #i-neg($tau$, $Gamma, tau tack bot$)

    #colbreak()

    === Eliminación
    #columns(2)[
      #e-conj1(
        $tau$,
        $Gamma tack tau and sigma$
      )
      #colbreak()
      #e-conj2(
        $sigma$,
        $Gamma tack tau and sigma$
      )
    ]
    #e-impl(
      $sigma$,
      $Gamma tack tau => sigma$, $Gamma tack tau$
    )
    #e-dis(
      $rho$,
      $Gamma tack tau or sigma$,
      $Gamma, tau tack rho$,
      $Gamma, sigma tack rho$
    )
    #e-neg(
      $Gamma tack tau$, $Gamma tack not tau$
    )
    #e-bottom($tau$, $Gamma tack bot$)
  ]
  #text(size: 0.7em)[
  \*El conectivo $bot$ representa la falsedad (contradicción, absurdo) y *no*  tiene reglas de introducción. \
  ]
  Por inducción estructural en la derivación puede demostrarse *weakening*:
  #weakening($sigma$, $tau$, $Gamma tack tau$)

  #underline()[== Reglas derivadas]
  Reglas que se deducen de las anteriores

  #grid(
    columns: 2,
    gutter: 10em,
    modus-tollens(
      $tau$,
      $Gamma tack tau => sigma$, $Gamma tack not sigma$
    ),
    i-doble-neg($tau$, $tau$)
  )

  #underline()[== Principios de razonamiento clásicos]
  No es posible deducir estas reglas de las anteriores.
  #grid(
    columns: 2,
    gutter: 10em,
    e-doble-neg($tau$, $Gamma tack not not tau$),
    lem($tau$)
  )
  #pbc($tau$, $Gamma, not tau tack bot$)
]
#pagebreak()

== Lógica intuicionista vs. lógica clásica
#pad(left:2em)[
  *NJ* $thin thin->$ sistema de deducción natural intuicionista. \
  *NK* $->$ sistema de deducción natural clásica.
]
- *NK* extiende *NJ* con principios de razonamiento clásicos. \
- Si un juicio es derivable en *NJ*, también es derivable en *NK*
- *NJ* es más restrictiva. No permite usar $not not_"e", "LEM", "PBC", "etc"$.
- Para hacer matemática, comúnmente usamos lógica clásica.
- *NJ* nos permite razonar acerca de *información*.
- Las derivaciones en *NJ* se pueden entender como programas. \
  *NJ* es la base de un lenguaje de programación funcional.

== Semántica bivaluada
=== Valuaciones
Una valuación es una función $"v" : P -> {V, F}$ que asigna valores
de verdad a las variables proposicionales. \
Una valuación v *satisface* una fórmula $tau$ si $"v" tack.double tau$,
donde: \
#pad(left: 2em)[
#grid(
  columns: 4, column-gutter: (0em, -2em, -1.6em, 1em),
  [
    $"v" tack.double P$ \
    $"v" tack.double tau and sigma$ \
    $"v" tack.double tau => sigma$ \
    $"v" tack.double tau or sigma$ \
    $"v" tack.double bot$ \
    $"v" tack.double not tau$ \
  ],
  [
    $<==>$ \
    $<==>$ \
    $<==>$ \
    $<==>$ \
    nunca vale \
    $<==>$ \
  ],
  [
    $"v"(P)=V$ \
    $"v" tack.double tau$ \
    $"v" tack.double.not tau$ \
    $"v" tack.double tau$    \
    \
    $"v" tack.double.not tau$ \
  ],
  [
    \
    $"y v" tack.double sigma$ \
    $"o v" tack.double sigma$ \
    $"o v" tack.double sigma$ \
     \
  ]
)
]
Una valuación v satisface un contexto $Gamma$ (notación: v $tack.double Gamma$) si y sólo si v satisface a todas las fórmulas de $Gamma$. \

Un contexto $Gamma$ satisface una fórmula $tau$ (notación: $Gamma tack.double tau$) si y sólo si cualquier valuación v que satisface a $Gamma$ también satisface a $tau$.

=== Corrección y completitud
#teo("Teorema (Corrección y completitud)")[
  Son equivalentes:
  1. $Gamma tack tau$ es derivable en *NK*. 
  2. $Gamma tack.double tau$
]

