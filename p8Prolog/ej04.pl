juntar([], RS, RS).
juntar([L1|LS1], L2, [L1|RS]) :- juntar(LS1, L2, RS).
