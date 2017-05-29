esDiv(N,I):-  N mod I =:=0.

primo( N ):- primoR(N,2).

primoR( N, I ):- I > N // 2,!.

primoR( N, I ):- not( esDiv( N, I ) ),
	I1 is I + 1,
	primoR( N, I1 ).

comenzar:- write('Digite un numero '),
	read(N),
	mostrarPrimos(N,1).

mostrarPrimos(N,I):- I >= N,!.

mostrarPrimos(N,I):- primo(I),
	write(I),nl,
	I1 is I+1,
	mostrarPrimos(N,I1),!.
mostrarPrimos(N,I):- I1 is I+1,
	mostrarPrimos(N,I1).