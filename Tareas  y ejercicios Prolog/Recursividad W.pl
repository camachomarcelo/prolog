%====================Factorial ====================

factorial(0,1).
factorial(N,F):- N1 is N-1, factorial(N1,F1), F is N*F1.

%====================Primos====================

primos:- 
write('Introduzca N: '), 
read(N),
cicloK(N,1).

cicloK(N,K):- K>N, !.
cicloK(N,K):- primo(K), write(K), K1 is K+1, cicloK(N,K1), !.
cicloK(N,K):- K1 is K+1, cicloK(N,K1).

primo(N):- primo(N,2).
primo(N,I):- I>N//2, !.
primo(N,I):- N mod 2=\=0, I1 is I+1, primo(N,I1).



% ====================Divisores====================

divisores:- 
write('Introduzca N: '), 
read(N), 
cicloI(N,1,Sum),
write('La suma es: '),
write(Sum).

cicloI(N,I,0):- I>N, !.
cicloI(N,I,Sum):- N mod I=:=0, write(I), nl, I1 is I+1, cicloI(N,I1,Sum1), Sum is Sum1+I, !.
cicloI(N,I,Sum):- I1 is I+1, cicloI(N,I1,Sum).




