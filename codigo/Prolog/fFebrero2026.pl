comprimido([X], [X]).
comprimido([X, Y | XS], [X | YS]) :- not( member(X, [Y]) ), not( member(c(_,_), [X]) ), comprimido([Y | XS], YS).
comprimido([c(X, N), Y | XS], [c(X, N) | YS]) :- X \= Y, comprimido([Y | XS], YS).
comprimido([c(X, N), X | XS], YS) :- Nm1 is N+1, comprimido([c(X, Nm1) | XS], YS).
comprimido([X, X | XS], YS) :- comprimido([c(X, 2) | XS], YS).

descomprimir([], []).
descomprimir([X | XS], [X | YS]) :- not(member(c(_,_), [X])), descomprimir(XS, YS).
descomprimir([c(_, 0) | XS], YS) :- descomprimir(XS, YS).
descomprimir([c(X, N) | XS], [X | YS]) :- N =\= 0, Nm1 is N-1, descomprimir([c(X, Nm1) | XS], YS).

iguales(L1, L2) :- descomprimir(L1, L1D), descomprimir(L2, L2D), L1D == L2D.
