ejercicio1:-read(N),
	    sumaEnteros(N, Sum),
	    write('N = '), write(Sum), nl.
sumaEnteros(N, Sum):-sumaEnteros(N, 0, Sum).
sumaEnteros(N, I, 0):-I >= N, !.
sumaEnteros(N, I, Sum):- I1 is I + 1,
			 sumaEnteros(N, I1, Sum1),
			 Sum is Sum1 + I1.


ejercicio2:-read(N),
	    sumaPares(N, Sum),
	    write('N = '), write(Sum), nl.
sumaPares(N, Sum):-sumaPares(N, 0, Sum).
sumaPares(N, I, 0):-I >= N, !.
sumaPares(N, I, Sum):-I1 is I + 1,
		      sumaPares(N, I1, Sum1),
		      Sum is Sum1 + (I1 * 2).	 


ejercicio3:-read(N),
	    sumaImpares(N, Sum),
	    write('N = '), write(Sum), nl.
sumaImpares(N, Sum):-sumaImpares(N, 0, Sum).
sumaImpares(N, I, 0):-I >= N, !.
sumaImpares(N, I, Sum):-I1 is I + 1,
			sumaImpares(N, I1, Sum1),
			Sum is (Sum1 + (I1 * 2)) - 1.

ejercicio4:-read(N),
	    factorial(N, F),
	    write('Factorial = '), write(F), nl.
factorial(N, F):-factorial(N, 1, F).
factorial(N, I, 1):-I>=N, !.
factorial(N, I, F):-I1 is I + 1,
		    factorial(N, I1, F1),
		    F is F1 * I1.


ejercicio5:-read(N),
	    read(R),
	    combi(N, R, NR),
	    write('Combinatoria = '), write(NR), nl.
