% Author:marines
% Date: 30/05/2008

cantidad([],0).
cantidad([_|L1],Q):-cantidad(L1,Q1),Q is Q1+1.
seEncuentra([X|_],X):-!.
seEncuentra([_|L1],X):-seEncuentra(L1,X).
ultimo([X],X):-!.
ultimo([_|L1],X):-ultimo(L1,X).
iguales([_]):-!.
iguales([X,X|L1]):-iguales([X|L1]).
%sum=suma de los elementos de la lista
suma([],0).
suma([X|L1],Sum):-suma(L1,Sum1),Sum is Sum1+X.
%sum=suma de elemtos pares de la lista
sumaPares([X],Sum):-X mod 2=:=0,Sum is X.
sumaPares([X|L1],Sum):-sumaPares(L1,Sum1),X/2=:=0,Sum is Sum1+X,!.
sumaPares([_|L1],Sum):-sumaPares(L1,Sum).
%
frecuencia([],_,0).
frecuencia([X],X,1).
frecuencia([X|L1],X,F):-frecuencia(L1,X,F1),F is F1+1.
frecuencia([_|L1],X,F):-frecuencia(L1,X,F).
%
ordenado(L):-ordenadoA(L);ordenadoD(L).
ordenadoA([X]):-!.
ordenadoA([X,Y|L1]):-X<Y,ordenado([Y|L1]).
ordenadoD([X]):-!.
ordenadoD([L1|Y,X]):-X<Y,ordenado([Y|L1]).
%
diferentes(L1):-not(iguales(L1)).
%
existeFrec(L1,K):-frecuencia(L1,_,K).
%poker(L1):-.
%
mayor([X],X).
mayor([X|L1],May):-mayor(L1,M1),M1>X.
%
menor([X],X).
menor([X|L1],May):-menor(L1,M1),M1<X.
%escalera(L1):-.





