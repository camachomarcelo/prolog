%Predicados de ayuda:
esDiv( N, I ):- N mod I =:= 0.

mostrar(N):-write(N),write(', ').

%3.-	Encontrar:
% 	La suma de los divisores de n.

comenzar:- I is 1,
	write('Digite un entero: '),
	read(N),
	sumaDiv(N,I,Sum),nl,
	write('Suma de sus divisores: '),
	write(Sum).

sumaDiv( N, I, 0 ):- I > N,!.

sumaDiv( N, I, Sum ):- esDiv( N, I ),
	I1 is I + 1,
	mostrar(I),
	sumaDiv(N,I1,Sum1),
	Sum is I + Sum1,!.

sumaDiv( N, I, Sum ):-  I1 is I + 1,
	sumaDiv( N, I1, Sum).