combi(N, R, NR):-factorial(N, X),
		 factorial(R, Y),
		 factorial((N - R), Z),
	         NR is (X//(Y * Z)).


ejercicio6:-read(N),
	    sumaCoef(N, Sum),
	    write('Suma de Coeficientes Binomiales es: '), write(Sum), nl.
sumaCoef(N, Sum):-sumaCoef(N, 0, Sum).
sumaCoef(N, I, 1):-I >= N, !.
sumaCoef(N, I, Sum):-I1 is I + 1,
		     sumaCoef(N, I1, Sum1),
		     combi(N, I1, X),
		     Sum is Sum1 + X.


ejercicio7:-read(X),
	    read(N),
	    potencia(X, N, Pot),
	    write('Potencia = '), write(Pot), nl.
potencia(X, N, Pot):-potencia(X, N, 0, Pot).
potencia(X, N, I, 1):-I >= N, !.
potencia(X, N, I, Pot):-I1 is I + 1,
			potencia(X, N, I1, Pot1),
			Pot is X * Pot1.

ejercicio8:-read(N),
	    sumaPotencia(N, SumPot),
	    write('La Suma de Potencias es = '), write(SumPot),nl.
sumaPotencia(N, SumPot):- sumaPotencia(N, -1, SumPot).
sumaPotencia(N, I, 0):-I>=N, !.
sumaPotencia(N, I, SumPot):-I1 is I + 1,
			    sumaPotencia(N, I1, SumPot1),
			    potencia(N, I1, X),
			    SumPot is SumPot1 + X.

ejercicio9:-read(N),
	    mostrarTabla(N).

mostrarTabla(N):-mostrarTablaI(N, 1).
mostrarTablaI(N, I):-I > N, !.
mostrarTablaI(N, I):-mostrarTablaJ(N, I, 1),
		     I1 is I + 1,
		     mostrarTablaI(N, I1).

mostrarTablaJ(N, I, J):-J > N, !.
mostrarTablaJ(N, I, J):-I * J =:= N,
		       mostrar(I,J,N),
		       J1 is J + 1,
		       mostrarTablaJ(N, I, J1).

mostrarTablaJ(N, I, J):-J1 is J + 1,
		        mostrarTablaJ(N, I, J1).

mostrar(I, J, N):-write(I), 
		  write(' * '), 
		  write(J), 
		  write(' = '), 
		  write(N), nl.	

ejercicio10:-read(N),
	     mostrarFactores(N).

mostrarFactores(N):-mostrarFactoresI(N, 1).

mostrarFactoresI(N, I):-I > N, !.
mostrarFactoresI(N, I):-mostrarFactoresJ(N, I, 1),
			I1 is I + 1,
			mostrarFactoresI(N, I1).

mostrarFactoresJ(N, I, J):-J > N, !.
mostrarFactoresJ(N, I, J):-I * J =:= N,
			   mostrarF(I, J, N),
			   J1 is J + 1,
			   mostrarFactoresJ(N, I, J1).
mostrarFactoresJ(N, I, J):-J1 is J + 1,
			   mostrarFactoresJ(N, I, J1).

mostrarF(I, J, N):-write(I),
		   write(' * '),
		   write(J),
		   write(' = '), 
		   write(N), nl.

ejercicio11:-read(N),
	     sumaInter(N, Sum),
	     write('Total = '), write(Sum), nl.
sumaInter(N, Sum):-sumaInter(N, 0, Sum).
sumaInter(N, I, 0):-I >= N, !.
sumaInter(N, I, Sum):-I1 is I + 1,
		      sumaInter(N, I1, Sum1),
		      potencia(-1, I1, X),
		      Sum is Sum1 + X * I1.

ejercicio12:-read(N),
	     sumaGeom(N, Sum),
	     write('Total = '), write(Sum), nl.
sumaGeom(N, Sum):-sumaGeom(N, -1, Sum).
sumaGeom(N, I, 0):-I >= N, !.
sumaGeom(N, I, Sum):-I1 is I + 1,
		     sumaGeom(N, I1, Sum1),
		     potencia(2, I1, X),
		     Sum is Sum1 + 1/X. 

ejercicio13:-read(N),
	     sumaArmonica(N, Sum),
	     write('Total = '), write(Sum), nl.
sumaArmonica(N, Sum):-sumaArmonica(N, 0, Sum).
sumaArmonica(N, I, 0):-I >= N, !.
sumaArmonica(N, I, Sum):-I1 is I + 1,
			 sumaArmonica(N, I1, Sum1),
			 Sum is Sum1 + 1/I1.

ejercicio14:-read(N),
	     sumaAlterna(N, Sum),
	     write('Total = '), write(Sum), nl.
sumaAlterna(N, Sum):-sumaAlterna(N, 0, Sum).
sumaAlterna(N, I, 0):-I >= N, !.
sumaAlterna(N, I, Sum):-I1 is I + 1,
			sumaAlterna(N, I1, Sum1),
			Y is I1 + 1,
			potencia(-1, Y, X),
			Sum is Sum1 + X/I1.

ejercicio15:-read(N),
	     sumaCuadrados(N, Sum),
	     write('Total = '), write(Sum), nl.
sumaCuadrados(N, Sum):-sumaCuadrados(N, 0, Sum).
sumaCuadrados(N, I, 0):-I >= N, !.
sumaCuadrados(N, I, Sum):-I1 is I + 1,
			  sumaCuadrados(N, I1, Sum1),
			  Sum is Sum1 + I1 * I1.

ejercicio16:-read(N),
	     sumaEscalada(N, Sum),
	     write('Total = '), write(Sum), nl.

sumaEscalada(N, Sum):-sumaEscalada(N, 0, Sum).
sumaEscalada(N, I, 0):- I >= N, !.
sumaEscalada(N, I, Sum):-I1 is I + 1,
			 sumaEscalada(N, I1, Sum1),
			 sumaEnteros(I1, X),
			 Sum is Sum1 + X.

ejercicio17:-read(N),
	     sumaPiCuartos(N, Sum),
	     write('Pi/4 = '), write(Sum), nl.

sumaPiCuartos(N, Sum):-sumaPiCuartos(N, 0, Sum).
sumaPiCuartos(N, I, 0):-I >= N, !.
sumaPiCuartos(N, I, Sum):-I1 is I + 1,
			  sumaPiCuartos(N, I1, Sum1),
			  E is I1 + 1,
			  potencia(-1, E, X),
			  Sum is Sum1 + X /(2*I1 - 1).
ejercicio18:-read(N),
	     sumaProd(N, Sum),
	     write('Suma = '), write(Sum), nl.

sumaProd(N, Sum):-sumaProd(N, 0, Sum).
sumaProd(N, I, 0):-I >= N, !.
sumaProd(N, I, Sum):-I1 is I + 1,
		     sumaProd(N, I1, Sum1),
		     sumaProdJ(N, I1, Sum2),
		     Sum is Sum1 + Sum2.

sumaProdJ(N, I, Sum2):-J is I - 1,
		       sumaProdJ(N, I, J, Sum2).
sumaProdJ(N, I, J, 0):-J >= N, !.
sumaProdJ(N, I, J, Sum2):-J1 is J + 1,
			  sumaProdJ(N, I, J1, Sum3),
			  Sum2 is Sum3 + I*J1.


ejercicio19:-read(X),
	     read(N),
	     sumaExpon(X, N, Sum),
	     write('e^x = '), write(Sum), nl.

sumaExpon(X, N, Sum):-sumaExpon(X, N, -1, Sum).
sumaExpon(X, N, I, 0):- I >= N, !.
sumaExpon(X, N, I, Sum):-I1 is I + 1,
			 sumaExpon(X, N, I1, Sum1),
			 potencia(X, I1, P1),
			 factorial(I1, F),
			 Sum is Sum1 + P1/F. 

ejercicio20:-read(X),
	     read(N),
	     sumaSeno(X, N, Sum),
	     write('SEN('), write(X), write(') = '), write(Sum), nl.
sumaSeno(X, N, Sum):-sumaSeno(X, N, -1, Sum).
sumaSeno(X, N, I, 0):-I >= N, !.
sumaSeno(X, N, I, Sum):-I1 is I + 1,
			sumaSeno(X, N, I1, Sum1),
			D is 2*I1 + 1,
			potencia(-1, I1, A),
			potencia(X, D, B),
			factorial(D, F),
			Sum is Sum1 + (A*B)/F.

ejercicio21:-read(X),
	     read(N),
	     sumaCos(X, N, Sum),
	     write('COS('), write(X), write(') = '), write(Sum), nl.
sumaCos(X, N, Sum):-sumaCos(X, N, -1, Sum).
sumaCos(X, N, I, 0):-I >= N, !.
sumaCos(X, N, I, Sum):-I1 is I + 1,
			sumaCos(X, N, I1, Sum1),
			D is 2*I1,
			potencia(-1, I1, A),
			potencia(X, D, B),
			factorial(D, F),
			Sum is Sum1 + (A*B)/F.