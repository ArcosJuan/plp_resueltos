#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/fancy-tiling:1.0.0"

#let mio_this = image("./resources/mio01.png", height: 8em)
#let pretty_cool = image("./resources/pretty_cool.png", height: 5em)
#let yuko_stone = image("./resources/yuko02.png", height: 5em)
#let yuko_bolu = image("./resources/yuko01.png", height: 5em)

#let estrellita = text(fill: rgb("FFFAA0"), size: 10pt)[✮]

#let colores = (
  rgb("FE9EC7"),
  rgb("44ACFF"),
  rgb("9AD872"),
  rgb("FFEF91"),
  rgb("FFA02E"),
  rgb("C0E1D2"),
  rgb("DC9B9B"),
  rgb("B7A3E3"),
)

#let page_config = (
  paper: "a4",
  margin: (top: 2em, bottom: 10pt),
)


#let info_resuelto = [
  #stack(dir: ltr, spacing: 1em)[
    #rect(
      inset: (bottom: 0pt),
      fill: gradient.linear(
        colores.at(1).lighten(50%),
        colores.at(7).lighten(60%),
      ),
      radius: 5pt,
    )[
      #set par(spacing: 10pt)
      #show link: set text(fill: rgb("B7A3E3").darken(20%))
      #text(size: 1.2em, fill: white, weight: "bold")[
        Resuelto de la #link("https://www.cubawiki.com.ar/images/0/06/PLP_APUNTE_2025_GuiaEjercicios01.pdf")[Práctica N°1 - Programación Funcional] del $2^(d o)$ Cuatrimestre 2025
      ]

      #stack(dir: ltr)[
        #set text(fill: white, weight: "bold")
        Prácticas de otros cuatrimestres pueden diferir en estrellas y enunciados. Ojo \
        #underline[El siguiente resuelto no tiene ningún fin. Ni garantiza nada!] \

        #box(width: 40em)[
          Si queŕes hacer alguna corrección, añadir la resolución de un ejercicio o lo que se te ocurra y te cope podés mandar mensaje al grupo de Typst en telegram. Si te gustó como quedo este resuelto podés ir al taller de Typst para aprender a hacerlo!
        ]
      ][
        #mio_this
      ]
    ]
  ][
    #rotate(90deg, reflow: true)[
      #set text(weight: "extrabold", fill: rgb("B7A3E3"), size: 1.25em)
      HECHO EN TYPST
    ]

  ]

]

#let solu(nombre, enunciado, solucion, codigo) = [
  #block(spacing: 20pt, breakable: false)[
    #stack(dir: ttb, spacing: 0pt)[
      #rect(stroke: 0pt, fill: rgb("FE9EC7"), radius: (top-left: 20pt, top-right: 20pt))[
        == #nombre
      ]
    ][
      #rect(width: 100%, stroke: .5pt + rgb("FE9EC7"))[
        #no-codly[
          #enunciado
        ]
      ]
    ][
      #v(8pt)
      #rect(width: 100%, stroke: 0pt, fill: gradient.linear(rgb("B7A3E3").lighten(50%), white), radius: (
        top-left: 20pt,
      ))[
        #set text(size: 10pt, weight: "bold", fill: white)
        Solución:
      ]
    ][
      #stack(dir: ttb)[
        #block(inset: 5pt)[
          #solucion
        ]
      ][
        #if solucion == [] [
          #v(-5pt)
        ] else if codigo != [] [
          #v(3pt)
        ]
        #set text(7.5pt)
        #codigo
      ]
    ]

  ]
]

#let ejercicios_detalle(cols, rows, ..nombres) = [
  #grid(
    align: center,
    columns: cols,
    rows: rows,
    gutter: 3pt,
    ..nombres
      .pos()
      .enumerate()
      .map(
        ((i, item)) => [
          #rect(fill: colores.at(calc.rem(i, colores.len())).lighten(80%), height: 1.5em, radius: 5pt)[
            #set text(weight: "bold", fill: colores.at(calc.rem(i, colores.len())).darken(50%))
            #set align(center + horizon)
            #item
          ]
        ],
      )
  )
]

