par(A):- (A mod 2) =:= 0.

par(A,B):- par(A), par(B).

par(A,B,C):- par(A,B), par(C).

impar(A):- (A mod 2) =:= 1.

impar(A,B):- impar(A), impar(B).

impar(A,B,C):- impar(A,B), impar(C).

parImpar(A,B):- par(A), impar(B);
		   impar(A), par(B).

dosPares(A,B,C,D):- parImpar(A,B), parImpar(C,D);
		 	parImpar(A,C), parImpar(B,D);
			   parImpar(A,D), parImpar(B,C).

tresPares(A,B,C,D):- par(A,B,C), impar(D);
			par(B,C,D), impar(A);
			   par(C,D,A), impar(B);
				par(D,A,B), impar(C).

sumaPares(A,B,Sum):- par(A,B), Sum is A+B;
		        par(A), Sum is A;
			   par(B), Sum is B;
			      Sum is 0.

sumaPares(X,Y,Z,Sum):- sumaPares(X,Y,Sum1), par(Z), Sum is Sum1+Z;
			 sumaPares(X,Y,Sum).

igual(A,A).

igual(A,A,A).

igual(A,A,A,A).

dif(A,B):- not(igual(A,B)).

dif(A,B,C):- dif(A,B), dif(B,C), dif(A,C).

dosIguales(A,B,C,D):- igual(A,B), dif(B,C,D);
			igual(A,C), dif(C,B,D);
			   igual(A,D), dif(D,C,B);
			      igual(B,C), dif(A,B,D);
				igual(B,D), dif(B,A,C);
				   igual(C,D), dif(C,A,B).


mayor(A,B,My):- A>B, My is A,!;
		 B>=A, My is B.

mayor(A,B,C,My):- mayor(A,B,My1), mayor(My1,C,My).

mayor(A,B,C,D,My):- mayor(A,B,C,My1), mayor(My1,D,My).

mayor(A,B,C,D,E,My):- mayor(A,B,C,D,My1), mayor(My1,E,My).


menor(A,B,Me):- A<B, Me is A,!;
		B=<A, Me is B.

menor(A,B,C,Me):- menor(A,B,Me1), menor(C,Me1,Me).

menor(A,B,C,D,Me):- menor(A,B,C,Me1), menor(Me1,D,Me).

menor(A,B,C,D,E,Me):- menor(A,B,C,D,Me1), menor(Me1,E,Me).

poker(A,A,A,D):- dif(A,D),!.
poker(C,B,B,B):- dif(C,B),!.
poker(C,A,C,C):- dif(C,A),!.
poker(D,D,A,D):- dif(D,A).

dosDosIguales(A,A,B,B):- dif(A,B),!.
dosDosIguales(A,B,A,B):- dif(A,B),!.
dosDosIguales(A,B,B,A):- dif(A,B).

full(A,B,C,D,E):- ( igual(E,A); igual(E,B); igual(E,C); igual(E,D) ), 
		   ( poker(A,B,C,D) ; dosDosIguales(A,B,C,D) ).

poker(A,A,A,A,B):- dif(A,B),!.
poker(B,A,A,A,A):- dif(A,B),!.
poker(A,B,A,A,A):- dif(A,B),!.
poker(A,A,B,A,A):- dif(A,B),!.
poker(A,A,A,B,A):- dif(A,B).

segMayor(A,B,C,D,My):- mayor(A,B,C,D,D), mayor(A,B,C,My),!;
                          mayor(A,B,C,D,C), mayor(A,B,D,My),!;
				mayor(A,B,C,D,B), mayor(A,D,C,My),!;
				     mayor(A,B,C,D,A), mayor(D,B,C,My).

segMayor(A,B,C,D,E,My):- (mayor(A,B,C,D,E,E), mayor(A,B,C,D,My)),!;
			    (mayor(A,B,C,D,E,D), mayor(A,B,C,E,My)),!;
				(mayor(A,B,C,D,E,C), mayor(A,B,E,D,My)),!;
				   (mayor(A,B,C,D,E,B), mayor(A,E,C,D,My)),!;
					(mayor(A,B,C,D,E,A), mayor(E,B,C,D,My)).

segMenor(A,B,C,D,Me):- menor(A,B,C,D,D), menor(A,B,C,Me),!;
			 menor(A,B,C,D,C), menor(A,B,D,Me),!;
			   menor(A,B,C,D,B), menor(A,C,D,Me),!;
			      menor(A,B,C,D,A), menor(B,C,D,Me).

segMenor(A,B,C,D,E,Me):- (menor(A,B,C,D,E,E), menor(A,B,C,D,Me)),!;
			    (menor(A,B,C,D,E,D), menor(A,B,C,E,Me)),!;
				(menor(A,B,C,D,E,C), menor(A,B,E,D,Me)),!;
			           (menor(A,B,C,D,E,B), menor(A,E,C,D,Me)),!;
					(menor(A,B,C,D,E,A), menor(E,B,C,D,Me)).

trcrMenor(A,B,C,D,E,A):- not( menor(A,B,C,D,E,A); mayor(A,B,C,D,E,A); segMenor(A,B,C,D,E,A); segMayor(A,B,C,D,E,A) ), !.
trcrMenor(A,B,C,D,E,B):- not( menor(A,B,C,D,E,B); mayor(A,B,C,D,E,B); segMenor(A,B,C,D,E,B); segMayor(A,B,C,D,E,B) ), !.
trcrMenor(A,B,C,D,E,C):- not( menor(A,B,C,D,E,C); mayor(A,B,C,D,E,C); segMenor(A,B,C,D,E,C); segMayor(A,B,C,D,E,C) ), !.
trcrMenor(A,B,C,D,E,D):- not( menor(A,B,C,D,E,D); mayor(A,B,C,D,E,D); segMenor(A,B,C,D,E,D); segMayor(A,B,C,D,E,D) ), !.
trcrMenor(A,B,C,D,E,E).

escalera(A,B,C,D,E):- menor(A,B,C,D,E,M1), segMenor(A,B,C,D,E,M2),
			  trcrMenor(A,B,C,D,E,M3), segMayor(A,B,C,D,E,M4), mayor(A,B,C,D,E,M5), 
				M1+1 =:= M2, M2+1 =:= M3, M3+1 =:= M4, M4+1 =:= M5.

suma(A,B,C,D):- (Sum is (A+B+C+D),
			( (Sum-A =:= A); (Sum-B =:= B) ; (Sum-C =:= C); (Sum-D =:= D) ) ).

esCinco(A):- A=:=5.

quinas(A,B,Q):- esCinco(A), esCinco(B), Q is 10,!.
quinas(A,B,5):- esCinco(A); esCinco(B),!.
quinas(A,B,0).

quinas(A,B,C,Q):- quinas(A,B,Q1), esCinco(C), Q is (Q1+5),!.
quinas(A,B,C,Q):- quinas(A,B,Q),!.
quinas(A,B,C,5):- esCinco(C),!.
quinas(A,B,C,0).

quinas(A,B,C,D,Q):- quinas(A,B,C,Q1), esCinco(D), Q is (Q1+5),!.
quinas(A,B,C,D,Q):- quinas(A,B,C,Q),!.
quinas(A,B,C,D,5):- esCinco(D),!.
quinas(A,B,C,D,0).

quinas(A,B,C,D,E,Q):- quinas(A,B,C,D,Q1), esCinco(E), Q is (Q1+5),!.
quinas(A,B,C,D,E,Q):- quinas(A,B,C,D,Q),!.
quinas(A,B,C,D,E,5):- esCinco(E),!.
quinas(A,B,C,D,E,0).