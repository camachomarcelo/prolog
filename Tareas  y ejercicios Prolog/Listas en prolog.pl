%#1
seEncuentra([X],Y):-
		X=:=Y,!.

seEncuentra([X|L],E):-
		X=:=E;
		seEncuentra(L,E).
%#2

iguales([_]).
iguales([X|L1]):-iguales(L1),ultimo(L1,X1),X=:=X1.

%#3
ordenado([_]).
ordenado([X|L1]):-ordenado(L1),primer(L1,X1),X=<X1.

%#4
menor(A,B,M):-A<B,M is A.
menor(A,B,M):-B=<A,M is B.

menor([X],X).
menor([X|L1],Me):-menor(L1,Me1),
		  menor(Me1,X,Me).

%#5
mayor(A,B,A):- A > B,!.
mayor(A,B,B).


mayor([X],X).

mayor([X|L],My):-
		mayor(L,My1),
		mayor(X,My1,My).

%#6

frecuencia([], _, 0):- !.
frecuencia([E1],E1,1):-!.
frecuencia([E1|L1],X,F):-frecuencia(L1,X,F2), E1=:=X, F is F2 +1;
				frecuencia(L1,X,F).

insertarlugar([],X,[X]):-!.
insertarlugar([X|L1],Y,[Y,X|L1]):-Y<X,!.
insertarlugar([X|L1],Y,[X|L2]):-insertarlugar(L1,Y,L2).

%#7

diferentes([_]):-!.
diferentes([X,Y]):-X=\=Y.
diferentes([X,Y|L1]):-X=\=Y,diferentes(L1).

%#8
ordenar([],[]).
ordenar([X|L1],L2):-ordenar(L1,L3),insertarlugar(L3,X,L2).

escalera(L):-ordenar(L,L1),escala(L1).
escala([E|L] ):-esc(L,E).
esc([],_):-!.
esc([E|L],E1):-esc(L,E),abs(E-E1)=:=1.

%#9
suma([X],X).
suma([X|L1],Sum):-suma(L1,Sum1),sum is Sum  Sum1+X.

%#10
esPar(X):-X mod 2=:=0.
sumPar([X],S):-esPar(X), S is X,!.
sumPar([X|L1],Sum):-esPar(X),sumPar(L1,Sum1),Sum is Sum1+X.


%#11
primerElem([X,_],X)

%#12
eliminarUlt([X],[]).
eliminarUlt([X|L1],[X|L2]):-eliminarUlt(L1,L2).

%#13

eliminar(L,E,L1):-elim(L,E,L1,1).
elim([],_,[],_):-!.
elim( [E1|L],E,L1,B):- E1=:=E,B=:=1,elim(L,E,L1,2).
elim( [E1|L],E,[E1|L1],B):-elim(L,E,L1,B).

%#20

insertarUlt([],X,[X]).
insertarUlt([Y|L1],X,[Y|L2]):-insertarUlt(L1,X,L2).

