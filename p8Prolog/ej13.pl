desde(X,X).
desde(X, Y) :- N is X+1, desde(N,Y).

coprimos(X, Y) :- desde(X, Y), gcd(X,Y) =:= 1.
