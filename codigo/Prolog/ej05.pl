% I)
lasto(L, U) :- append(_, [U], L). 

% II)
reverse([X], [X]).
reverse([L|LS], R) :- reverse(LS, RS), append(RS, [L], R).

% III)
prefijo(P, L) :- append(P, _, L).

% IV)
sufijo(S, L) :- append(_, S, L).

% V)
sublista([], _).
sublista([S|SS], R) :- sufijo(Suf, R), prefijo([S|SS], Suf).

% VI)
pertenece(R, [X|_]) :- X == R.
pertenece(R, [X|XS]) :- X \= R, pertenece(R, XS).

