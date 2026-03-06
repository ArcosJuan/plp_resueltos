val(prop(N), L, true) :- nth1(N, L, true).
val(prop(N), L, false) :- nth1(N, L, false).

val(and(X,Y), L, true) :- val(X, L, true), val(Y, L, true).
val(and(X,_), L, false) :- val(X, L, false).
val(and(_,Y), L, false) :- val(Y, L, false).

val(or(X,_), L, true) :- val(X, L, true).
val(or(_,Y), L, true) :- val(Y, L, true).
val(or(X,Y), L, false) :- val(X, L, false), val(Y, L, false).

val(neg(X), L, true) :- val(X, L, false).
val(neg(X), L, false) :- val(X, L, true).

val(imp(X,Y), L, true) :- val(or(neg(X), Y), L, true).

esTautologia(F) :- not(val(neg(F), _, true)).


