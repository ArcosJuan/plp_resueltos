#import "../template.typ": *

#import "ejercicios.typ": *

#show: codly-init.with()
#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set text(size: 15pt)
#show heading.where(level: 2): set text(size: 10pt, weight: "bold", fill: white)

#codly(
  zebra-fill: none,
  display-name: false,
  display-icon: false,
  number-format: none,
  stroke: none,
  fill: gradient.linear(rgb("FE9EC7").lighten(80%), white),
)

#set page(..page_config)
#set text(size: 9pt)


#info_resuelto


#grid(columns: 2, gutter: 6pt)[
  #v(3.5pt)
  #set text(fill: rgb("B7A3E3"))
  #link(<currificacion_y_tipos>)[*Currificación y tipos:*]
][
  #ejercicios_detalle(2, 1, [#link(<ej1>)[1☆]], [#link(<ej2>)[2☆]])
][
  #v(3.5pt)
  #set text(fill: rgb("DC9B9B"))
  #link(<esquemas_recursion>)[*Esquemas de recursión:*]
][
  #ejercicios_detalle(
    6,
    1,
    [#link(<ej3>)[3☆]],
    [#link(<ej4>)[4]],
    [#link(<ej5>)[5☆]],
    [#link(<ej6>)[6☆]],
    [#link(<ej7>)[7☆]],
    [#link(<ej8>)[8]],
  )
][
  #v(3.5pt)
  #set text(fill: rgb("B7A3E3"))
  #link(<otras_estructuras>)[*Otras estructuras de datos:*]
][
  #ejercicios_detalle(
    8,
    1,
    [#link(<ej9>)[09☆]],
    [#link(<ej10>)[10]],
    [#link(<ej11>)[11]],
    [#link(<ej12>)[12☆]],
    [#link(<ej13>)[13]],
    [#link(<ej14>)[14]],
    [#link(<ej15>)[15☆]],
    [#link(<ej16>)[16]],
  )
][
  #v(3.5pt)
  #set text(fill: rgb("DC9B9B"))
  #link(<generacion_infinita>)[*Generación infinita:*]
][
  #ejercicios_detalle(
    6,
    1,
    [#link(<ej17>)[17]],
    [#link(<ej18>)[18☆]],
    [#link(<ej19>)[19]],
    [#link(<ej20>)[20☆]],
    [#link(<ej21>)[21☆]],
    [#link(<ej22>)[22]],
  )
][
  #v(3.5pt)
  #set text(fill: rgb("44ACFF"))
  _Parciales, recus y finales:_
][
  #ejercicios_detalle(
    6,
    1,
    [#link(<prf2025>)[2025]],
    [#link(<prf2026>)[2026]],
  )
]


= Currificación y tipos <currificacion_y_tipos>
#align(center)[#ejercicios_detalle(2, 1, [#link(<ej1>)[1☆]], [#link(<ej2>)[2☆]])]

#ej01 <ej1>
#ej02 <ej2>

#pagebreak()
= Esquemas de recursión <esquemas_recursion>
#align(center)[#ejercicios_detalle(
  6,
  1,
  [#link(<ej3>)[3☆]],
  [#link(<ej4>)[4]],
  [#link(<ej5>)[5☆]],
  [#link(<ej6>)[6☆]],
  [#link(<ej7>)[7☆]],
  [#link(<ej8>)[8]],
)]

#ej03 <ej3>
#ej04 <ej4>
#ej05 <ej5>
#ej06 <ej6>
#ej07 <ej7>
#ej08 <ej8>

#pagebreak()
= Otras estructuras de datos <otras_estructuras>
#align(center)[#ejercicios_detalle(
  4,
  2,
  [#link(<ej9>)[09☆]],
  [#link(<ej10>)[10]],
  [#link(<ej11>)[11]],
  [#link(<ej12>)[12☆]],
  [#link(<ej13>)[13]],
  [#link(<ej14>)[14]],
  [#link(<ej15>)[15☆]],
  [#link(<ej16>)[16]],
)]

#ej09 <ej9>
#ej10 <ej10>
#ej11 <ej11>
#ej12 <ej12>
#ej13 <ej13>
#ej14 <ej14>
#ej15 <ej15>
#ej16 <ej16>

#pagebreak()
= Generación infinita <generacion_infinita>
#align(center)[#ejercicios_detalle(
  6,
  1,
  [#link(<ej17>)[17]],
  [#link(<ej18>)[18☆]],
  [#link(<ej19>)[19]],
  [#link(<ej20>)[20☆]],
  [#link(<ej21>)[21☆]],
  [#link(<ej22>)[22]],
)]

#ej17 <ej17>
#ej18 <ej18>
#ej19 <ej19>
#ej20 <ej20>
#ej21 <ej21>

#pagebreak()

#ej22 <ej22>

#v(5em)
#align(center)[
  #stack(dir: ttb, spacing: 10pt)[
    #set image(height: 10em)
    #image("../resources/pretty_cool.png")
  ][
    #set text(size: 2em, fill: gradient.linear(colores.at(0), colores.at(1)))
    *¡FIN DE LA PRÁCTICA 1!*
  ]
]

#pagebreak()
= Parciales, recus y finales #underline[2025] <prf2025>
#align(center)[#ejercicios_detalle(
  4,
  1,
  [#link(<1c2025pp>)[1°C-Parcial]],
  [#link(<fd2025>)[final-Diciembre]],
)]

#p1c2025 <1c2025pp>
#fDiciembre2025 <fd2025>

#pagebreak()
= Parciales, recus y finales #underline[2026] <prf2026>
#align(center)[#ejercicios_detalle(
  4,
  1,
  [#link(<ff2026>)[final-Febrero]],
  [#link(<fm2026>)[final-Marzo]],
)]

#fFebrero2026 <ff2026>
#fMarzo2026 <fm2026>

