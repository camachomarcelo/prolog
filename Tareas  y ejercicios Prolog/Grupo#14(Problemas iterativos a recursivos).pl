%------------------------------------------------------------------------
% 7. sumaImpares: Predicado que lee un numero entero positivo N,
%    encontrar la suma de los primeros N numero impares.
%    ejemplo: N = 4, suma = 1 + 3 + 5 + 7.  
%------------------------------------------------------------------------
% Solucion:

sumaImpares(0,0).
sumaImpares(N,Suma):-N1 is N-1,sumaImpares(N1,Suma1),Suma is Suma1+2*N-1.

%------------------------------------------------------------------------
% 8. factorial: Predicado que lee un numero entero positivo N 
%    y encuentra el factorial del entero positivo de N. 
%------------------------------------------------------------------------
% Solucion:

factorial(0,1).
factorial(N, F):- N1 is n-1, factorial(N1, F1),F is N*F1.

%------------------------------------------------------------------------
% 9. combi: Predicado que lee un numero entero positivo N y encuentra
%    el numero combinatorio de N elementos tomados de R en R. 
%------------------------------------------------------------------------
% Solucion:

combi(N, N, 1):- !.
combi(_, 0, 1):- !.
combi(N, R, CB):- N1 is N-1, R1 is R-1, combi(N1, R,CB1),
					combi(N1, R1, CB2), CB is CB1+CB2.

%------------------------------------------------------------------------
% 10. sumaCoef: Predicado que lee un numero entero positivo N y encuentra
%     la suma de los coeficientes binomiales. 
%------------------------------------------------------------------------
% Solucion:


 
%------------------------------------------------------------------------
% 11. sumaPot: Predicado que encuentra la sumatoria de potencias de X a N.  
%------------------------------------------------------------------------
% Solucion:


%------------------------------------------------------------------------
% 12. mostrarTabla: Predicado que lee un numero entero positivo N, 
%     muestra la tabla de multiplicar desde 1 hasta N. 
%     ejemplo:
%		1x1=1
%		1x2=2
%		.....
%		1xn=n
%		.....
%		nxn=2n
%------------------------------------------------------------------------
% Solucion:



%------------------------------------------------------------------------
% 13. mostrarFactores: Predicado que lee un numero entero positivo N,
%     y muestra pares de factores que multiplicados se igual a N.
%     ejemplo: N = 12 
%			1 X 12 = 12
%			2 X 6  = 12
%			3 x 4  = 12
%------------------------------------------------------------------------
%Solucion:



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------
% suma: Predicado que suma los primeros n numeros.
%------------------------------------------------------------------------
% Solucion:

suma(N,Suma):- ciclo(N,1,Suma).
ciclo(N,I,0):- I>N, !.
ciclo(N,I,Sum):- I1 is I+1,
				ciclo(N,I1,Suma1),
				Sum is Suma1+I.

%------------------------------------------------------------------------
% Pitagoras: Predicado que le un entero N, y encuentra los valores 
% enteros a, b y c menores iguales a n tales que se verifique el 
% teorema de pitagoras.
%------------------------------------------------------------------------
% Solucion:

Pitagoras(N):- cicloA(N,1).

cicloA(N,A):- A > N, !.
cicloA(N,A):- cicloB(N,A,1), A1 is A+1, cicloA(N,A1).

cicloB(N,A,B):- B > N, !.
cicloB(N,A,B):- cicloC(N,A,B,1), B1 is B+1, cicloB(N,A,B1).

cicloC(N,A,B,C):- C > N, !.
cicloC(N,A,B,C):- A*A + B*B =:= C*C, write(A,B,C),nl,
				C1 is C + 1, cicloC(N,A,B,C1), !.

cicloC(N,A,B,C):- C1 is C+1, cicloC(N,A,B,C1).
