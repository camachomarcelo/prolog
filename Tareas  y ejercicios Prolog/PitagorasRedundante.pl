
mostrar( A, B, C ):- nl,
	write('A: '),write(A),
	write('B: '),write(B),
	write('C: '),write(C),nl.

pitagoras( A, B, C ):- C*C =:= B*B + A*A,!.

comenzar:- write('Digite un entero: '),
	read(N),
	mostrarPitag(N).

mostrarPitag( N ):- A is 1,
	cicloA( N, A ).

cicloA( N, A ):- A > N,!.

cicloA( N, A ):- B is 1,
	cicloB( N, A, B ),
	A1 is A + 1,
	cicloA( N, A1 ).

cicloB( N, A, B ):- B > N,!.

cicloB( N, A, B ):- C is 1,
	cicloC( N, A, B, C ),
	B1 is B + 1,
	cicloB( N, A, B1 ).

cicloC( N, A, B, C ):- C > N,!.

cicloC( N, A, B, C ):- pitagoras( A, B, C ),
	mostrar( A, B, C ),
	C1 is C + 1,
	cicloC( N, A, B, C1 ),!.

cicloC( N, A, B, C ):- C1 is C+1,
	cicloC( N, A, B, C1 ).