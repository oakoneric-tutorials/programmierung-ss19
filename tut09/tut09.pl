% Übung Programmierung Sommersemester 2019
% Eric Kunze
% Github: https://github.com/oakoneric/programmierung-ss19
% -----------------------------------------------------------------------

% AUFGABE 1

nat(0).
nat(s(X)) :- nat(X).

sum(0,Y,Y)       :- nat(Y).
sum(s(X),Y,s(Z)) :- sum(X,Y,Z).

lt(0, s(M))   :- nat(M).  
lt(s(N),s(M)) :- lt(N,M).

div(0,M,0)    :- lt(0,M).  
div(N,M,0)    :- lt(N,M).  
div(N,M,s(Q)) :- lt(0,M), sum(M,V,N), div(V,M,Q).

% AUFGABE 2

eval( X         , X ) :-  nat(X). 
eval( plus (L,R), X ) :-  eval(L, LE), eval(R, RE), sum(LE, RE,  X). 
eval( minus(L,R), X ) :-  eval(L, LE), eval(R, RE), sum(RE,  X, LE).

% AUFGABE 3

subt( X, X).
subt(S1, s( _, T2)) :- subt(S1, T2).
subt(S1, s(T1,  _)) :- subt(S1, T1).