menor(Me,B,Me):- Me=<B,!.
menor(A,Me,Me):- A>=Me.

menor(A,B,C,Me):- menor(A,B,Me1), menor(C,Me1,Me).

menor(A,B,C,D,Me):- menor(A,B,C,Me1), menor(Me1,D,Me).

menor(A,B,C,D,E,Me):- menor(A,B,C,D,Me1), menor(Me1,E,Me).

mayor(My,B,My):- My>=B,!.
mayor(A,My,My).

mayor(My,B,C,My):- mayor(B,C,My1),mayor(My1,My,My),!.
mayor(A,My,C,My):- mayor(My,C,My),!.
mayor(A,B,My,My).

mayor(A,B,C,D,My):- mayor(A,B,C,My1), mayor(My1,D,My).

mayor(A,B,C,D,E,My):- mayor(A,B,C,D,My1), mayor(My1,E,My).

igual(X,X).
diferente(X,Y):- not(igual(X,Y)).

dosIguales(A,A).

dosIguales(A,A,C):- not(igual(A,C)),!.
dosIguales(A,B,B):- not(igual(A,B)).

dosIguales(A,A,C,D):- not(dosIguales(A,C,D)),!.
dosIguales(A,B,B,D):- not(dosIguales(A,B,D)),!.
dosIguales(A,B,C,C):- not(dosIguales(A,B,C)).

dosIguales(A,A,C,D,E):- not(dosIguales(A,C,D,E)),!.
dosIguales(A,B,B,D,E):- not(dosIguales(A,B,D,E)),!.
dosIguales(A,B,C,C,E):- not(dosIguales(A,B,C,E)),!.
dosIguales(A,B,C,D,D):- not(dosIguales(A,B,C,D)).

igual(A,A,A).
igual(A,A,A,A).
igual(A,A,A,A,A).

dif(A,B):- not(igual(A,B)).

dif(A,B,C):- dif(A,B), dif(B,C), dif(A,C).

dif(A,B,C,D):- dif(A,B,C), dif(B,C,D), dif(C,D,A).

dif(A,B,C,D,E):- dif(A,B,C,D), dif(B,C,D,E), dif(C,D,E,A),
		dif(D,E,A,B), dif(E,A,B,C).

poker(A,B):- dif(A,B).

poker(A,A,C):-dif(A,C),!.
poker(A,B,B):-dif(A,B),!.
poker(C,B,C):- dif(C,B).

poker(A,A,A,D):- dif(A,D),!.
poker(C,B,B,B):- dif(A,B),!.
poker(C,A,C,C):- dif(C,A),!.
poker(D,D,A,D):- dif(D,A).

poker(A,A,A,A,B):- dif(A,B),!.
poker(B,A,A,A,A):- dif(A,B),!.
poker(A,B,A,A,A):- dif(A,B),!.
poker(A,A,B,A,A):- dif(A,B),!.
poker(A,A,A,B,A):- dif(A,B).

segMenor(A,Me,Me):- A=<Me,!.
segMenor(Me,B,Me).

segMenor(A,B,C,Me):- menor(A,B,C,C), menor(A,B,Me);
			menor(A,B,C,B), menor(A,C,Me);
			   menor(B,C,Me).

segMenor(A,B,C,D,Me):- menor(A,B,C,D,D), menor(A,B,C,Me);
			 menor(A,B,C,D,C), menor(A,B,D,Me);
			   menor(A,B,C,D,B), menor(A,C,D,Me);
			      menor(A,B,C,D,A), menor(B,C,D,Me).

segMenor(A,B,C,D,E,Me):- menor(A,B,C,D,E,E), menor(A,B,C,D,Me);
			    menor(A,B,C,D,E,D), menor(A,B,C,E,Me);
				menor(A,B,C,D,E,C), menor(A,B,E,D,Me);
			           menor(A,B,C,D,E,B), menor(A,E,C,D,Me);
					menor(A,B,C,D,E,A), menor(E,B,C,D,Me).

segMayor(A,B,My):- menor(A,B,My).

segMayor(A,B,C,My):- mayor(A,B,C,C), mayor(A,B,My);
			mayor(A,B,C,B), mayor(A,C,My);
			   mayor(A,B,C,A), mayor(C,B,My).

segMayor(A,B,C,D,My):- mayor(A,B,C,D,D), mayor(A,B,C,My);
                          mayor(A,B,C,D,C), mayor(A,B,D,My);
				mayor(A,B,C,D,B), mayor(A,D,C,My);
				     mayor(A,B,C,D,A), mayor(D,B,C,My).

segMayor(A,B,C,D,E,My):- mayor(A,B,C,D,E,E), mayor(A,B,C,D,My);
			    mayor(A,B,C,D,E,D), mayor(A,B,C,E,My);
				mayor(A,B,C,D,E,C), mayor(A,B,E,D,My);
				   mayor(A,B,C,D,E,B), mayor(A,E,C,D,My);
					mayor(A,B,C,D,E,A), mayor(E,B,C,D,My).