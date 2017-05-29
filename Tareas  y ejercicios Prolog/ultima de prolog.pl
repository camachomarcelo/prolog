hombre(juan).
hombre(pedro).
hombre(lucas).
hombre(mario).

mujer(juana).
mujer(ana).
mujer(maribel).
mujer(julia).

matri(mario,julia).
matri(lucas,maribel).

madre(maribel,sacarias).
madre(maribel,alfonso).

padre(X,Y):-madre(Z,Y),matrimonio(X,Z).

hermanos(X,Y):-madre(Z,X),madre(Z,Y).

hermano(X,Y):-hombre(X),hermanos(X,Y).

hermanas(X,Y):-madre(Z,X),madre(Z,Y).

hermana(X,Y):-mujer(X),hermanas(X,Y).

abuela(X,Y):-madre(Z,Y),madre(X,Z);
             padre(Z,Y),madre(X,Z).

descendiente(X,Y):-madre(Y,X);padre(Y,X).

descendiente(X,Y):-madre(Z,X),descendiente(Z,Y);
                   padre(Z,X),descendiente(Z,Y).

primoshermanos(X,Y):-madre(Z,X),madre(Q,Y),hermanos(Z,Q);
                    madre(Z,X),padre(Q,Y),hermanos(Z,Q);
                    padre(Z,X),madre(Q,Y),hermanos(Z,Q);
                    padre(Z,X),padre(Q,Y),hermanos(Z,Q).

soltero(X):-hombre(X),not(matrimonio(X,_)).

sinhijos(X,Y):-not(padre(X,_)),not(madre(Y,_)).

matrisinhijos(X,Y):-matrimonio(X,Y),sinhijos(X,Y).


suma(N,Sum):-suma(N,0,Sum).
suma(N,I,0):-I>=N,!.
suma(N,I,Sum):-I1 is I+1,suma(N,I1,Sum1),Sum is Sum1+I1.

sumaPar(N,Sum):-sumaPar(N,0,Sum).
sumaPar(N,I,0):-I>=N,!.
sumaPar(N,I,Sum):-I1 is I+1,sumaPar(N,I1,Sum1),Sum is Sum1+(I1*2).

sumaP(N,Sum):-suma(N,X),Sum is X*2.

factorial(N,Fac):-factorial(N,1,Fac).
factorial(N,I,1):-I>=N,!.
factorial(N,I,Fac):-I1 is I+1, factorial(N,I1,Fac1),Fac is Fac1 *I1.

combi(N,R,Com):-factorial(N,X),factorial(R,Y),factorial((N-R),Z),Com is (X//(Y*Z)).

potencia(X,N,Pot):-potencia(X,N,0,Pot).
potencia(_,N,I,1):-I>=N,!.
potencia(X,N,I,Pot):-I1 is I+1,potencia(X,N,I1,Pot1),Pot is X*Pot1.

sumapot(X,N,Sum):-sumapot(X,N,0,Sum).
sumapot(_,N,I,1):-I>=N,!.
sumapot(X,N,I,Sum):-I1 is I+1,sumapot(X,N,I1,Sum1),potencia(X,I1,Z),Sum is Sum1+Z.

factores(N):-write('1'),write('x'),write(N),write('='),write(N),nl,factores(N,2).
factores(N,I):-I>N//I,!.
factores(N,I):-A is N//I,factores(N,I,A),I1 is I+1,factores(N,I1),!.
factores(N,I,A):-A>N//I,!.
factores(N,I,A):-I*A=:=N,write(I),write('x'),write(A),write('='),write(N),nl,A1 is A+1,factores(N,I,A1).
factores(N,I,A):-A1 is A+1,factores(N,I,A1),!.


mostrartabla(N):-mostrartabla(N,1).
mostrartabla(N,I):-I>N,!.
mostrartabla(N,I):-mostrartabla(N,I,1), I1 is I+1, mostrartabla(N,I1).
mostrartabla(N,_,A):-A>N,!.
mostrartabla(N,I,A):-write(I),write('x'),write(A),write('='),Z is I*A, write(Z),nl,A1 is A+1,mostrartabla(N,I,A1).

concatenar([],L,L):-!.
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

insertarUl([],X,[X]):-!.
insertarUl([Y|L1],X,[Y|L2]):-insertarUl(L1,X,L2).

insertarLugar([],X,[X]).
insertarLugar([Y|L1],X,[X,Y|L1]):-X<Y,!.
insertarLugar([Y|L1],X,[Y|L2]):-insertarLugar(L1,X,L2).

ordenar([],[]).
ordenar([X|L1],L2):-ordenar(L1,L3),insertarLugar(L3,X,L2).

