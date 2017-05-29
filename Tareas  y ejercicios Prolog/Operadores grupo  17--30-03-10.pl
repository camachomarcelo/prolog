%wilma cruz serrudo 200758543
%garcia rodriguez alejandro 200413899
%lopes terrazas vehimar 200610589





%Logica sobre enteros%

parimpar(X,Y):-par(X),impar(Y);
	       par(Y),impar(X).
dospares(A,B,C,D):-parimpar(A,B),parimpar(C,D),!.
dospares(A,B,C,D):-parimpar(A,C),parimpar(B,D).


trespares(A,B,C,D):-	par(A),dospares(B,C,D,1);
			par(B),dospares(A,C,D,1);
			par(C),dospares(B,A,D,1);
			par(D),dospares(B,C,A,1).


sumapares(X,0):-impar(X),!.
sumapares(X,X).
sumapares(X,Y,Z,Suma):-sumapares(X,A),sumapares(Y,B),sumapares(Z,C),Suma is A+B+C.




dosiguales(A,B,C,D):-A=:=B,C=\=A,D=\=A,!.
dosiguales(A,B,C,D):-B=:=C,A=\=B,D=\=B,!.
dosiguales(A,B,C,D):-C=:=D,A=\=C,C=\=B,!.
dosiguales(A,B,C,D):-D=:=C,A=\=D,B=\=D,!.
dosiguales(A,B,C,D):-A=:=C,A=\=B,A=\=D,!.
dosiguales(A,B,C,D):-B=:=D,A=\=B,C=\=B,!.
dosiguales(A,B,C,D):-C=:=A,B=\=C,D=\=C,!.
dosiguales(A,B,C,D):-D=:=B,D=\=C,D=\=A,!.
dosiguales(A,B,C,D):-A=:=D,B=\=A,C=\=A.



mayor(A,B,B):- B>A,!.
mayor(A,B,A).
mayor(A,B,C,My):- mayor(A,B,K),mayor(K,C,My).
mayor(A,B,C,D,My):- mayor(A,B,C,K),mayor(K,D,My).
mayor(A,B,C,D,E,My):- mayor(A,B,C,D,K),mayor(K,E,My).



menor(A,B,A):-A<B,!.
menor(A,B,B).
menor(A,B,C,Me):- menor(A,B,K),menor(K,C,Me).
menor(A,B,C,D,Me):- menor(A,B,C,K),menor(K,D,Me).
menor(A,B,C,D,E,Me):- menor(A,B,C,D,K),menor(K,E,Me).




















