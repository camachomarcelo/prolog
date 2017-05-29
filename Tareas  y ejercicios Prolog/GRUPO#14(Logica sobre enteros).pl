%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						%
%  GRUPO # 14:					%
%						%
%	FERNANDO MENDOZA CHÁVEZ.		%
%	LIGIA BARRERA COPA.			%
%	EUSTAQUIO FERNANDEZ ABALOS.		%
%						%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%					   %
%       LOGICA SOBRE ENTEROS.  		   %
%					   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% a) dospares(A, B, C, D): predicado que es True, si entre sus argumentos A, B, C y D 	%
%    existen únicamente dos pares y dos impares.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
par(X):-X mod 2 =:= 0.
impar(X):-not(par(X)).
parimpar(X,Y):-par(X),impar(Y);
	       par(Y),impar(X).
dospares(A,B,C,D):-parimpar(A,B),parimpar(C,D),!.
dospares(A,B,C,D):-parimpar(A,C),parimpar(B,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% b) trespares(A, B, C, D): Predicado que es True, si entre los argumentos A, B, C y D 	%
%    existen únicamente tres pares y un impar.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trespares(A,B,C,D):-	par(A),dospares(B,C,D,1);
			par(B),dospares(A,C,D,1);
			par(C),dospares(B,A,D,1);
			par(D),dospares(B,C,A,1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% c) sumapares(X, Y, X, Suma): Predicado que encuentra la suma de los números pares 	%
%    de X, Y, y Z. La suma se encuentra en Suma.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sumapares(X,0):-impar(X),!.
sumapares(X,X).
sumapares(X,Y,Z,Suma):-sumapares(X,A),sumapares(Y,B),sumapares(Z,C),Suma is A+B+C.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% d) dosiguales(A, B, C, D): predicado que es True, si entre los argumentos A, B, C y D	%
% existen únicamente dos argumentos iguales.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dosigual(A,A,C,D):- A=\=C, C=\=D, A=\=D,!.
dosigual(A,C,A,D):- A=\=C, C=\=D, A=\=D,!.
dosigual(A,C,D,A):- A=\=C, C=\=D, A=\=D,!.
dosigual(C,A,D,A):- A=\=C, C=\=D, A=\=D,!.
dosigual(C,D,A,A):- A=\=C, C=\=D, A=\=D,!.
dosigual(C,A,A,D):- A=\=C, C=\=D, A=\=D.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% e) mayor(A, B, C, D, E, My): Predicado que es True, si en My se encuentra el mayor de %
%    los argumentos de A, B, C, D y E.							%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayor(A,B,B):- B>A, !.
mayor(A,B,A).
mayor(A,B,C,My):- mayor(A,B,K),mayor(K,C,My).
mayor(A,B,C,D,My):- mayor(A,B,C,K),mayor(K,D,My).
mayor(A,B,C,D,E,My):- mayor(A,B,C,D,K),mayor(K,E,My).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% f)	menor(A, B, C, D, E, Me): Predicado que es True, si en Me se encuentra el menor %
%       de los argumentos de A, B, C, D y E.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
menor(A,B,B):- B<A, !.
menor(A,B,A).
menor(A,B,C,Me):- menor(A,B,K), menor(K,C,Me).
menor(A,B,C,D,Me):- menor(A,B,C,K), menor(K,D,Me).
menor(A,B,C,D,E,Me):- menor(A,B,C,D,K), menor(K,E,Me).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% g) full(A, B, C, D, E): Predicado que es True, si existen tres argumentos iguales y 	%
%    los otros dos argumentos también son iguales pero diferentes a los otros.		%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
full(A,A,A,B,B):-A=\=B,!.
full(A,A,B,B,A):-A=\=B,!.
full(A,B,B,A,A):-A=\=B,!.
full(B,B,A,A,A):-A=\=B,!.
full(A,A,B,A,B):-A=\=B,!.
full(A,B,A,B,A):-A=\=B,!.
full(B,A,B,A,A):-A=\=B,!.
full(B,A,A,B,A):-A=\=B,!.
full(A,B,A,A,B):-A=\=B,!.
full(B,A,A,A,B):-A=\=B.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% h) poker(A, B, C, D, E): Predicado que es True, si existen únicamente cuatro 		%
%    argumentos iguales, el otro es diferente a los cuatro iguales.			%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
poker(A,A,A,A,X):-X=\=A,!.
poker(A,A,A,X,A):-X=\=A,!.
poker(A,A,X,A,A):-X=\=A,!.
poker(A,X,A,A,A):-X=\=A,!.
poker(X,A,A,A,A):-X=\=A.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% i) escalera(A, B, C, D, E): Predicado que es True, si los cinco argumentos son 	%
%    diferentes y entre ellos pueden formar una escalera.				%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
esc(A,B):-A=\=B.
esc(A,B,C):-esc(A,B),esc(B,C),esc(A,C).
esc(A,B,C,D):-esc(A,B,C),esc(A,D),esc(B,D),esc(C,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% j) suma(A, B, C, D): Predicado que es True, si un argumento es igual a la suma de los %
%    otros argumentos									%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
suma(A,B,C,D):- A is B+C+D,!.
suma(A,B,C,D):- B is A+C+D,!.
suma(A,B,C,D):- C is A+B+D,!.
suma(A,B,C,D):- D is A+B+C.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% k) quinas(A, B, C, D, E, Q): Predicado que encuentra la suma de los argumentos 	%
%    A, B, C, D y E que tienen valor de cinco, esta suma se encuentra en Q. 		%
%    Ejemplo. 3, 5, 6, 5, 2. La suma es 10.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
quinas(A,0):- A=\=5,!.
quinas(A,A).
quinas(A,B,Q):-quinas(A,X),quinas(B,Z),Q is X+Z.
quinas(A,B,C,D,E,Q):-quinas(A,B,X),quinas(C,D,Y),quinas(E,Z),Q is X+Y+Z.
