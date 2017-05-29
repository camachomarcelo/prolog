fact( 0, 1 ):- !.
fact( N, F ):- 
	N1 is N-1,
	fact(N1,F1),
	F is N*F1.
combi(N, R, CB):-
	NR is N-R,
	fact(N,FN),
	fact(R,FR),
	fact(NR,FNR),
	CB is FN /(FR*FNR).

comenzar:-write('Digite un entero N: '),
	read(N),
	sumacoef(N,0,Sum),
	write(Sum).

sumacoef(N,R,0):- R > N,!.

sumacoef(N,R,Sum):-
	combi(N,R,S),
	R1 is R+1,
	sumacoef(N,R1,Sum1),
	Sum is S + Sum1,!.