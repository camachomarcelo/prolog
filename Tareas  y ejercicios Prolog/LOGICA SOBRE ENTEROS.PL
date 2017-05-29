%-------------PREDICADOS AUXILIARES--------------
par(A):-A mod 2 =:=0.
impar(A):-A mod 2 =:=1.

dospares(A,B):-par(A),par(B).
trespares(A,B,C):-dospares(A,B),par(C).

dosimpares(A,B):-A mod 2 =:=1,
		 B mod 2 =:=1.
tresimpares(A,B,C):-dosimpares(A,B),impar(C).

sumapares(X,Y,Sum):-dospares(X,Y),Sum is X+Y;
		    par(X),impar(Y),Sum is X;
		    impar(X),par(Y),Sum is Y;
		    impar(X),impar(Y),Sum is 0.

igual(A,A).
igual(A,B,C):-igual(A,B),igual(B,C).
igual(A,B,C,D):-igual(A,B,C),igual(C,D).
igual(A,B,C,D,E):-igual(A,B,C,D),igual(D,E).


dif(A,B):-not(igual(A,B)).
dif(A,B,C):-dif(A,B),dif(A,C),dif(B,C).
dif(A,B,C,D):-dif(A,B),dif(A,C),dif(A,D),
	      dif(B,C),dif(B,D),
	      dif(C,D).

dif(A,B,C,D,E):-dif(A,B),dif(A,C),dif(A,D),dif(A,E),
	      dif(B,C),dif(B,D),dif(B,E),
	      dif(C,D),dif(C,E),
	      dif(D,E).



mayor(A,B,My):-igual(A,B),My is 0;
	       A >B,My is A;
	       B >A,My is B.
mayor(A,B,C,My):-mayor(A,B,My1),mayor(C,My1,My).

mayor(A,B,C,D,My):-mayor(A,B,C,My1),mayor(D,My1,My).

%mayor(A,B,C,D,E,My):-mayor(A,B,C,D,My1),mayor(E,My1,My).

menor(A,B,Me):-igual(A,B),Me is 0;
	       A < B, Me is A;
	       B < A, Me is B.
menor(A,B,C,Me):-menor(A,B,Me1),menor(C,Me1,Me).
menor(A,B,C,D,Me):-menor(A,B,C,Me1),menor(D,Me1,Me).



%-------------EJERCICIOS RESUELTOS--------------


dospares(A,B,C,D):-dospares(A,B),dosimpares(C,D);
		   dospares(A,C),dosimpares(B,D);
		   dospares(A,D),dosimpares(B,C);
		   dospares(B,C),dosimpares(A,D);
		   dospares(B,D),dosimpares(A,C);
		   dospares(C,D),dosimpares(A,B).

trespares(A,B,C,D):-trespares(A,B,C),impar(D);
		    trespares(A,B,D),impar(C);
		    trespares(A,D,C),impar(B);
		    trespares(D,B,C),impar(A).


		    	

sumapares(X,Y,Z,Sum):-dospares(X,Y),impar(Z),Sum is X+Y;
		      dospares(X,Z),impar(Y),Sum is X+Z;
		      dospares(Y,Z),impar(X),Sum is Y+Z;
		      trespares(X,Y,Z),Sum is 0;
		      tresimpares(X,Y,Z),Sum is 0;
		      dosimpares(X,Y),par(Z),Sum is 0;
		      dosimpares(X,Z),par(Y),Sum is 0;
		      dosimpares(Y,Z),par(X),Sum is 0.

dosiguales(A,B,C,D):-igual(A,B), dif(A,C,D);
	             igual(A,C), dif(A,B,D);
	             igual(A,D), dif(A,C,B);
	             igual(B,C), dif(A,B,D);
	             igual(B,D), dif(A,B,C);
	             igual(C,D), dif(A,B,C).

mayor(A,B,C,D,E,My):-mayor(A,B,C,D,My1),mayor(E,My1,My).
menor(A,B,C,D,E,Me):-menor(A,B,C,D,Me1),menor(E,Me1,Me).

