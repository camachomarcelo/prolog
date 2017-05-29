
mayor(A,B,A):- A > B,!.
mayor(A,B,B).

menor(A,B,A):- A < B,!.
menor(A,B,B).


mayor([X],X).

mayor([X|L],My):-
		mayor(L,My1),
		mayor(X,My1,My).


iguales([X]).

iguales([X,Y|L]):-	
		X=:=Y,	
		iguales([Y|L]).

ordenado(L):-	
		ordenadoD(L);
		ordenadoA(L).
	

ordenadoD([X]).

ordenadoD([X,Y|L]):-
		X > Y,
		ordenado([Y|L]).

ordenadoD([X]).

ordenadoD([X,Y|L]):-
		X < Y,
		ordenado([Y|L]).



menor([X],X).

menor([X|L],M):-	
		menor(L,Ne),
		menor(X,Ne,M).




seEncuentra([X],Y):-
		X=:=Y,!.

seEncuentra([X|L],E):-
		X=:=E;
		seEncuentra(L,E).


penultimo([X,Y],X):-!.

penultimo([X|L],P):-
		penultimo(L,P).














