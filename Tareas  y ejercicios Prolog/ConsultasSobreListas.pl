menor(A,B,Me):- A > B, Me is B,!.
menor(A,B,Me):-	B > A, Me is A,!.

par(X):- X mod 2 =:= 0,!.
impar(X):- X mod 2 =:= 1,!.

mayor(A, B, May):- A > B, May is A,!.
mayor(A,B,May):- B > A, May is B,!.

%1%
menor( [X], X ).

menor( [X|L1], Me ):-	menor(L1,Me1),
		menor(X,Me1,Me),!.

%2%
mayor( [X], X ).

mayor( [X|L1], May ):-	mayor(L1,May1),
		mayor(X,May1,May),!.

%%3
cantidad([],0).

cantidad([X|L1],Can):-cantidad(L1,Can1),
	Can is Can1 +1,!.

%%4    X
%%diferencia(X,Y,Dif):-Dif is abs(X-Y),!.

%%menordif([],0).

%%menordif([X,Y],Dif):-diferencia(X,Y,Dif),!.

%%menordif([X,Y|L1],Dif):- menordif([Y|L1],Dif1),
%%	diferencia(X,Y,D1),menor(D1,Dif1,Dif).

%5%
existePar([]).

existePar([X|L1]):- existePar(L1),par(X).

existePar([X|L1]):- existePar(L1).

%6%
existeImpar([X]):-impar(X).

existeImpar([X|L1]):-existeImpar(L1),impar(X).

existeImpar([X|L1]):-existeImpar(L1).

%7%
existeParImpar(L1):-existePar(L1),existeImpar(L1).

