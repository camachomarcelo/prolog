menor(A,B,A):-A<B,!.
menor(A,B,B).

%menor(A,B,A):-A<B.
%menor(A,B,B):-B=<A.

%menor(A,B,Me):-A<B,Me is A.
%menor(A,B,Me):-B=<A,Me is B.

menor(A,B,C):-menor(A,B,Me1),menor(C,Me1,Me).


igual(A,B):-A==B.
igual(A,A).

dif(A,B):-not(igual(A,B)).

%Econtrar Menores:

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
dif(A,B,C):-not(igual(A,B)),not(igual(C,B)),not(igual(A,C)).
dif(A,B,C,D):-dif(A,B,C),not(igual(A,D)),not(igual(D,B)),not(igual(C,D)).
dif(A,B,C,D,E):-dif(A,B,C,D),not(igual(A,E)),not(igual(E,B)),not(igual(C,E)),not(igual(E,D)).

%Econtrar Uno Diferente:

unodif(A,B,C):-igual(A,B),dif(B,C);
	       igual(A,C),dif(B,C);
	       igual(B,C),dif(A,B).

unodif(A,B,C,D):-igual(A,B,C),dif(A,D);
				igual(A,C,D),dif(B,D);
				igual(A,B,D),dif(C,D);
				igual(B,C,D),dif(A,D).
unodif(A,B,C,D,E):-igual(A,B,C,D),dif(E,D);
				igual(A,C,D,E),dif(B,E);
				igual(A,B,D,E),dif(C,E);
				igual(B,C,D,E),dif(A,D);
				igual(A,B,C,E),dif(D,E).

