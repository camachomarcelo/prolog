potencia(B,0,1):-!.

potencia(B,1,B):-!.

potencia(B,E,N):-E1 is E-1,
	potencia(B, E1,N1),
	N is B*N1,!.

