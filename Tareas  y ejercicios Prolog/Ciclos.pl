sumaEnteros(0,0):-!.
sumaEnteros(N,X):- N > 0,
				   N1 is (N-1),
				   sumaEnteros(N1,X1),
				   X is (X1 + N).

sumaPares(0,0):-!.
sumaPares(N,X):- N > 0,
				   N1 is (N-1),
				   sumaPares(N1,X1),
				   X is (X1 + (2 * N)).

sumaImpares(0,0):-!.
sumaImpares(N,X):- N > 0,
				   N1 is (N-1),
				   sumaImpares(N1,X1),
				   X is (X1 + (2 * N) -1).
				   
potencia(_,0,1):-!.
potencia(X,N,P):-	(N mod 2) =:= 0,
					N1 is (N // 2),
					potencia(X,N1, Pot1),
					P is (Pot1 * Pot1).
potencia(X,N,P):- 	(N mod 2) =:= 1,
					N1 is (N-1),
					potencia(X,N1,Pot1),
					P is (X * Pot1).
					
sumaPot(_,0,Sum):- Sum is 1,!.
sumaPot(X,N,Sum):-	N > 0, 
					potencia(X,N,PotX_N),
					N1 is (N-1),
					sumaPot(X,N1,Sum1),
					Sum is (PotX_N + Sum1).
					
