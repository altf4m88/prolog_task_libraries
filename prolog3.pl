findLast(X, [X]).
findLast(X, [_|T]) :- findLast(X, T).

find(X, X) :- find(X,X).
findFirst(X, [H|_]) :- find(X,H).

findSecondLast(X, [X,_]).
findSecondLast(X, [_|T]) :- findSecondLast(X, T).

findAt(1,X, [X|_]).
findAt(E,X, [_|T]) :- K is E-1, findAt(K,X,T).

% findLength (X, [H|T]) :- countLength(X, [H|T], 0).
% countLength(X, [], X).
% countLength(X, [_|T], C) :- D is D + 1, countLength(X, T, D).


%membalik urutan
reverse_list([], []).
reverse_list([H|T], Reversed) :-
    reverse_list(T, RevT),
    append(RevT, [H], Reversed).


% check palindrome
is_palindrome(List) :-
    reverse_list(List, List).

% hapus duplikat berurutan
compress([], []).
compress([X], [X]).
compress([X,X|Xs], Zs) :- 
    compress([X|Xs], Zs).
compress([X,Y|Ys], [X|Zs]) :- 
    X \= Y,
    compress([Y|Ys], Zs).

% duplikasi tiap elemen di list
duplicate([], []).
duplicate([H|T], [H,H|DT]) :- 
    duplicate(T, DT).

% hapus element sesuai posisi
delete_at(1, [_|T], T).
delete_at(N, [H|T], [H|R]) :-
    N > 1, 
    N1 is N - 1, 
    delete_at(N1, T, R).