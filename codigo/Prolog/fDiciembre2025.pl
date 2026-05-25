desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

sublistas(X, 1, [X]).
sublistas(XS, N, [YS | YSS]) :- N > 0, append(AS, [B | BS], XS), AS \= [], BS \= [], append(AS, [B], YS), Nm1 is N-1, sublistas([B|BS], Nm1, YSS).

quitar(E, [E | XS], XS). 
quitar(E, [Y | XS], [Y | YS]) :- E \= Y, quitar(E, XS, YS). 

permutacion([X | XS], YS) :- permutacion(XS, QYS), quitar(X, YS, QYS). 
permutacion([], []).

generarRompecabezas(S, R) :- length(S, Len), between(1, Len, X), sublistas(S, X, SS), permutacion(SS, R).

