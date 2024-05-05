iterasi(Start, End) :-
    Start > End, !.

even(N) :-
    N mod 2 =:= 0,
    write(N), write(' is even'), nl.

odd(N) :-
    N mod 2 =:= 1,
    write(N), write(' is odd'), nl.

iterasi(Start, End) :-
    Start =< End,
    (   even(Start) ; odd(Start) ),
    Next is Start + 1,
    iterasi(Next, End).

iterasi(End) :-
    iterasi(1, End).