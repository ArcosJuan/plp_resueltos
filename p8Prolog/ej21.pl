pertenece(X, [X|YS]).
pertenece(X, [Y|YS]) X \= Y, pertenece(X, YS).

conjuntoDeNaturales(X) :- pertenece(E, X), natural(E).
