
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

%Menores

menor( X, Y, Me ):- X < Y, Me is X.
menor( X, Y, Me ):- Y < X, Me is Y.

%menor( X, Y, X ):- X < Y.!.
%menor( X, Y, Y ).
menor( A, B, C, Me ):- menor(A,B,Me1), menor(C,Me1,Me).

menor( A, B, C, D, Me ):- menor(A,B,C,Me1),menor(Me1,D,Me).
menor(A,B,C,D,E,Me):- menor(A,B,C,D,Me1),menor(Me1,E,Me).

%mayores
mayor( X, Y, Ma ):- X > Y, Ma is X,!.
mayor( X, Y, Ma ):- Y > X, Ma is Y,!.

mayor( X, Y, Z, Ma ):- mayor(X,Y,Ma1),mayor(Z,Ma1,Ma).
mayor( X, Y, Z, T, Ma ):- mayor(X,Y,Z,Ma1),mayor(Ma1,T,Ma).
mayor( X, Y, Z, T, V, Ma):-mayor(X,Y,Z,T,Ma1),mayor(Ma1,V,Ma).

segmayor( A, B, C, D, Ma ):- 	
	mayor(A,B,C,D,Me1),mayor(B,C,D,Me2),menor(Me1,Me2,Ma),!;
	mayor(A,B,C,D,Me1),mayor(A,C,D,Me2),menor(Me1,Me2,Ma),!;
	mayor(A,B,C,D,Me1),mayor(A,B,D,Me2),menor(Me1,Me2,Ma),!;
	mayor(A,B,C,D,Me1),mayor(A,B,C,Me2),menor(Me1,Me2,Ma),!.


segmenor( A, B, C, Me ):- menor(A,B,Me1),menor(B,C,Me2),mayor(Me1,Me2,Me).
segmenor( A, B, C, D, Me ):-
	menor(A,B,C,D,Me1),menor(B,C,D,Me2),mayor(Me1,Me2,Me),!;
	menor(A,B,C,D,Me1),menor(A,C,D,Me2),mayor(Me1,Me2,Me),!;
	menor(A,B,C,D,Me1),menor(A,B,D,Me2),mayor(Me1,Me2,Me),!;
	menor(A,B,C,D,Me1),menor(A,B,C,Me2),mayor(Me1,Me2,Me),!.

suma(A,B,C,Sum):-Sum is A+B+C.



%%%%%
%
%
%
%%%%%

dospares1(A,B,C,D):-  
	par(A),par(B),impar(C),impar(D);
	par(A),par(C),impar(B),impar(D);
	par(A),par(D),impar(B),impar(C);
	par(B),par(C),impar(A),impar(D);
	par(B),par(D),impar(C),impar(A);
	par(C),par(D),impar(A),impar(B).

trespares(A,B,C,D):- 
	par(A),par(B),par(C),impar(D);
	par(A),par(D),par(B),impar(C);
	par(A),par(C),par(D),impar(B);
	par(C),par(B),par(D),impar(A).

sumapares( X,Y,Z, Sum ):-  
	par(X),par(Y),par(Z),Sum is X + Y + Z;
	par(X),par(Y),impar(Z), Sum is X + Y;
	par(X),par(Z),impar(Y), Sum is X + Z;
	par(Z),par(Y),impar(X), Sum is Z + Y;
	par(X),Sum is X;	par(Y),Sum is Y;	par(Z),Sum is Z;
	impar(X),impar(Y),impar(Z), Sum is 0.

dosiguales(A,B,C,D):-	
	igual(A,B),dif(A,C),dif(A,D),dif(C,D);
	igual(A,C),dif(A,B),dif(A,D),dif(B,D);
	igual(A,D),dif(A,C),dif(A,B),dif(C,B);
	igual(B,C),dif(B,A),dif(B,D),dif(A,D);
	igual(B,D),dif(B,A),dif(B,C),dif(A,C);
	igual(C,D),dif(C,A),dif(C,B),dif(A,B).			

full(A,B,C,D,E):- 
	iguales(A,B,C),igual(D,E),dif(A,E);
	iguales(A,B,D),igual(C,E),dif(A,E);
	iguales(A,B,E),igual(D,C),dif(A,D);	
	iguales(B,D,C),igual(A,E),dif(A,B);
	iguales(B,E,C),igual(D,A),dif(A,E);
	iguales(E,D,C),igual(A,B),dif(A,E).

