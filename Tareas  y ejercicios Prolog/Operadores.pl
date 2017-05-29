menor(A,B,A):-A<B,!.
menor(A,B,B).

menor(A,B,A):-A<B.
menor(A,B,B):-B=<A.

menor(A,B,Me):-A<B,Me is A.
menor(A,B,Me):-B=<A,Me is B.

menor(A,B,C):-menor(A,B,Me1),menor(C,Me1,Me).


igual(A,B):-A==B.
igual(A,A).

dif(A,B):-not(igual(A,B)).

&Econtrar Menores:

menor(A,B,Me):-A<B,Me is A.
menor(A,B,Me):-B=<A, Me is B.

menor(A,B,C,Me):-menor(A,B,Me1),menor(C,Me1,Me).

menor(A,B,C,D,Me):-menor(A,B,C,Me1),menor(D,Me1,Me).

menor(A,B,C,D,E,Me):-menor(A,B,C,D,Me1),menor(E,Me1,Me).

%Econtrar Mayores:

mayor(A,B,Ma):-A>B,Ma is A.
mayor(A,B,Ma):-B>=A,Ma is B.

mayor(A,B,C,Ma):-mayor(A,B,Ma1),mayor(C,Ma1,Ma).

mayor(A,B,C,D,Ma):-mayor(A,B,C,Ma1),mayor(D,Ma1,Ma).

mayor(A,B,C,D,E,Ma):-mayor(A,B,C,D,Ma1),mayor(E,Ma1,Ma).

%Econtrar iguales:

igual(A,B):-A==B.

igual(A,B,C):-igual(A,B),igual(A,C),igual(B,C).

igual(A,B,C,D):-igual(A,B,C),igual(C,D).

igual(A,B,C,D,E):-igual(A,B,C,D),igual(D,E).

%Econtrar Diferentes:

dif(A,B):-not(igual(A,B)).
dif(A,B,C):-dif(A,B),dif(B,C).
dif(A,B,C,D):-dif(A,B,C),dif(C,D).
dif(A,B,C,D,E):-dif(A,B,C,D),dif(D,E).

%Econtrar Uno Diferente:

unoDif(A,B,C):-igual(A,B),dif(B,C);
	       igual(A,C),dif(B,C);
	       igual(B,C),dif(A,B).

unoDif(A,B,C,D):-unoDif(A,B,C),

unoDif(A,B,C,D,E):-unoDif(A,B,C),





