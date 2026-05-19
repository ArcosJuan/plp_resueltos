aplanar([[X|Xss]|Xs], Ys) :- aplanar([X|Xss], R1), aplanar(Xs, R2), append(R1, R2, Ys).
aplanar([X|Xs], [X|Ys]) :- not(aplanar(X, _)), aplanar(Xs, Ys). 
aplanar([], []). 
