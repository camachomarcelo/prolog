%Predicados de ayuda:

%2.-	Encontrar:
% 	La suma de los primeros n impares.

comenzar:- I is 1,
	write('Cuantos impares desea sumar: '),
	read(N),
	sumaImparesR(N,I,Sum),
	write(Sum),!.

sumaImparesR( N, I, 0):- I > N,!.

sumaImparesR( N, I, Sum ):- I1 is I + 1,
	sumaImparesR( N, I1, Sum1 ),
	Sum is (I*2-1) + Sum1,!.