full(A,B,C,D,E):-igual(A,D),igual(B,C,E),dif(D,B);
		  igual(A,B),igual(C,D,E),dif(B,C);
		  igual(A,C),igual(B,D,E),dif(C,B);
		  igual(A,D),igual(B,C,E),dif(D,B);
		  igual(A,E),igual(B,C,D),dif(E,B);
		  igual(B,C),igual(A,D,E),dif(C,A);
		  igual(B,D),igual(A,C,E),dif(D,A);
		  igual(B,E),igual(A,C,D),dif(E,A);
		  igual(C,D),igual(A,B,E),dif(D,A);
		  igual(C,E),igual(A,B,D),dif(E,A);
		  igual(D,E),igual(A,B,C),dif(E,A).

poker(A,B,C,D,E):-dif(A,B),igual(B,C,D,E);
		  dif(A,C),igual(B,C,D,E);
		  dif(A,D),igual(B,C,D,E);
		  dif(A,E),igual(B,C,D,E);
		  dif(B,C),igual(A,C,D,E);
		  dif(B,D),igual(A,C,D,E);
		  dif(B,E),igual(A,C,D,E);
		  dif(C,D),igual(A,B,D,E);
		  dif(C,E),igual(E,B,D,E);
		  dif(D,E),igual(A,B,C,E).

escalera(A,B,C,D,E):-dif(A,B,C,D,E),A<B,B<C,C<D,D<E;
		     dif(A,B,C,D,E),A>B,B>C,C>D,D>E.

suma(A,B,C,D):-(B+C+D)=:=A;
	       (A+C+D)=:=B;
	       (A+B+D)=:=C;
	       (A+B+C)=:=D.

quinas(A,B,C,D,E,Sum):-igual(A,B,C,D,E),A=:=5,Sum is (A+B+C+D+E);
		       (A =\=5,B=\=5,C=\=5,D=\=5,E=\=5),Sum is 0;
		       (A =:=5,B=\=5,C=\=5,D=\=5,E=\=5),Sum is A;
		       (A =\=5,B=:=5,C=\=5,D=\=5,E=\=5),Sum is B;
		       (A =\=5,B=\=5,C=:=5,D=\=5,E=\=5),Sum is C;
		       (A =\=5,B=\=5,C=\=5,D=:=5,E=\=5),Sum is D;
		       (A =\=5,B=\=5,C=\=5,D=\=5,E=:=5),Sum is E;

		       (A =:=B),(B=:=5),dif(B,C,D,E),Sum is A+B;

		       (A =:=c),(C=:=5),dif(B,C,D,E),Sum is A+C;
		       (A =:=D),(D=:=5),dif(B,C,D,E),Sum is A+D;
		       (A =:=E),(E=:=5),dif(B,C,D,E),Sum is A+E;
		       (B =:=c),(C=:=5),dif(A,C,D,E),Sum is B+C;
		       (B =:=D),(D=:=5),dif(A,C,D,E),Sum is B+D;
		       (B =:=E),(E=:=5),dif(A,C,D,E),Sum is B+E;
		       (C =:=D),(D=:=5),dif(A,B,D,E),Sum is C+D;
		       (C =:=E),(E=:=5),dif(A,B,D,E),Sum is C+E;
		       (D =:=E),(E=:=5),dif(A,C,B,E),Sum is D+E;
		       (A =:=C),(C=:=5),dif(B,C,D,E),Sum is A+C;

		       igual(A,B,C),(C=:=5),dif(C,D,E),Sum is A+B+C;
		       igual(A,B,D),(D=:=5),dif(C,D,E),Sum is A+B+D;
		       igual(A,B,E),(E=:=5),dif(C,D,E),Sum is A+B+E;
		       igual(B,C,D),(C=:=5),dif(C,A,E),Sum is B+C+D;
		       igual(B,C,E),(C=:=5),dif(A,D,C),Sum is B+C+E;
		       igual(C,D,E),(C=:=5),dif(A,B,C),Sum is C+D+E;

		       igual(B,C,D,E),(B=:=5),dif(A,B),Sum is A+B+C+D;
		       igual(A,C,D,E),(E=:=5),dif(B,E),Sum is A+B+C+D;
		       igual(A,B,D,E),(A=:=5),dif(C,A),Sum is A+B+C+D;
		       igual(A,B,C,E),(E=:=5),dif(D,E),Sum is A+B+C+D;
		       igual(A,B,C,D),(B=:=5),dif(E,B),Sum is A+B+C+D.


			
			
