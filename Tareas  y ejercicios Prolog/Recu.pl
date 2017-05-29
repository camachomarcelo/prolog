

comenzar:-
write('Introduzca N: '),
read(N),
cicloA(N,1),
nl.

cicloA(N,A):- A>N, !.
cicloA(N,A):- B is A, cicloB(N,A,B), A1 is A+1, cicloA(N,A1).

cicloB(N,A,B):- B>N, !.
cicloB(N,A,B):- C is B, cicloC(A,B,C,D), D*D =:= A*A+B*B,mostrar(A,B,C), B1 is B+1, cicloB(N,A,B1), !.
cicloB(N,A,B):- B1 is B+1, cicloB(N,A,B1).

cicloC(A,B,C,D):- C*C >= A*A+B*B, D is C, !.
cicloC(A,B,C,D):- C1 is C+1, cicloC(A,B,C1,D).
mostrar(A,B,C):- write('A: '), write(A), write(', B: '), write(B), write(', C: '), write(C), nl.



pitagoras1:-
write('Introduzca N: '),
read(N),
cicloA1(N,1),
nl.

cicloA1(N,A):- A>N, !.
cicloA1(N,A):- cicloB1(N,A,1), A1 is A+1, cicloA1(N,A1).

cicloB1(N,A,B):- B>N, !.
cicloB1(N,A,B):- cicloC1(N,A,B,1), B1 is B+1, cicloB1(N,A,B1).

cicloC1(N,A,B,C):- C>N, !.

cicloC1(N,A,B,C):- A*A+B*B < C*C,
mostrar(A,B,C),
C1 is C+1,
cicloC1(N,A,B,C1), !.

cicloC1(N,A,B,C):- C1 is C+1, cicloC1(N,A,B,C1).
















