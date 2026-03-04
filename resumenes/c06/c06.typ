#import "@preview/curryst:0.6.0": rule, prooftree, rule-set
#import "@preview/showybox:2.0.4": *
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
  Clase 06 \
  Correspondencia de Curry-Howard \
  Puntos fijos y recursión
]


= Correspondencia de Curry-Howard
#teo("Correspondencia de Curry" + $thin ->$)[
  Si se lee el tipo $tau -> sigma$ como una implicación $tau => sigma$ la regla
  de tipado de la implicación de una función es la regla *modus ponens*.
]

== Pruebas vs términos
Un juicio $tack sigma$ es derivable *si y sólo si* el tipo $sigma$ está habitado,
esto es, existe un término M tal que \ $tack M: tau$ es derivable.

- Una fórmula puede tener muchas pruebas distintas.
- Distintas pruebas corresponden a distintos juicios de tipado, es decir distintos términos.
- Algunas pruebas de la misma proposición son mas complejas que otras.

== Simplificación de pruebas
#teo("Corte (cut)")[
  - Está dado por una regla de introducción seguida inmediatamente de una regla de eliminación
  - Involucra a una fórmula de corte que no es subfórmula de la tesis.
]

== Cálculo-$lambda$

#let reglas-t(content) = {
  
  showybox(
    frame: (
      border-color: red.darken(50%),
      title-color: red.lighten(60%),
      body-color: red.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
      align: center
    ),
    title: "Reglas de tipado",
    content
  )
}

#let corte-t(content) = {
  
  showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: blue.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
      align: center
    ),
    title: "Eliminación de cortes",
    content
  )
}

#reglas-t()[
  #prooftree(
    rule(
      $Gamma, cr("x":)tau tack cr("x":)tau$,
      name: $"T-VARax"$
    )
  )
  #prooftree(
    rule(
      $Gamma, cr("x":)tau tack cr("M":)sigma$,
      $Gamma tack cr(lambda "x" : sigma. "M":) tau -> sigma$,
      name: $"T-ABS" ->_"i"$
    )
  )
  #prooftree(
    rule(
      $Gamma tack cr("M":) tau -> sigma$,
      $Gamma tack cr("N":)tau$,
      $Gamma tack cr("M N":) sigma$,
      name: $"T-APP" ->_"e"$
    )
  )
]

#corte-t()[
  #columns(3)[
    #prooftree(
      rule(
        rule(
          rule(
            $dots.v lr(} #v(2em)) Phi $,
            $Gamma, cr(sigma) tack rho$
          ),
          $Gamma tack cr(sigma) => rho$
        ),
        rule(
          $dots.v lr(} #v(2em)) Psi $,
          $Gamma tack cr(sigma)$
        ),
        $Gamma tack rho$
      ),
    )
    #colbreak()
    #pad(top:3em, left: 5em)[$->$]
    #colbreak()
    #prooftree(
      rule(
        rule(
          rule(
            $dots.v lr(} #v(2em)) Psi $,
            $Gamma tack cr(sigma)$
          ),
          $dots.v lr(} #v(2em)) Phi $,
        ),
        $Gamma tack rho$
      )
    )

  ]
]


    $dots.v lr(} #v(2em)) Phi $

== Cálculo-$lambda$

= Operador de punto fijo
