menor(A, B, Me):-A<B,Me is A,!.
menor(A,B,B).

menor(A, B, C, Me):-menor(A,B,T1),
					menor(T1,C,Me).
menor(A, B, C, D, Me):-menor(A,B,C,T1),
					   menor(T1,D,Me).
menor(A, B, C, D, E, Me):-menor(A,B,C,D,T1),
						  menor(T1,E,Me).



mayor(A, B, My):- A>B, My is A,!.
mayor(A, B, B).

mayor(A, B, C, My):- mayor(A , B, T1),
					 mayor(T1, C, My).
mayor(A, B, C, D, My):- mayor(A , B, C, T1),
						mayor(T1, D, My).
mayor(A, B, C, D, E, My):-mayor(A , B, C, D, T1),
						  mayor(T1, E, My).
						  
						
par(A):- (A mod 2) =:= 0.
impar(A):- not( par(A) ).

dosImpares(A, B):- impar(A),impar(B).
dosPares(A, B):- par(A),par(B).

dosPares(A, B, C):- dosPares(A,B);dosPares(A,C);
					dosPares(B,C).
dosPares(A, B, C, D):- dosPares(A,B);dosPares(A,C);dosPares(A,D);
					   dosPares(B,C);dosPares(B,D);
					   dosPares(C,D).
dosPares(A, B, C, D, E):- dosPares(A,B);dosPares(A,C);dosPares(A,D);dosPares(A,E);
					   dosPares(B,C);dosPares(B,D);dosPares(B,E);
					   dosPares(C,D);dosPares(C,E);
					   dosPares(D,E).
					   
					   
tresImpares(A , B, C):- impar(A), impar(B), impar(C).
tresPares(A, B, C):-par(A), par(B), par(C).

tresPares(A, B, C, D):- tresPares(A,B,C),!.
tresPares(A, B, C, D):- tresPares(A,B,D),!.
tresPares(A, B, C, D):- tresPares(A,C,D),!.
tresPares(A, B, C, D):- tresPares(B,C,D),!.



tresPares(A, B, C, D, E):- tresPares(A,B,C),!.
tresPares(A, B, C, D, E):- tresPares(A,B,D),!.
tresPares(A, B, C, D, E):- tresPares(A,B,E),!.
tresPares(A, B, C, D, E):- tresPares(A,C,D),!.
tresPares(A, B, C, D, E):- tresPares(A,C,E),!.
tresPares(A, B, C, D, E):- tresPares(B,C,D),!.
tresPares(A, B, C, D, E):- tresPares(B,C,E),!.
tresPares(A, B, C, D, E):- tresPares(C,D,E),!.


cuatroImpares(A, B, C, D):- impar(A), impar(B), impar(C), impar(D).
cuatroPares(A, B, C, D):- par(A),par(B),par(C),par(D).

cuatroPares(A, B, C, D, E):- cuatroPares(A, B, C, D),!.
cuatroPares(A, B, C, D, E):- cuatroPares(A, B, C, E),!.
cuatroPares(A, B, C, D, E):- cuatroPares(A, B, D, E),!.
cuatroPares(A, B, C, D, E):- cuatroPares(A, C, D, E),!.
cuatroPares(A, B, C, D, E):- cuatroPares(B, C, D, E),!.


cincoImpares(A, B, C, D, E):- impar(A),impar(B),impar(C),impar(D),impar(E).
cincoPares(A, B, C, D, E):- par(A),par(B),par(C),par(D),par(E).

parImpar(A,B):- not( dosPares(A, B)),
				not( dosImpares(A, B)).

parImpar(A, B, C):-	not( tresPares(A, B, C)),
					not( tresImpares(A, B, C)).

parImpar(A, B, C, D):- not( cuatroPares(A, B, C, D)), 
					   not( cuatroImpares(A, B, C, D)).

parImpar(A, B, C, D, E):- not( cincoPares(A, B, C, D, E)),
						  not( cincoImpares(A, B, C, D, E)).
						  
segMayor(A, B, C, ME) :- mayor(A, B, C, A), mayor(B, C, ME).
segMayor(A, B, C, ME) :- mayor(A, B, C, B), mayor(A, C, ME).
segMayor(_, _, C, C).

segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, A), mayor(B, C, D, ME).
segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, B), mayor(A, C, D, ME).
segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, C), mayor(A, B, D, ME).
segMayor(_, _, _, D, D).

segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, A), mayor(B, C, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, B), mayor(A, C, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, C), mayor(A, B, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, D), mayor(A, B, C, E, ME).
segMayor(_, _, _, _, E, E).



segMenor(A, B, C, ME) :- segMayor(A, B, C, ME).

segMenor(A, B, C, D, ME) :- menor(A, B, C, D, A), menor(B, C, D, ME).
segMenor(A, B, C, D, ME) :- menor(A, B, C, D, B), menor(A, C, D, ME).
segMenor(A, B, C, D, ME) :- menor(A, B, C, D, C), menor(A, B, D, ME).
segMenor(_, _, _, D, D).

segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, A), menor(B, C, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, B), menor(A, C, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, C), menor(A, B, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, D), menor(A, B, C, E, ME).
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


sum(A ,B ,R):- R is (A + B).
sum(A ,B ,C ,R):- R is (A + B + C).
sum(A ,B ,C ,D ,R):- R is (A + B + C + D).


mochila(A ,M ,P):- A =< M,
				   P is A,!.
mochila(A ,M ,P):- P is 0,!.



mochila(A ,B ,M ,P):-
				sum(A ,B ,R),
				R =< M,
				P is R,!.
mochila(A ,B ,M ,P):- mayor(A ,B ,R),
					  R =< M ,
					  mochila(R ,M ,P),!.
					  
mochila(A ,B ,M ,P):- menor(A ,B ,R),
					  R =< M,
					  mochila(R ,M ,P),!.					   
mochila(A ,B ,M ,P):- P is 0,!.




mochila(A ,B ,C ,M ,P):- sum(A ,B ,C ,R),
						 R =< M,
						 P is R,!.
mochila(A ,B ,C ,M ,P):- mochila(A ,B ,M ,PA),
						 mochila(B ,C ,M ,PAA),
						 mochila(A ,C ,M ,PAA),
						 mayor(PA ,PAA ,PAA ,P),
						 not(P=:=0),!.
mochila(A ,B ,C ,M ,P):- mayor(A ,B ,C ,MY),
						 mochila(MY ,M ,P),
						 not(P=:=0),!.
mochila(A ,B ,C ,M ,P):- segMayor(A ,B ,C ,SM),
						 mochila(SM ,M ,P),
						 not(P=:=0),!.   
mochila(A ,B ,C ,M ,P):- menor(A,B,C,MN),
						 mochila(MN,M,P),
						 not(P=:=0),!.





mochila(A ,B ,C ,D ,M ,P):-	sum(A ,B ,C ,D ,R),
							R =< M,P is R,!.
mochila(A ,B ,C ,D ,M ,P):-	mochila(A ,B ,C ,M ,PA),
							mochila(A ,B ,D ,M ,PAA),
							mochila(D ,B ,C ,M ,PAAA),
							mochila(C ,D ,A ,M ,PAAAA),
							mayor(PA ,PAA ,PAAA ,PAAAA ,P),
							not (P=:=0),!.
mochila(A ,B ,C ,D ,M ,P):-	mochila(A ,B ,M ,PA),
							mochila(C ,D ,M ,PAA),
							mochila(A ,D ,M ,PAA),
							mochila(B ,C ,M ,PAAA),
							mochila(A ,C ,M ,PAAAA),
							mochila(B ,D ,M ,PAAAAA),
							mayor(PA ,PAA ,PAA ,PAAA ,PAAAA ,PAAAAA ,P),
							not(P=:=0),!.
mochila(A ,B ,C ,D ,M ,P):-	mayor(A ,B ,C ,D ,R),
							R =< M,
							P is R,!.
mochila(A ,B ,C ,D ,M ,P):-	segMayor(A ,B ,C ,D ,R),
							R =< M,
							P is R,!.
mochila(A ,B ,C ,D ,M ,P):-	segMenor(A ,B ,C ,D ,R),
							R =< M,
							P is R,!.
mochila(A ,B ,C ,D ,M ,P):-	menor(A ,B ,C ,D ,R),
							R =< M,
							P is R,!.
mochila(A ,B ,C ,D ,M ,P):-	P is 0 .