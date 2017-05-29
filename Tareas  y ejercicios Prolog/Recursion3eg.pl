% predicados de ayuda:
esDiv( N, I ):- N mod I =:= 0,!.

%Encontrar:
%	Sum: 1 + 2 + 3 + . . . + n

comenzar:- I is 1,
	write('Digite un entero N: ')	
	read( N ),
	suma(N,I,Sum),
	write('La suma de los primeros '), write(N), write(' es '),	
write( Sum ).

suma( N, I, 0 ):- I > N,!.

suma( N, I, Sum ):- I1 is I + 1,
	suma( N, I1, Sum1 ),
	Sum is I + Sum1,!.	

%Mostrar:
%	Los divisores de n:
%		si n = 12
%	1
%	2
%	3
%	4
%	6
%	12

comenzar:- read( N ),
	sumaDiv(N,1).

sumaDiv( N, I ):- I > N,!.

sumaDiv( N, I ):- esDiv( N, I ),
	write( I ),nl,
	I1 is I + 1,
	sumaDiv(N, I1),!.

sumaDiv( N, I ):- I1 is I + 1,
	sumaDiv( N, I1 ).

%Verificar:
%	Si un entero n es primo.
%
primo( N ):- primoR(N,2).

primoR( N, I ):- I > N // 2,!.

primoR( N, I ):- not( esDiv( N, I ) ),
	I1 is I + 1,
	primoR( N, I1 ).