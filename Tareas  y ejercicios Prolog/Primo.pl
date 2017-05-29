esDiv(N,I):-  N mod I =:=0.

primo( N ):- primoR(N,2).

primoR( N, I ):- I > N // 2,!.

primoR( N, I ):- not( esDiv( N, I ) ),
	I1 is I + 1,
	primoR( N, I1 ).

mostrar(N):- write(N),write(', ').

comenzar:- write('Digite un entero N: '),
	read(N),
	primos(N,1,1).

primos( N, I, J ):- I > N,!.

primos( N, I, J ):- primo(J),
	I1 is I+1,
	J1 is J +1,
	mostrar(J),
	primos(N,I1,J1),!.

primos(N,I,J):-J1 is J+1,
	primos(N,I,J1).