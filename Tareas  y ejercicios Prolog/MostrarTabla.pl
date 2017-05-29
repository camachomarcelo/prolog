mostrar(I,J,M):-nl,write(I), write(' x '), write(J),write(' = '),
	write(M).

comenzar:-write('Digite un entero N: '),
	read(N),
	mostrartabla(N,1).

mostrartabla(N,I):- I > N,!.

mostrartabla(N,I):- cicloJ(N,I,1),
	I1 is I+1,nl,
	mostrartabla(N,I1).

cicloJ(N,I,J):- J > N,!.

cicloJ(N,I,J):- M is I*J,
	mostrar(I,J,M),
	J1 is J +1,
	cicloJ(N,I,J1).