% #1)-----------------------------------------------------

ultdig(N,Dig):- Dig is N mod 10.

% #2)-----------------------------------------------------

primerdig(N,N):- N<10,!.
primerdig(N,Dig):- N1 is N//10,
		    primerdig(N1,Dig).

% #3)-----------------------------------------------------

restoNum(N,M):-M is N//10.

% #4)-----------------------------------------------------

seencuentra(N,Dig):-N<10,!,N=:=Dig.
seencuentra(N,Dig):-D1 is N mod 10,D1=:=Dig,!.
seencuentra(N,Dig):-N1 is N//10,seencuentra(N1,Dig).

estantodos(N,M):-N<10,!,seencuentra(M,N).
estantodos(N,M):-D is N mod 10,
		 seencuentra(M,D),
		 N1 is N//10,
		 estantodos(N1,M).

mismosDig(N,M):-estantodos(N,M),estantodos(M,N).

% #5)-----------------------------------------------------

mayorDig(N,My):-N<10,!,My is N.

mayorDig(N,My):-N1 is N//10,
		mayorDig(N1,My1),
		N mod 10 >My1,
		My is N mod 10.
		
mayorDig(N,My):-N1 is N//10,
		mayorDig(N1,My).


% #6)-----------------------------------------------------

menorDig(N,Me):-N<10,!,Me is N.

menorDig(N,Me):-N1 is N//10,
		menorDig(N1,Me1),
		N mod 10 <Me1,
		Me is N mod 10.
		
menorDig(N,Me):-N1 is N//10,
		menorDig(N1,Me).

% #7)-----------------------------------------------------

digitosIguales(N):- N<10,!.

digitosIguales(N):- N1 is N//10,
	      	    digitosIguales(N1),
	            N mod 10=:=(N//10) mod 10.

% #8)-----------------------------------------------------

digitosOrdenados(N):- N<10,!.

digitosOrdenados(N):- N1 is N//10,
		      digitosOrdenados(N1),
		      N mod 10>( N//10 mod 10).



% #9)------------------------------------------------------

digitosPares(N):-N<10,N mod 2=:=0,!.

digitosPares(N):-N1 is N//10,
	         digitosPares(N1),
	    	 N mod 2=:=0.

% #10)------------------------------------------------------

digitosImpares(N):- N<10,N mod 2=\=0,!.
digitosImpares(N):- N1 is N//10,
	    	    digitosImpares(N1),
	    	    N mod 2=\=0.
 
digitosParImpar(N):-not(digitosPares(N)),not(digitosImpares(N)).

% #11)---------------------------------------------------------

frecuencia(N,Dig,0):- N<10,N=\=Dig,!.
frecuencia(N,Dig,1):- N<10,N=:=Dig,!.

frecuencia(N,Dig,Q):- N1 is N//10, 
		      frecuencia(N1,Dig,Q1),
		      N mod 10=:=Dig,	
		      Q is Q1+1.
 
frecuencia(N,Dig,Q):-N1 is N//10, 
		     frecuencia(N1,Dig,Q).


digitosDif(N):- N<10,!.
digitosDif(N):- N1 is N//10,
	        digitosDif(N1),
       	        D is N mod 10,
	        frecuencia(N,D,1).


% #12)---------------------------------------------------------

menorDif(N,R):-mayorDig(N,My),
	       menorDig(N,Me),
	       R is Me-My.

% #13)---------------------------------------------------------

digitosComunes(N,M):-M<10,!,seencuentra(N,M).

digitosComunes(N,M):-M1 is M//10,
		    digitosComunes(N,M1).

% #15)---------------------------------------------------------

mayorFrec(N,My):-N<10,!,My is N.

mayorFrec(N,My):-N1 is N//10,
		 mayorFrec(N1,My1),
		 D is N mod 10,frecuencia(N,D,F),
		 F>My1,My is D.

mayorFrec(N,My):-N1 is N//10,
		 mayorFrec(N1,My).

% #16)---------------------------------------------------------

frecIguales(N,1):-N<10,!.

frecIguales(N,K):-N1 is N//10,
		  frecIguales(N1,K),
		  D is N mod 10,
		  frecuencia(N,D,F),F=:=k.
	

		

