%Predicados de ayuda:
esPar( N ):- N mod 2 =:= 0.

%1.-	Encontrar:
% 	La suma de los primeros n pares.

comenzar:- I is 1,
	write('Cuantos pares desea sumar: '),
	read(N),
	sumaParesR(N,I,Sum),
	write(Sum),!.

sumaParesR( N, I, 0):- I > N,!.

sumaParesR( N, I, Sum ):- I1 is I + 1,
	sumaParesR( N, I1, Sum1 ),
	Sum is I*2 + Sum1,!.