#set page(
  margin: (right: 3cm, x: 1.8cm, y: 2cm),
) 
#set par(
  justify: true,
  leading: 0.45em,
)

#show title: set text(size: 20pt)
#show title: set align(center)

#let h(color, ss) = highlight(fill: color)[#ss]
#let fill(color, ss) = text(fill: color, weight: "semibold")[#ss]

#show link: set text(fill: blue)

#set enum(indent: 5pt)
#set list(indent: 5pt)



#title[
  Clase 01 \
  Fundamentos de programación funcional
]

== Programa funcional <pfuncional>
La programación funcional consiste en definir funciones y aplicarlas 
para procesar información.

Las "funciones" son verdaderamente funciones (parciales):
- Aplicar una función no tiene efectos secundarios.
- A una misma entrada corresponde siempre la misma salida
- Las estructuras de datos son inmutables.

Las *funciones son datos* como cualquier otro
- Se pueden pasar como parametros
- Se pueden devolver como resultados
- Pueden formar parte de estructuras de datos


== #underline()[Expresiones <expresión>]
Las expresiones son secuencias de símbolos que sirven para 
representar datos, funciones y funciones aplicadas a los datos.

Una expresion puede ser:
1. Un *constructor*
2. Una *variable*
3. La *aplicación* de una expresión a otra

== #underline()[Tipos]
Un tipo es una especificación del invariante de un dato o de una función.
El tipo de una función expresa un contrato.

#underline()[#fill(purple)[Condiciones de tipado]]:
1. Todas las #link(<expresión>)[expresiones] deben tener tipo.
2. Cada variable se debe usar siempre con un mismo tipo.
3. Los dos lados de una ecuación deben tener el mismo tipo.
4. El argumento de una función debe tener el tipo del dominio.
5. El resultado de una función debe tener el tipo del codominio.
(Sólo tienen sentido los programas bien tipados)

== #underline()[Modelo de cómputo] (Computo del valor de expresiones)
Dada una #link(<expresión>)[expresión], se computa su valor usando #fill(purple)[ecuaciones]. \
Las expresiones bien tipadas que #underline()[no tienen valor] se indefinen (tienen valor $bot$)

Un #link(<pfuncional>)[programa funcional] está dado por un conjunto de ecuaciones.
Más precisamente, por un conjunto de ecuaciones orientadas.

Una ecuación #fill(green)[e1] = #fill(red)[e2] se interpreta desde dos puntos de vista:
#block(spacing: 5pt)[
  1. #block()[
    Punto de vista #fill(purple)[detacional]. \
    Declara que #fill(green)[e1] y #fill(red)[e2] tienen el mismo significado.
  ]

  2. #block()[
    Punto de vista #fill(purple)[operacional]. \
    Computar el valor de #fill(green)[e1] se reduce a computar el valor de #fill(red)[e2].
  ]
] \
El #fill(green)[lado izquierdo] de una ecuación no es una #link(<expresión>)[expresión] arbitraria.\
Debe ser una función aplicada a patrones.

Un #fill(purple)[patrón] puede ser:
- Una *variable*.
- Un *comodín* \_.
- Un *constructor* aplicado a patrones.
El #fill(green)[lado izquierdo] no debe contener variables repetidas.
#pagebreak()

Evaluar una #link(<expresión>)[expresión] consiste en:
#block(spacing: 5pt)[
#pad(right: 2cm)[
    1. Buscar la subexpresión más externa que coincida con el #fill(green)[lado izquierdo] de una ecuación.
    2. Reemplazar la subexpresión que coincide con el #fill(green)[lado izquierdo] de la ecuación\ por la  expresión correspondiente al #fill(red)[lado derecho].
    3. Continuar evaluando la #link(<expresión>)[expresión] resultante.
  ]
]
#block(spacing: 10pt)[
La evaluación se detiene cuando se da uno de los siguientes casos:
1. La #link(<expresión>)[expresión] es un constructor o un constructor aplicado.
2. La #link(<expresión>)[expresión] es una función parcialmente aplicada.
3. Se alcanza un estado de error.
]
(Un estado de error es una #link(<expresión>)[expresión] que no coincide con las ecuaciones que definen a la función
aplicada)

== Funciones de orden superior
