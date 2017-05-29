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