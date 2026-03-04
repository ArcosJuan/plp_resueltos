vacio(nil).

raiz(bin(_,V,_), V).

altura(nil, 0).
altura(bin(I, _, D), R) :- altura(I, RI), altura(D, RD), R is max(RI, RD)+1.

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I, _, D), N) :- cantidadDeNodos(I, NI), cantidadDeNodos(D, ND), N is NI+ND+1.
