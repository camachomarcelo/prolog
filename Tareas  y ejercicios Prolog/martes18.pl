insertarUlt([],X,[X]).
insertarUlt([X|L1],Y,[X|L2]):-insertarUlt(L1,Y,L2).

insertarLugar([],X,[X]):-!.
insertarLugar([X|L1],Y,[Y,X|L1]):-Y<X,!.
insertarLugar([X|L1],Y,[X|L2]):-insertarLugar(L1,Y,L2).

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

insertarUlt2(L1,X,L2):-concatenar(L1,[X],L2).

%seEncuentra(L1,X):-concatenar([],[X],L1).%


ordenar([],[]).
ordenar([X|L1],L2):- ordenar(L1,L),
					 insertarLugar(L,X,L2).
