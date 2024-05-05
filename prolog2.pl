% :- initialization run.

% pria(budi).
% pria(joko).
% wanita(ani).

% declaring facts
pria(projo).
pria(samid).
pria(mukti).
pria(galih).
pria(deri).
pria(agung).
pria(gamma).
pria(yuti).
wanita(jajuk).
wanita(mia).
wanita(mita).
wanita(luna).

orangtua(samid, projo).
orangtua(galih, samid).
orangtua(mia, galih).
orangtua(luna, samid).
orangtua(luna, jajuk).
orangtua(deri, samid).
orangtua(deri, jajuk).
orangtua(agung, samid).
orangtua(agung, jajuk).
orangtua(gamma, deri).
orangtua(mita, jajuk).
orangtua(yuti, mita).


%predicates
ayah(X, Y) :-
    pria(X),
    orangtua(X, Y).
ibu(X, Y) :-
    wanita(X),
    orangtua(X, Y).

kakakLakiLaki(X, Y) :-
    pria(X),
    saudara(X, Y).

kakakPerempuan(X, Y) :-
    wanita(X),
    saudara(X, Y).

kakek(X, Y) :-
    pria(X),
    orangtua(X, Z),
    orangtua(Z, Y).

nenek(X, Y) :-
    wanita(X),
    orangtua(X, Z),
    orangtua(Z, Y).

paman(X, Y) :-
    pria(X),
    orangtua(Z, Y),
    saudara(Z, X).

bibi(X, Y) :-
    wanita(X),
    orangtua(Z, Y),
    saudara(Z, X).

sepupuLakiLaki(X, Y) :-
    pria(X),
    orangtua(Z, X),
    orangtua(W, Y),
    saudara(Z, W),
    X \= Y.

sepupuPerempuan(X, Y) :-
    wanita(X),
    orangtua(Z, X),
    orangtua(W, Y),
    saudara(Z, W),
    X \= Y.

keponakanLakiLaki(X, Y) :-
    pria(X),
    saudara(Z, Y),
    orangtua(Z, X).

keponakanPerempuan(X, Y) :-
    wanita(X),
    saudara(Z, Y),
    orangtua(Z, X).

cucu(X, Y) :-
    orangtua(Y, Z),
    orangtua(Z, X).

iparLakiLaki(X, Y) :-
    pria(X),
    (
        saudara(X, Z), wanita(Z), orangtua(Z, Y);
        saudara(Y, Z), wanita(Z), orangtua(X, Z);
        orangtua(W, Y), orangtua(W, Z), wanita(Z), saudara(X, Z)
    ).

% run :- write(ayah(budi, joko)).