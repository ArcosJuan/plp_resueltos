desde(X,X).
desde(X, Y) :- var(Y), N is X+1, desde(N,Y).
desde(X,Y) :- nonvar(Y), Y >= X.
