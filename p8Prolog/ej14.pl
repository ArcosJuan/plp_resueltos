desde(X,X).
desde(X, Y) :- N is X+1, desde(N,Y).

sumaLista(N,[N]).
sumaLista(N,[L|LS]) :- between(0, N, L),
                       X is N-L,
                       sumaLista(X, LS),
                       sumlist([L|LS], N).

csmAux(_, 0, _, []).
csmAux(N, F, S, [L|LS]) :- F > 0,
                           Fm1 is F-1,
                           length(L, N),
                           sumaLista(S, L),
                           csmAux(N, Fm1, S, LS).

csm(N, L) :- desde(0,X), csmAux(N,N,X,L).
