igual(X, X).
igual(A, B, C) :- igual(A, B), igual(B, C).
igual(A, B, C, D) :- igual(A, B, C), igual(C, D).
igual(A, B, C, D, E) :- igual(A, B, C, D), igual(D, E).

dif(X, Y) :- not(igual(X, Y)).
dif(A, B, C) :-
	dif(A, B), 
	dif(A, C), 
	dif(B, C).

	dif(A, B, C, D) :-
	dif(A, B, C),
	dif(D, A), dif(D, B), dif(D, C).

	dif(A, B, C, D, E) :-
	dif(A, B, C, D),
	dif(E, A), dif(E, B), dif(E, C), dif(E, D).

menor(X, Y) :- X < Y.
menor(X, Y, X) :- X < Y.
menor(X, Y, Y) :- Y =< X.
menor(A, B, C, Me) :- 
	menor(A, B, Me1),
	menor(C, Me1, Me).

	menor(A, B, C, D, Me) :-
	menor(A, B, C, Me1),
	menor(D, Me1, Me).

	menor(A, B, C, D, E, Me) :- menor(A, B, C, D, Me1),
								menor(E, Me1, Me).

mayor(X, Y) :- X > Y.
mayor(X, Y, X) :- X > Y.
mayor(X, Y, Y) :- Y >= X.
mayor(A, B, C, My) :-
	mayor(A, B, My1),
	mayor(C, My1, My).
mayor(A, B, C, D, My) :-
	mayor(A, B, C, My1),
	mayor(D, My1, My).
mayor(A, B, C, D, E, My) :-
	mayor(A, B, C, D, My1),
	mayor(E, My1, My).


segMayor(A, B, C, A) :- not(mayor(A, B, C, A)), not(menor(A, B, C, A)).
segMayor(A, B, C, B) :- not(mayor(A, B, C, B)), not(menor(A, B, C, B)).
segMayor(_, _, C, C).


segMayor(A, B, C, D, Me) :- mayor(A, B, C, D, A), mayor(B, C, D, Me).
segMayor(A, B, C, D, Me) :- mayor(A, B, C, D, B), mayor(A, C, D, Me).
segMayor(A, B, C, D, Me) :- mayor(A, B, C, D, C), mayor(A, B, D, Me).
segMayor(_, _, _, D, D).
segMayor(A, B, C, D, E, Me) :- mayor(A, B, C, D, E, A), mayor(B, C, D, E, Me).
segMayor(A, B, C, D, E, Me) :- mayor(A, B, C, D, E, B), mayor(A, C, D, E, Me).
segMayor(A, B, C, D, E, Me) :- mayor(A, B, C, D, E, C), mayor(A, B, D, E, Me).
segMayor(A, B, C, D, E, Me) :- mayor(A, B, C, D, E, D), mayor(A, B, C, E, Me).
segMayor(_, _, _, _, E, E).



segMenor(A, B, C, Me) :- segMayor(A, B, C, Me).


segMenor(A, B, C, D, Me) :- menor(A, B, C, D, A), menor(B, C, D, Me).
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, B), menor(A, C, D, Me).
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, C), menor(A, B, D, Me).
segMenor(_, _, _, D, D).

segMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, A), menor(B, C, D, E, Me).
segMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, B), menor(A, C, D, E, Me).
segMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, C), menor(A, B, D, E, Me).
segMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, D), menor(A, B, C, E, Me).
segMenor(_, _, _, _, E, E).


poker(A,B):-parImpar(A,B).

poker(A,B,C):-igual(A,B),diferente(A,C),!.
poker(A,B,C):-igual(A,C),diferente(A,B),!.
poker(A,B,C):-igual(B,C),diferente(B,A).


poker(A,B,C,D):-igual(A,B,C),diferente(A,D),!.
poker(A,B,C,D):-igual(A,B,D),diferente(A,C),!.
poker(A,B,C,D):-igual(A,C,D),diferente(A,B),!.
poker(A,B,C,D):-igual(B,C,D),diferente(B,A),!.

poker(A,B,C,D,E):-igual(A,B,C,D),diferente(A,E),!.
poker(A,B,C,D,E):-igual(A,B,C,E),diferente(A,D),!.
poker(A,B,C,D,E):-igual(A,C,D,E),diferente(A,B),!.
poker(A,B,C,D,E):-igual(A,B,D,E),diferente(A,C),!.
poker(A,B,C,D,E):-igual(B,C,D,E),diferente(B,A),!.


sum(A,B,R):-R is (A+B).
sum(A,B,C,R):-R is (A+B+C).
sum(A,B,C,D,R):-R is (A+B+C+D).
mochila(A,M,P):-A=<M,P is A,!.
mochila(A,M,P):-P is 0,!.

mochila(A,B,M,P):-sum(A,B,R),R=<M,P is R,!.
mochila(A,B,M,P):-mayor(A,B,R),R=<M,mochila(R,M,P),!.
mochila(A,B,M,P):-menor(A,B,R),R=<M,mochila(R,M,P),!.
mochila(A,B,M,P):-P is 0,!.

mochila(A,B,C,M,P):-sum(A,B,C,R),R=<M,P is R,!.
mochila(A,B,C,M,P):-mochila(A,B,M,PA),mochila(B,C,M,PAA),mochila(A,C,M,PAA),
	                mayor(PA,PAA,PAA,P),not(P=:=0),!.
mochila(A,B,C,M,P):-mayor(A,B,C,MY),mochila(MY,M,P),not(P=:=0),!.
mochila(A,B,C,M,P):-segMayor(A,B,C,SM),mochila(SM,M,P),not(P=:=0),!.   
mochila(A,B,C,M,P):-menor(A,B,C,MN),mochila(MN,M,P),not(P=:=0),!.

mochila(A,B,C,D,M,P):-sum(A,B,C,D,R),R=<M,P is R,!.
mochila(A,B,C,D,M,P):-mochila(A,B,C,M,PA),mochila(A,B,D,M,PAA),mochila(D,B,C,M,PAAA),
					mochila(C,D,A,M,PAAAA),mayor(PA,PAA,PAAA,PAAAA,P),not (P=:=0),!.
mochila(A,B,C,D,M,P):-mochila(A,B,M,PA),mochila(C,D,M,PAA),mochila(A,D,M,PAA),mochila(B,C,M,PAAA),
mochila(A,C,M,PAAAA),mochila(B,D,M,PAAAAA),
	                mayor(PA,PAA,PAA,PAAA,PAAAA,PAAAAA,P),not(P=:=0),!.
mochila(A,B,C,D,M,P):-mayor(A,B,C,D,R),R=<M,P is R,!.
mochila(A,B,C,D,M,P):-segMayor(A,B,C,D,R),R=<M,P is R,!.
mochila(A,B,C,D,M,P):-segMenor(A,B,C,D,R),R=<M,P is R,!.
mochila(A,B,C,D,M,P):-menor(A,B,C,D,R),R=<M,P is R,!.
mochila(A,B,C,D,M,P):-P is 0 .




					
				


