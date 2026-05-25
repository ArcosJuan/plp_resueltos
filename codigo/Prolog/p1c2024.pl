notas([(a, a, 1), (b, a, 10), (b, a, 5), (c, a, 4)]). 

tieneMateriaAprobada(E, M) :- notas(XS), member((E, M, Nota), XS), Nota >= 4.

eliminarAplazos([], []).
eliminarAplazos([(_, _, N) | NS], LS) :- N < 4, eliminarAplazos(NS, LS).
eliminarAplazos([(E, M, N) | NS], [(E, M, N) | LS]) :- N >= 4, eliminarAplazos(NS, LS).

notasA(_, [], []).
notasA(E, [(X, _, _) | NS], LS) :- E \= X, notasA(E, NS, LS).
notasA(E, [(E, _, N) | NS], [N | LS]) :- notasA(E, NS, LS).

promedio(A, P) :- notas(NS), eliminarAplazos(NS, NSsA), notasA(A, NSsA, NSA), sumlist(NSA, SUM), length(NSA, L), SUM > 0, P is SUM/L.

mejorEstudiante(A) :- promedio(A, PA), not((X \= A, promedio(X, PX), PA < PX)).
