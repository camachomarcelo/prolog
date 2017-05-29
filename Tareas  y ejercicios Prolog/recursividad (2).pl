%1. sumaPares: Predicado que lee un numero entero positivo N,
%    encontrar la suma de los primeros N numero impares.
%    ejemplo: N = 3, suma = 2 + 4 + 6 .
%------------------------------------------------------------------------
% Solucion:

sumapar(0,0).
sumapar(N,S):-	N1 is N - 1,
		sumapar(N1,S1),
		S is S1 +2*N.

sumapar(N,S):- N1 is N - 1,sumapar(N1,S).



%2. sumaImpares: Predicado que lee un numero entero positivo N,
%    encontrar la suma de los primeros N numero impares.
%    ejemplo: N = 3, suma = 1 + 3 + 5 .
%------------------------------------------------------------------------
% Solucion:

sumaimpares(0,0).
sumaimpares(N,Suma):-N1 is N-1,sumaImpares(N1,Suma1),Suma is Suma1+2*N-1.


%3. sumaDivisoresN: Predicado que lee un numero entero positivo N,
%    encontrar la suma de los primeros N numero divisores.
%    ejemplo: N = 8, suma = 2 + 2 + 2 + 1 .
%------------------------------------------------------------------------
% Solucion:

sumadivisores(0,0).
sumadivisores(N,S): -



