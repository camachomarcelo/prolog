
comenzar:- I is 1,
	write('Digite un entero N: '),
	read( N ),
	suma(N,I,Sum),
	write('La suma de los primeros '), write(N), write(' entero es '),	
	write( Sum ).

suma( N, I, 0 ):- I > N,!.

suma( N, I, Sum ):- I1 is I + 1,
	suma( N, I1, Sum1 ),
	Sum is I + Sum1,!.	

