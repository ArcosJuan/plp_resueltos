desde(X,X).
desde(X, Y) :- N is X+1, desde(N,Y).

permutacion([], []).
permutacion([L|LS], P) :- permutacion(LS, PLS),
                          append(PA, PB, PLS),
                          append(PA, [L|PB], P).

gRAux(S, 0, [S]).
gRAux(S, N, R) :- N>0,
                  append(A, [X|B], S),
                  append(A, [X], C),
                  Nm1 is N-1,
                  gRAux([X|B], Nm1, R2),
                  append([C], R2, R).

gR(S, R) :- desde(0, N), gRAux(S, N, RsP), permutacion(RsP, R).

