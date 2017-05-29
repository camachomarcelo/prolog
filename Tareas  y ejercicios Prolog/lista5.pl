ordenar([],[]).
ordenar([X|L1],L2):-ordenar(L1,L3),insOrdC2(X,L3,L2).

obtUlt(L,U):-concatenar(L1,[X|[]],L),U is X.

insOrdC2(L,X,LI):-obtUlt(L,U),X>U,concatenar(L,[X],LI).
insOrdC2(L,X,LI):-
		concatenar(L1,[Y|L2],L), Y>X,
		  concatenar(L1,[X,Y],L3),
		  concatenar(L3,L2,LI).

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

quicksort([],[]).
quicksort([X|L1],L2):-dividir(X,L1,L3,L4),
			quicksort(L3,L3ord),
			quicksort(L4,L4ord),
			concatenar(L3ord,[X|L4ord],L2).

dividir(X,[],[],[]).
dividir(X,[Y],L3,L4):-( Y>=X , L4 is [Y]) ; (Y<X , L3 is [Y]).
dividir(X,[Y|L],L3,[Y|L4]):-dividir(Y,L3,L4).