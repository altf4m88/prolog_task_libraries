% Mendefinisikan operasi NAND
nand(true, true, false).
nand(true, false, true).
nand(false, true, true).
nand(false, false, true).

% Mendefinisikan operasi NOR
nor(true, true, false).
nor(true, false, false).
nor(false, true, false).
nor(false, false, true).

% Mendefinisikan operasi IMPLICATION
implication(true, true, true).
implication(true, false, false).
implication(false, true, true).
implication(false, false, true).


and(true, true, true).
and(true, false, false).
and(false, true, false).
and(false, false, false).

table(X, Y, and(X,Y)) :-
    member(X, [true, false]),
    member(Y, [true, false]),
    write(X), write(' '), write(Y), write(' '),
    and(X, Y, Result),
    write(Result), nl.



