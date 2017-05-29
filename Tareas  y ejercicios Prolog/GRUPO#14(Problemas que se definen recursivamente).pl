factorial(0, 1).
factorial(N, F):- N1 is N-1, factorial(N1, F1), F is N*F1.

potencia(_, 0, 1).
potencia(N, P, R):- P1 is P-1,potencia(N, P1, R1), R is N*R1.

fibo(1,1).
fibo(2,1).
fibo(N, F):- N1 is N-1, N2 is N-2, fibo(N1, F1),
		fibo(N2, F2), F is F1+F2.

combi(N, N, 1):- !.
combi(_, 0, 1):- !.
combi(N, R, CB):- N1 is N-1, R1 is R-1, combi(N1, R,CB1),
			combi(N1, R1, CB2), CB is CB1+CB2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La serie de Lucas:							%
%									%
%	Sean L0, L1, L2,.... los numeros de Lucas donde.		%
%									%
%	i) L0=2  ,     L1=1    y					%
%									%
%	ii) Ln= Ln-1 + Ln-2, para todo entero n >= 2.			%
%									%
%	Entoces los primeros numeros de la sucesion de Lucas son:	%
%									%
%	n=0 --> L0=2		n=3 -->	L3=L2+L1=4			%
%	n=1 --> L1=1		n=4 --> L4=L3+L2=7			%
%	n=2 --> L2=L1+L2=3	N=5 --> L5=L4+L3=11 , etc.		%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lucas(0,2).
lucas(1,1).
lucas(N,L):- N1 is N-1, N2 is N-2, lucas(N1,L1),
		lucas(N2,L2), L is L1+L2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La suma de los n primeros tales como A1+A2+A3+...+An puede 		%
% representarse por una sumatoria desde i=1 hasta n donde la letra	%
% i, llamada indice de la suma, tomo sucesivamente los valores		%
% enteros positivos de 1 a n inclusive.					%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sumatoria(0,0).
sumatoria(N,S):- N1 is N-1, sumatoria(N1, S1), S is S1+N.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% El producto de los n primeros tales como A1*A2*A3*...*An puede 	%
% representarse por una productoria desde i=1 hasta n donde la letra	%
% i, llamada indice de la suma, tomo sucesivamente los valores		%
% enteros positivos de 1 a n inclusive.					%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

productoria(0,0).
productoria(N,S):- N1 is N-1, productoria(N1, S1), S is S1*N.

