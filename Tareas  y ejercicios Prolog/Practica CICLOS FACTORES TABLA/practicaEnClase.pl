comenzarImpares:- read(N),
	   	cicloI(N,1).
cicloI(N,I):-I>N,!.
cicloI(N,I):-cicloJ(N,I,1),
	     I1 is I+1,
	     cicloI(N,I1).
cicloJ(N,_,J):-J>N,!.
cicloJ(N,I,J):-I mod 2 =\= 0,
	       J mod 2 =\= 0,
	       mostrar(I,J),
	       J1 is J+1,
	       cicloJ(N,I,J1),!.
cicloJ(N,I,J):- J1 is J+1,
		cicloJ(N,I,J1).
mostrar(I,J):- write(I),write(' x '),
	       write(J),write(' = '),
	       K is I*J,
	       write(K),nl. 

comenzarPares:- read(N),
	   	cicloII(N,1).
cicloII(N,I):-I>N,!.
cicloII(N,I):-cicloJJ(N,I,1),
	     I1 is I+1,
	     cicloII(N,I1).
cicloJJ(N,_,J):-J>N,!.
cicloJJ(N,I,J):-I mod 2 =:= 0,
	       J mod 2 =:= 0,
	       mostrarR(I,J),
	       J1 is J+1,
	       cicloJJ(N,I,J1),!.
cicloJJ(N,I,J):- J1 is J+1,
		cicloJJ(N,I,J1).
mostrarR(I,J):- write(I),write(' x '),
	       write(J),write(' = '),
	       K is I*J,
	       write(K),nl. 

comenzarIguales:- read(N),
	   	cicloIII(N,1).
cicloIII(N,I):-I>N,!.
cicloIII(N,I):-cicloJJJ(N,I,1),
	     I1 is I+1,
	     cicloIII(N,I1).
cicloJJJ(N,_,J):-J>N,!.
cicloJJJ(N,I,J):-I =:= J,
	       mostrarRR(I,J),
	       J1 is J+1,
	       cicloJJJ(N,I,J1),!.
cicloJJJ(N,I,J):- J1 is J+1,
		cicloJJJ(N,I,J1).
mostrarRR(I,J):- write(I),write(' x '),
	       write(J),write(' = '),
	       K is I*J,
	       write(K),nl. 


comenzarImpParImp:- read(N),
	   	cicloIIII(N,1).
cicloIIII(N,I):-I>N,!.
cicloIIII(N,I):-I mod 2 =:= 0,
	     cicloJJJJ(N,I,1),
	     I1 is I+1,
	     cicloIIII(N,I1),!.
cicloIIII(N,I):-I mod 2 =\= 0,
	     cicloJJJJK(N,I,1),
	     I1 is I+1,
	     cicloIIII(N,I1).

cicloJJJJ(N,_,J):-J>N,!.
cicloJJJJ(N,I,J):-J mod 2 =\=0,
	       mostrarRRR(I,J),
	       J1 is J+1,
	       cicloJJJJ(N,I,J1),!.
cicloJJJJ(N,I,J):- J1 is J+1,
		cicloJJJJ(N,I,J1).
cicloJJJJK(N,_,J):-J>N,!.
cicloJJJJK(N,I,J):-J mod 2 =:= 0,
	       mostrarRRR(I,J),
	       J1 is J+1,
	       cicloJJJJK(N,I,J1),!.
cicloJJJJK(N,I,J):- J1 is J+1,
		cicloJJJJK(N,I,J1).
mostrarRRR(I,J):- write(I),write(' x '),
	       write(J),write(' = '),
	       K is I*J,
	       write(K),nl. 

comenzarCrecDecr:- read(N),
	   	cicloIU(N,1).
cicloIU(N,I):-I>N,!.
cicloIU(N,I):-cicloJU(N,I,N),
	     I1 is I+1,
	     cicloIU(N,I1).
cicloJU(N,_,J):-J<1,!.
cicloJU(N,I,J):-
	       mostrarRU(I,J),
	       J1 is J-1,
	       cicloJU(N,I,J1),!.
cicloJU(N,I,J):- J1 is J-1,
		cicloJU(N,I,J1).
mostrarRU(I,J):- write(I),write(' x '),
	       write(J),write(' = '),
	       K is I*J,
	       write(K),nl. 