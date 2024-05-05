% Perkalian Bilangan antara 10 – 30
multiply(X, Y, Result) :-
    between(10, 30, X),
    between(10, 30, Y),
    Result is X * Y.

% Perpangkatan antara 3 – 4
power(Base, Exponent, Result) :-
    between(3, 4, Base),
    between(3, 4, Exponent),
    Result is Base ** Exponent.

% Faktorial antara 5 – 8
factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    between(5, 8, N),
    N1 is N - 1,
    factorial(N1, Result1),
    Result is N * Result1.

% FPB (Faktor Persekutuan Terbesar) antara 15 – 18
gcd(X, Y, G) :-
    between(15, 18, X),
    between(15, 18, Y),
    gcd(X, Y, 1, G).

gcd(X, Y, G, G) :-
    0 is X mod G,
    0 is Y mod G.

gcd(X, Y, T, G) :-
    T < X, T < Y, T1 is T + 1,
    gcd(X, Y, T1, G).