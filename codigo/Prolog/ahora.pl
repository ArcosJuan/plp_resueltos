
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

desdeReversible(X, X).
desdeReversible(X, Y) :- nonvar(Y), X =< Y.
desdeReversible(X, Y) :- var(Y), N is X+1, desdeReversible(N, Y).

vacio(nil).

raiz(bin(_, X, _), X).

altura(nil, 0).
altura(bin(I, _, D), N) :- altura(I, NI), altura(D, ND), N is max(NI, ND) + 1.

cantidadNodos(nil, 0).
cantidadNodos(bin(I, _, D), N) :- cantidadNodos(I, NI), cantidadNodos(D, ND), N is NI+ND+1.

inorder(nil, []).
inorder(bin(I, X, D), LS) :- inorder(I, LIS), inorder(D, LDS), append(LIS, [X | LDS], LS).

arbolConInorder([], nil).
arbolConInorder(LS, bin(I, X, D)) :- append(LIS, [X | LDS], LS), arbolConInorder(LIS, I), arbolConInorder(LDS, D).

aBB(nil).
aBB(bin(nil, _, nil)).
aBB(bin(I, X, nil)) :- raiz(I, RI), X >= RI, aBB(I).
aBB(bin(nil, X, D)) :- raiz(D, RD), X < RD, aBB(D).
aBB(bin(I, X, D)) :- raiz(I, RI), raiz(D, RD), X >= RI, X < RD, aBB(I), aBB(D).

aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(I, R, D), bin(RI, R, D)) :- X =< R, aBBInsertar(X, I, RI).
aBBInsertar(X, bin(I, R, D), bin(I, R, RD)) :- X > R, aBBInsertar(X, D, RD).

coprimos(X, Y) :- desde(1, X), between(1, X, Y), gcd(X, Y) =:= 1.

listaSuma(S, [S]).
listaSuma(S, [X | XS]) :- between(0, S, X), SmX is S-X, listaSuma(SmX, XS).

filasSuman(S, L, [F]) :- length(F, L), listaSuma(S, F).
filasSuman(S, L, [F | FS]) :- length(F, L), listaSuma(S, F), filasSuman(S, L, FS).

cuadradoSemiMagico(N, X) :- desde(0, S), length(X, N), filasSuman(S, N, X).

iesimo([X | _], 0, X).
iesimo([_ | XS], N, Z) :- Nm1 is N-1, iesimo(XS, Nm1, Z).

columnaN([], _, []).
columnaN([XS | XSS], N, [Y | YS]) :- iesimo(XS, N, Y), columnaN(XSS, N, YS).

columnas([X | XS], [C]) :- length(X, LCS), ID is LCS-1, columnaN([X | XS], ID, C).
columnas([X | XS], [C | CS]) :- length(CS, LCS), length(X, LX), ID is LX-LCS-1, columnaN([X | XS], ID, C), columnas([X | XS], CS).

cuadradoMagico(N, XS) :- desde(0, S), length(XS, N), length(YS, N), filasSuman(S, N, XS), columnas(XS, YS), filasSuman(S, N, YS).



