progenitor(diego, dalma).
progenitor(diego, gianinna).
progenitor(tota, diego).
progenitor(chitoro, ana).
progenitor(ana, daniel).

pareja(gianinna, osvaldo).
pareja(chitoro, tota).
pareja(diego, claudia).
pareja(ana, pedro).

pareja(X, Y) :- pareja(Y, X).
ancestro(A, X) :- progenitor(A, X).
ancestro(A, X) :- progenitor(A, Y), ancestro(Y, X).

descendientes2(P, [], VS) :- not( (ancestro(P, H), not(member(H, VS))) ).
descendientes2(P, [H | HS], VS) :- ancestro(P, H), not(member(H, VS)), descendientes2(P, HS, [H | VS]).

descendientes(P, HS) :- descendientes2(P, HS, []).

camino(A, S, []) :- progenitor(A, S).
camino(A, S, [P | PS]) :- progenitor(P, S), A \= P, camino(A, P, PS).

ancestroComunMasCercano(P1, P2, A) :- camino(A, P1, C1),
                                      camino(A, P2, C2),
                                      length(C1, L1),
                                      length(C2, L2),
                                      not( ( 
                                        camino(B, P1, CB1), 
                                        camino(B, P2, CB2), 
                                        length(CB1, LB1),
                                        length(CB2, LB2),
                                        LB1 < L1,
                                        LB2 < L2
                                      ) ).
