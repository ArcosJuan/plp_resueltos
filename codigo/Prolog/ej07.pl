% I.
interseccion([L1|L1s],L2s,[L1|L3s]) :- not(member(L1,L2s)), interseccion(L1s, [L1|L2s], L3s).
interseccion([L1|L1s],L2s,L3s) :- member(L1,L2s), interseccion(L1s, L2s, L3s).
interseccion([], _, []).

partir(0, L, [], L).
partir(N, [L|Ls], [L|L1s], L2) :- M is N-1, partir(M, Ls, L1s, L2).

% II.
borrar([], _, []).
borrar([X|LOs], X, LSX) :- borrar(LOs, X, LSX).
borrar([A|LOs], X, [A|LSX]) :- A \= X, borrar(LOs, X, LSX).

% III.
sacarDuplicados([], []).
sacarDuplicados([L1|L1s], [L1|L2s]) :- borrar(L1s, L1, L1sC), sacarDuplicados(L1sC, L2s).

% IV. ?L2
permutacion([], []).
permutacion([L1|L1s], L2) :- permutacion(L1s, L3), append(L1A, L1B, L3), append(L1A, [L1|L1B], L2).


% IV. +L2 (otra alternativa)
% permutacion(L1, L2) :- interseccion(L1, L2, L3), L3 == [], length(L1, X), length(L2, X).

% V. 
reparto(L, 1, [L]).
reparto(L, N, [LL|LLs]) :- append(LL, LB, L), N>0, M is N-1, reparto(LB, M, LLs).

% VI. 
repartoSinVacias(X,[X]).
repartoSinVacias(L, R) :- append([LA|LAs], [LB|LBs], L),
                          repartoSinVacias([LB|LBs], LR),
                          append([[LA|LAs]], LR, R).

