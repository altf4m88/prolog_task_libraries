# iterasi(Start, End) :-
#     Start > End, !.

# even(N) :-
#     N mod 2 =:= 0,
#     write(N), write(' is even'), nl.

# odd(N) :-
#     N mod 2 =:= 1,
#     write(N), write(' is odd'), nl.

# iterasi(Start, End) :-
#     Start =< End,
#     (   even(Start) ; odd(Start) ),
#     Next is Start + 1,
#     iterasi(Next, End).

# iterasi(End) :-
#     iterasi(1, End).


% Base case to stop the iteration when Start exceeds End.
iterasi(Start, End, Odds, Evens) :-
    Start > End, 
    write('Odd numbers: '), write(Odds), nl,
    write('Even numbers: '), write(Evens), nl, !.

% Recursive predicate to iterate from Start to End.
iterasi(Start, End, Odds, Evens) :-
    Start =< End,
    (   (Start mod 2 =:= 0, Evens1 = [Start|Evens], Odds1 = Odds) 
    ;   (Start mod 2 =:= 1, Odds1 = [Start|Odds], Evens1 = Evens)
    ),
    Next is Start + 1,
    iterasi(Next, End, Odds1, Evens1).

% Single argument version to default start from 1, initializing empty lists for odd and even numbers.
iterasi(End) :-
    iterasi(1, End, [], []).