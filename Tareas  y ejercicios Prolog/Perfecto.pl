esDiv(N,I):- N mod I =:= 0.

comenzar:- write('Digite un entero N: '),
	read(N),
	perfecto(N).

perfecto(N):- perfectoR(N,1,Sum),
	Sum =:= N.
perfectoR( N, I, 0 ):- I >= N,!.

perfectoR( N, I, Sum ):- esDiv(N,I),
	I1 is I + 1,
	perfectoR(N,I1,Sum1),
	Sum is I + Sum1,!.

perfectoR(N,I,Sum):- I1 is I + 1,
	perfectoR(N,I1,Sum).