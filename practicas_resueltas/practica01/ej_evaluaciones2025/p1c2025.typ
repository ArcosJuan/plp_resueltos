#import "../../template.typ": *

#let p1c2025 = solu[1°C 2025 - Primer Parcial #link("https://www.cubawiki.com.ar/images/0/06/PLP-1C-2025-1P-EI.pdf")[🔎]][
  *Aclaración: en este ejercicio no está permitido utilizar recursión explícita, a menos que se indique lo contrario.* \
  Se define el tipo de datos `ABNV a`, que representa árboles binarios no vacíos con elementos de tipo `a`: \
  `data ABNV a = Hoja a | Uni a (ABNV a) | Bi (ABNV a) a (ABNV a)` \
  Definimos el siguiente árbol para los ejemplos: \
  `abnv = Bi (Uni 2 (Hoja 1)) 3 (Bi (Hoja 4) 5 (Uni 2 (Hoja 7)))`

  #set enum(numbering: "a)", spacing: 15pt)
  + Definir las funciones `foldABNV` y `recABNV`, que implementan respectivamente los esquemas de recursión estructural y primitiva para el tipo `ABNV a`. #underline[Solo en este inciso se permite usar recursión explícita].
  + Definir la funcion `elemABNV :: Eq a => a -> ABNV a -> Bool`, que indica si un elemento pertenece a un árbol. \ Por ejemplo: `elemABNV 7 abnv` $~>$ `True`
  + Definir la función `reemplazarUno :: Eq a => a -> a -> ABNV a -> ABNV a` que, dados dos elementos `x` e `y` y un árbol, devuelve un árbol como el original, pero reemplazando `x` por `y` (la primera desde la raíz yendo de izquierda a derecha, en orden de `preorder`) \
    Por ejemplo: \
    `reemplazarUno 2 5 abnv` $~>$ `Bi (Uni 5 (Hoja 1)) 3 (Bi (Hoja 4) 5 (Uni 2 (Hoja 7))` \
    `reemplazarUno 2 5 (Hoja 1)` $~>$ `Hoja 1`
  + Definir la función `nivel::ABNV a -> Int -> [a]`, que liste todos los elementos del nivel indicado, de izquierda a derecha, siendo 0 el nivel de la raíz. Si el nivel no existe (ya sea por ser negativo o por superar la altura del árbol), devolver `[]`. \

    Por ejemplo: \
    `nivel abnv 1` $~>$ `[2,5]`. \
    `nivel abnv 2` $~>$ `[1,4,2]`. \
    `nivel abnv 4` $~>$ `[]`. \
    *Pista*: aprovechar la currificación y utilizar evaluación parcial.
][][
  #show raw: set text(size: 6pt)
  ```hs
  data ABNV a = Hoja a | Uni a (ABNV a) | Bi (ABNV a) a (ABNV a) deriving Show
  -- a)
  foldABNV :: (a -> b) -> (a -> b -> b) -> (a -> b -> b -> b) -> ABNV a -> b
  foldABNV fh _ _ (Hoja x) = fh x
  foldABNV fh fu fb (Uni x ab) = fu x (foldABNV fh fu fb ab)
  foldABNV fh fu fb (Bi ab1 x ab2) = fb x (foldABNV fh fu fb ab1) (foldABNV fh fu fb ab2)

  recABNV :: (a -> b) -> (a -> ABNV a -> b -> b) -> (a -> ABNV a -> ABNV a -> b -> b -> b) -> ABNV a -> b
  recABNV fh _ _ (Hoja x) = fh x
  recABNV fh fu fb (Uni x ab) = fu x ab (recABNV fh fu fb ab)
  recABNV fh fu fb (Bi ab1 x ab2) = fb x ab1 ab2 (recABNV fh fu fb ab1) (recABNV fh fu fb ab2)

  -- b)
  elemABNV :: Eq a => a -> ABNV a -> Bool
  elemABNV e = foldABNV (==e) (\x rec -> e==x || rec) (\x rec1 rec2 -> e==x || rec1 || rec2)

  -- c)
  reemplazarUno :: Eq a => a -> a -> ABNV a -> ABNV a
  reemplazarUno i j = recABNV (\x -> if x==i then Hoja j else Hoja x)
                              (\x ab rec -> if x==i then Uni j ab else Uni x rec)
                              (\x ab1 ab2 rec1 rec2 ->
                                if x==i
                                  then Bi ab1 j ab2
                                  else (if elemABNV i ab1 then Bi rec1 x ab2 else Bi ab1 x rec2))

  -- d)
  nivel :: ABNV a -> Int -> [a]
  nivel = foldABNV (\x -> (\n -> if n==0 then [x] else []))
                   (\x rec -> (\n -> if n==0 then [x] else rec (n-1)))
                   (\x rec1 rec2 -> (\n -> if n==0 then [x] else (rec1 (n-1))++(rec2 (n-1))))
  ```
]