poker(A,B,C,D,E):- 
	iguales(A,B,C,D),dif(A,E);
	iguales(A,B,C,E),dif(A,D);
	iguales(A,B,E,D),dif(A,C);
	iguales(A,E,C,D),dif(A,B);
	iguales(E,B,C,D),dif(A,E).

escalera(A,B,C,D,E):- dif(A,B,C,D,E),mayor(A,B,C,D,E,Ma),menor(A,B,C,D,E,Me),4=:=Ma-Me.

suma(A,B,C,D):-
	suma(A,B,C,Sum),Sum=:=D;
	suma(A,B,D,Sum),Sum=:=C;
	suma(A,D,C,Sum),Sum=:=B;
	suma(D,B,C,Sum),Sum=:=A.

quinas(A,B,C,D,E,Q):-
	A=:=5,B=\=5,C=\=5,D=\=5,E=\=5, Q is A;
	A=:=5,B=:=5,C=\=5,D=\=5,E=\=5, Q is A+B;
	A=:=5,B=:=5,C=:=5,D=\=5,E=\=5, Q is A+B+C;
	A=:=5,B=:=5,C=:=5,D=:=5,E=\=5, Q is A+B+C+D;
	A=:=5,B=:=5,C=:=5,D=:=5,E=:=5, Q is A+B+C+D+E.

%%Notas de alumnos:
%%
promedio(N1,N2,N3,NF):- NF is (N1+N2+N3)/3.

mejorpromedio( N1, N2, N3, Nf ):- 
	iguales(N1,N2,N3), Nf is (N1 + N2)/2;
	igual(N1,N2), Nf is (N2+N3)/2;
	igual(N1,N3), Nf is (N2+N3)/2;
	igual(N3,N2), Nf is (N2+N1)/2;
	mayor(N1,N2,N3,Ma1),segmenor(N1,N2,N3,Ma2) , Nf is (Ma1+Ma2)/2.

prommodal( N1, N2, N3, Nf ):- 
	iguales(N1,N2,N3), promedio(N1,N2,N3,Nf);
	igual(N1,N2), Nf is N1;
	igual(N1,N3), Nf is N1;
	igual(N3,N2), Nf is N2;
	dif(N1,N2,N3), Nf is N2.

habilitado( N1, N2, N3, N4 ):- 
	N1>59 , N2>59 , N3>59 , N4>59;
	N1>59 , N2>59 , N3>59 , N4<60;
	N1>59 , N2>59 , N3<60 , N4>59;
	N1>59 , N2<60 , N3>59 , N4>59;
	N1<60 , N2>59 , N3>59 , N4>59.

promprox( N1, N2, N3, Nf ):- 
	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1<Pro , N2<Pro, N3>Pro, Nf is (N1+N2)/2;
	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1<Pro , N2>Pro, N3<Pro, Nf is (N1+N3)/2;
	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1>Pro , N2<Pro, N3<Pro, Nf is (N3+N2)/2;

	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1>Pro , N2>Pro, N3<Pro, Nf is (N1+N2)/2;
	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1>Pro , N2>Pro, N3>Pro, Nf is (N1+N3)/2;
	mayor(N1,N2,N3,Ma),menor(N1,N2,N3,Me),Pro is (Ma+Me)/2, N1<Pro , N2>Pro, N3>Pro, Nf is (N3+N2)/2.

promediomedio( N1, N2, N3, N4, Nf ):- segmenor(N1,N2,N3,N4,N5),segmayor(N1,N2,N3,N4,N6),Nf is (N5+N6)/2.

notafinal( N1, N2, N3, N4, Nf ):- mayor(N1,N2,N3,N4,Ma), segmayor(N1,N2,N3,N4,Mi), Nf is (Ma+Mi)/2.

notafinal( N1, N2, N3, Nf ):- 
	N1>50, N2>50, N3>50, Nf is (N1+N2+N3)/3;
	N1>50, N2>50, N3<51, Nf is (N1+N2)/2;
	N1>50, N2<51, N3>50, Nf is (N1+N3)/2;
	N1<51, N2>50, N3>50, Nf is (N3+N2)/2;
	N1>50, N2<51, N3<51, Nf is N1;
	N1<51, N2>50, N3<51, Nf is N2;
	N1<51, N2<51, N3>50, Nf is N3.

%% PUNTOS EN EL CUADRANTE
%%

ejeX( X, Y ):- Y =:=0.

ejeY( X, Y ):- X =:=0.

