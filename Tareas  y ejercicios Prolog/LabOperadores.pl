
%igual( X, X).
igual( X, Y ):- X =:= Y.

dif( X, Y ):- X =\= Y.
dif( X, Y ):- not( igual(X,Y) ).

par( X ):- X mod 2 =:= 0.
impar( X ):- not( par(X) ).

dospares( X, Y, Z ):- par(X), par(Y), impar(Z),!;
	par(X), impar(Y), par(Z),!;
	impar(X), par(Y), par(Z),!.
dospares( A, B, C, D ):- dospares(A,B,C), impar(D),!;
	dospares(A,B,D), impar(C),!;
	dospares(A,D,C), impar(B),!;
	dospares(D,B,C), impar(A),!.
dospares( A, B, C, D, E ):- dospares(A,B,C,D),impar(E),!;
	dospares(A,B,C,E),impar(D),!;
	dospares(A,B,D,E),impar(C),!;
	dospares(A,C,D,E),impar(B),!;
	dospares(B,C,D,E),impar(A),!.

iguales( X, Y, Z ):- igual(X,Y),igual(Y,Z),!.
iguales( X, Y, Z, T ):- iguales(X,Y,Z),igual(Z,T),!.

%dif( A, B, C ):- not( iguales(A,B,C) ).
%dif( A, B , C, D ):- not( iguales(A,B,C,D) ).
%dif( A, B , C, D, E ):- dif(A,B,C,D),dif(A,E).

dif( X, Y, Z ):- dif(X,Y),dif(Y,Z),dif(X,Z),!.
dif( A, B, C, D ):- dif(A,B,C),dif(A,D),!;
	dif(A,B,C),dif(B,D),!;
	dif(A,B,C),dif(C,D),!.
dif( A, B, C, D, E ):- dif(A,B),dif(A,C),dif(A,D),dif(A,E),dif(B,C),
	dif(B,D),dif(B,E),dif(C,D),dif(C,E),dif(D,E),!.

menor( X, Y, Me ):- X < Y, Me is X.
menor( X, Y, Me ):- Y < X, Me is Y.

%menor( X, Y, X ):- X < Y.!.
%menor( X, Y, Y ).
menor( A, B, C, Me ):- menor(A,B,Me1), menor(C,Me1,Me),!.

menor( A, B, C, D, Me ):- menor(A,B,C,Me1),menor(Me1,D,Me),!.


%mayores
mayor( X, Y, Ma ):- X > Y, Ma is X.
mayor( X, Y, Ma ):- X < Y, Ma is Y.

mayor( X, Y, Z, Ma ):- mayor(X,Y,Ma1),mayor(Z,Ma1,Ma),!.
mayor( X, Y, Z, T, Ma ):- mayor(X,Y,Z,Ma1),mayor(Ma1,T,Ma),!.

segmenor( A, B, C, Me ):- menor(A,B,Me1),menor(B,C,Me2),mayor(Me1,Me2,Me),!.
