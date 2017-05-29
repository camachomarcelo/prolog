
comenzar:- read(N),
	   ciclo1(N,1).
ciclo1(N,I):- I>N,!.
ciclo1(N,I):- (N mod I)=:= 0,
		write(I),nl,
		I1 is I+1,
		ciclo1(N,I1),!.
ciclo1(N,I):- I1 is I+1,
		ciclo1(N,I1).
		
comenzar2:- read(N),
			read(M),
			comunes(N,M,1).
comunes(N,M,I):- I>N,! ; I>M,!.		
comunes(N,M,I):- (N mod I)=:=0 , (M mod I)=:=0,	
				write(I),nl,
				  I1 is I+1,
				  comunes(M,N,I1),!.
comunes(N,M,I):- I1 is I+1,
		comunes(N,M,I1).	
comenzarPrimo:- write('valor de N ') ,
		read(N),
		primo(N).

primo(N):- primoR(N,2).
primoR(N,I):- I> (N // 2), write('es primo '),!.
primoR(N,I):- N mod I =\= 0,write('No es primo'),!.
primoR(N,I):- I1 is I+1,
		primoR(N,I1).		


mostrarPrimos:-write('Introdusca N:')
				,read(N),
				mostrarP(N,1).
mostrarP(N,I):-I>N,!.
mostrarP(N,I):-primo(I),
		write(I),nl,
		I1 is I+1,
	        mostrarP(N,I1).
mostrarP(N,I):-I1 is I+1,
		mostrarP(N,I1).		