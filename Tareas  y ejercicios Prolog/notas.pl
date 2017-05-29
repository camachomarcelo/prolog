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

promedio(N1,N2,N3,NF):- NF is (N1+N2+N3)/3.

mejorProm(N1,N2,N3,NF):- menor(N1,N2,N3,Me), NF is (N1+N2+N3-Me)/2.


dif(A,B):- not(igual(A,B)).

dif(A,B,C):- dif(A,B), dif(B,C), dif(A,C).

promModal(N1,N2,N3,N2):- dif(N1,N2,N3), !.
promModal(N1,N2,N3,NF):- igual(N1,N2), NF is N1;
			   igual(N2,N3), NF is N2;
			     igual(N1,N3), NF is N3.

segMenor(A,B,C,Me):- menor(A,B,C,A), menor(B,C,Me),!;
			menor(A,B,C,B), menor(A,C,Me),!;
			    menor(A,B,Me).

segMenor(A,B,C,D,Me):- menor(A,B,C,D,D), menor(A,B,C,Me),!;
			 menor(A,B,C,D,C), menor(A,B,D,Me),!;
			   menor(A,B,C,D,B), menor(A,C,D,Me),!;
			      menor(A,B,C,D,A), menor(B,C,D,Me).

segMayor(A,B,C,D,My):- mayor(A,B,C,D,D), mayor(A,B,C,My),!;
                          mayor(A,B,C,D,C), mayor(A,B,D,My),!;
				mayor(A,B,C,D,B), mayor(A,D,C,My),!;
				     mayor(A,B,C,D,A), mayor(D,B,C,My).

habilitado(N1,N2,N3,N4):- segMenor(N1,N2,N3,N4,Me), Me>=60.

promProx(N1,N2,N3,NF):- (menor(N1,N2,N3,Me), segMenor(N1,N2,N3,Med), mayor(N1,N2,N3,My)),
				((Med - Me =< My - Med, NF is (Med+Me)/2,!);
					(Med - Me >= My - Med, NF is (Med+My)/2)).


promedioMedio(N1,N2,N3,N4,NF):- mayor(N1,N2,N3,N4,My), menor(N1,N2,N3,N4,Me),
				  NF is (N1+N2+N3+N4-My-Me)/2.

notaFinal(N1,N2,N3,N4,NF):- mayor(N1,N2,N3,N4,My), segMayor(N1,N2,N3,N4,My2),
				NF is (My + My2)/2.

notaAprobada(N):- N >= 50.

cantNotasAprob(N1,N2,Cant):- (notaAprobada(N1), notaAprobada(N2), Cant is 2,!);
				((notaAprobada(N1); notaAprobada(N2)), Cant is 1,!);
					(Cant is 0).

cantNotasAprob(N1,N2,N3,Cant):- (cantNotasAprob(N1,N2,Cant2), notaAprobada(N3), Cant is (Cant2+1)),!;
					cantNotasAprob(N1,N2,Cant),!;
						Cant is 0.

sumNotasAprob(N1,N2,Sum):- (notaAprobada(N1), notaAprobada(N2), Sum is (N1+N2),!);
				((notaAprobada(N1),Sum is N1); (notaAprobada(N2), Sum is N2),!);
					(Sum is 0).

sumNotasAprob(N1,N2,N3,Sum):- (sumNotasAprob(N1,N2,Sum1), notaAprobada(N3), Sum is (Sum1+N3)),!;
				 (sumNotasAprob(N1,N2,Sum),!);
					Sum is 0.

notaFinal(N1,N2,N3,NF):- sumNotasAprob(N1,N2,N3,Sum), cantNotasAprob(N1,N2,N3,Cant),	
				NF is Sum/Cant.