lugar( X, Y, Q ):-
	X=:=0,Y=:=0, Q is 0;
	X>0,Y>0, Q is 1;
	X<0,Y>0, Q is 2;
	X<0,Y<0, Q is 3;
	X>0,Y<0, Q is 4;
	ejeX(X,Y), dif(X,0), Q is 5;
	ejeY(X,Y), dif(Y,0), Q is 6.

horizontal( X1, Y1, X2, Y2 ):-  Y1=:=Y2.

vertical( X1, Y1, X2, Y2 ):- X1=:=X2.

distancia( X1, Y1, X2, Y2, Dist):-
	X is abs(X2-X1), Y is abs(Y2-Y1), Dist is sqrt( X*X + Y*Y ).

sobreEjes( X1, Y1, X2, Y2 ):- 
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 5, L2=:=5;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 6, L2=:=6;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 5, L2=:=6;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 6, L2=:=5.

ejesDif( X1, Y1, X2, Y2 ):-
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 5, L2=:=6;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 6, L2=:=5.

diagOpuestos( X1, Y1, X2, Y2 ):-

	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 1, L2=:=3;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 3, L2=:=1;

	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 2, L2=:=4;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 4, L2=:=2.

mismoLugar( X1, Y1, X2, Y2 ):- 
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 1, L2=:=1;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 2, L2=:=2;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 3, L2=:=3;
	lugar(X1,Y1,L1),lugar(X2,Y2,L2),L1 =:= 4, L2=:=4.

dentroCirc( X1, Y1, R ):-
	X is X1+X1, Y is Y1+Y1, Rad is R*R, (X+Y) =< Rad.

pendiente( X1, Y1, X2, Y2, Pend ):-
	X is abs(X2-X1), Y is abs(Y2-Y1), Pend is (Y/X).

triangulo( X1, Y1, X2, Y2, X3, Y3 ):- 
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L1 =:= 6, L2 =:= 0, L3 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L1 =:= 6, L2 =:= 5, L3 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L1 =:= 6, L2 =:= 5, L3 =:= 0;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L1 =:= 6, L2 =:= 6, L3 =:= 5;

	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L2 =:= 6, L1 =:= 0, L3 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L2 =:= 6, L1 =:= 5, L3 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L2 =:= 6, L1 =:= 5, L3 =:= 0;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L2 =:= 6, L2 =:= 6, L3 =:= 5;

	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L3 =:= 6, L2 =:= 0, L1 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L3 =:= 6, L2 =:= 5, L1 =:= 5;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L3 =:= 6, L2 =:= 5, L1 =:= 0;
	lugar( X1, Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), L3 =:= 6, L2 =:= 6, L1 =:= 5.

triangDif( X1, Y1, X2, Y2, X3, Y3 ):-
	lugar(X1,Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L3), dif(L1,L2,L3).

trianguloRect( X1, Y1, X2, Y2, X3, Y3 ):-
	horizontal(X1,Y1,X2,Y2), vertical(X2,Y2,X3,Y3);
	horizontal(X1,Y1,X2,Y2), vertical(X1,Y1,X3,Y3);

	horizontal(X1,Y1,X3,Y3), vertical(X1,Y1,X2,Y2);
	horizontal(X1,Y1,X3,Y3), vertical(X2,Y2,X3,Y3);

	horizontal(X3,Y3,X2,Y2), vertical(X2,Y2,X1,Y1);
	horizontal(X3,Y3,X2,Y2), vertical(X1,Y1,X3,Y3).

trianguloEqui( X1, Y1, X2, Y2, X3, Y3 ):-
	distancia(X1,Y1,X2,Y2, D1),distancia(X2,Y2,X3,Y3,D2),distancia(X3,Y3,X1,Y1, D3),iguales(D1,D2,D3).

trianguloIsosceles( X1, Y1, X2, Y2, X3, Y3 ):-
	distancia(X1,Y1,X2,Y2, D1),distancia(X2,Y2,X3,Y3,D2),distancia(X3,Y3,X1,Y1, D3), igual(D1,D2),dif(D1,D3);	
	distancia(X1,Y1,X2,Y2, D1),distancia(X2,Y2,X3,Y3,D2),distancia(X3,Y3,X1,Y1, D3), igual(D1,D3),dif(D1,D2);
	distancia(X1,Y1,X2,Y2, D1),distancia(X2,Y2,X3,Y3,D2),distancia(X3,Y3,X1,Y1, D3), igual(D3,D2),dif(D1,D3).
	
