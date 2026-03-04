% I.
inorder(nil, []).
inorder(bin(I,V,D), L) :- inorder(I, LI), inorder(D,LD), append(LI, [V|LD], L).

% II.
arbolConInorder([], nil).
arbolConInorder(L, bin(I,V,D)) :- append(LI, [V|LD], L), arbolConInorder(LI, I), arbolConInorder(LD, D).

% III. 
aBB(nil).
aBB(bin(nil, _, nil)).
aBB(bin(bin(I, VI, D), V, nil)) :- V >= VI, aBB(bin(I, VI, D)).
aBB(bin(nil, V, bin(I, VD, D))) :- VD > V, aBB(bin(I, VD, D)).
aBB(bin(bin(II, VI, DI), V, bin(ID, VD, DD))) :- V >= VI, VD > V, aBB(bin(II, VI, DI)), aBB(bin(ID, VD, DD)).

% IV.
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(I, V, D), bin(T2, V, D)) :- V >= X, aBBInsertar(X, I, T2).
aBBInsertar(X, bin(I, V, D), bin(I, V, T2)) :- X > V, aBBInsertar(X, D, T2).
