par(X):- X mod 2 =:= 0.

par(X,Y):- par(X), par(Y).

impar(X):- not(par(X)).

nopar(X,Y):- not(par(X,Y)).


dospares(X,Y,Z):- par(X,Y),impar(Z);
			par(X,Z), impar(Y);
			par(Y,Z),impar(X).

dospares(A,B,C,D):- par(A,B), nopar(C,D);
		    par(A,C), nopar(B,D);
		    par(A,D), nopar(B,C);
		    par(B,C) , nopar(A,D);
		    par(C,D), nopar(A,B);
		    par(B,D), nopar(A,C). 

	
dospares(A,B,C,D,E):-  dospares(A,B,C), nopar(D,E),!;
			dospares(A,B,D), nopar(C,E),!;
			dospares(A,B,E), nopar(C,D),!;
			dospares(B,C,D), nopar(A,E),!;
			dospares(B,C,E), nopar(A,D),!;
			dospares(C,D,E), nopar(A,B).

igual(X,Y):- X =:= Y.
iguales(X,Y,Z):- igual(X,Y), igual(Y,Z),!;
		 igual(X,Z), igual(Z,Y),!;
		 igual(Y,Z), igual(Z,X).

iguales(A,B,C,D):- iguales(A,B,C),igual(C,D),!;	
			iguales(A,B,D),igual(D,C),!;	
			iguales(B,C,D),igual(D,A).	
			

dif(X,Y):-not(igual(X,Y)).
dif(A,B,C,D):-dif(A,B),dif(A,C),dif(A,D),
	      dif(B,C),dif(B,D),dif(C,D).

dif(A,B,C,D,E):-dif(A,B),dif(A,C),dif(A,D),dif(A,E)
	        dif(B,C),dif(B,D),dif(B,E),
		dif(C,D),dif(C,E).

menor(X,Y,Me):-X<Y,
	       Me is X.
menor(X,Y,Me):-Y=<X,
		Me is Y.
menor(A,B,C,Me):-A<B,B<C,Me is A;
		 A>B,B<C,Me is B;
		 A>B,B>C,Me is C.		
	
menor(A,B,C,D,Me):-A<B,B<C,C<D,Me is A;
		   A>B,B<C,C<D,Me is B;
		   A<B,B>C,C<D,Me is C;
		   A>B,B>C,C>D,Me is D.

mayor(X,Y,Ma):-X>Y,
	       Ma is X.
mayor(X,Y,Ma):-Y>=X,
		Ma is Y.
mayor(A,B,C,Ma):-iguales(A,B,C), Ma is A,!;
		 A>B,A>C,Ma is A,!;
		 B>C,B>A,Ma is B,!;
		 C>B,C>A,Ma is C.		
	
mayor(A,B,C,D,Ma):-	iguales(A,B,C,D), Ma is A,!;
			A>B,A>C,A>D,Ma is A,!;
		   B>A,B>C,B>D,Ma is B,!;
		   C>A,C>B,C>D,Ma is C,!;
		   D>A,D>B,D>C,Ma is D.
		   
		   
			