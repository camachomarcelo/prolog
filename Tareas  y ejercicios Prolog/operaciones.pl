% Author:
% Date: 27/03/2008

menor(X,Y):-X<Y.
menor(X,Y,X):-X<Y,!.
menor(_,Y,Y).
menor(X,Y,Z,Me):-menor(X,Y,Me1),menor(Z,Me1,Me).
menor(X,Y,Z,T,Me):-menor(X,Y,Z,Me1),menor(T,Me1,Me).
menor(X,Y,Z,T,U,Me):-menor(X,Y,Z,T,Me1),menor(U,Me1,Me).
%mayores
mayor(A,B,A):-A>B.
mayor(_,B,B).
mayor(A,B,C,My):-mayor(A,B,Ma1),mayor(C,Ma1,My).
mayor(A,B,C,D,My):-mayor(A,B,C,Ma1),mayor(D,Ma1,My).
mayor(A,B,C,D,E,My):-mayor(A,B,C,D,Ma1),mayor(E,Ma1,My).
%diferentes si todos son diferentes
medio(X,Y,Z,X):-estaEntre(X,Y,Z),!.
medio(X,Y,Z,Y):-estaEntre(Y,X,Z),!.
medio(_,_,Z,Z).
estaEntre(X,Y,Z):-(X<Y,X>Z);(X>Y,X<Z).

igual(A,A).
dif(A,B):-not(igual(A,B)).
dif(A,B,C):-dif(A,B),dif(B,C).
dif(A,B,C,D):-dif(A,B,C),dif(C,D).
dif(A,B,C,D,E):-dif(A,B,C,D),dif(E,D).

segMayor(A,B,C,SMa):-medio(A,B,C,SMa).
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,A),mayor(B,C,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,B),mayor(A,C,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,C),mayor(A,B,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,SMa).

segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=A,mayor(B,C,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=B,mayor(A,C,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=C,mayor(A,B,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=D,mayor(A,B,C,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,SMa).


segMedio(A,B,C,SMa):-medio(A,B,C,SMa).
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=A,menor(B,C,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=B,menor(A,C,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=C,menor(B,A,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=D,menor(B,C,A,SMe).

segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=A,menor(B,C,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=B,menor(A,C,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=C,menor(A,B,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=D,menor(A,B,C,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=E,menor(A,B,C,D,SMe).
