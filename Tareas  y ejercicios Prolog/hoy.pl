menor(A,B,Me):- A > B, Me is B,!.
menor(A,B,Me):-	B > A, Me is A,!.

mayor(A,B,My):- A<B,  My is B,!.
mayor(A,B,My):-B<A, My is A,!.


seencuentra([X|_],X).
 
seencuentra([_|L1],X):-seencuentra(L1,X).
%%%%%% 4 %%%%%%%%
%%subConj(L1, L2) : Predicado que es True, si todos los elementos de L1 se encuentra en L2.

subConj([X|_],[Y|_]) :-X=:=Y.
subConj([X|L1],[Y|L2]):-seencuentra(L2,X),subconj(L1,L2).
%%%%  5  %%%

cantidad([],0).
cantidad([_|L1],Q):-cantidad(L1,Q1),Q is Q1+1.

%%%%%   8 %%%%
ordenado(L1):-ordenadoA(L1);ordenadoD(L1).
ordenadoA([X]):-!.
ordenadoA([X,Y|L1]):-X=<Y,ordenadoA([Y|L1]).
ordenadoD([X]):-!.
ordenadoD([X,Y|L1]):-X>=Y,ordenadoD([Y|L1]).

%%%   9  %%%
frecuencia([],_,0).
frecuencia([X],X,1).
frecuencia([X|L1],X,F):-frecuencia(L1,X,F1),F is F1+1.
frecuencia([_|L1],X,F):-frecuencia(L1,X,F).
%%%% 10 %%%
iguales([_]).
iguales([X,X|L1]):-iguales([X|L1]).

%%%%% 11 %%%
diferentes([X]):-.
diferentes([X,Y]):- X-=\=Y.
diferentes([X,Y|L1]):- diferentes(L1),X=\=Y.


%%%%  12 %%%%
par(X):-X mod 2=:= 0 .
sumaPares([X],Sum):-par(X),Sum is X.
sumaPares([X],Sum):-not(par(X)),Sum is 0.
sumaPares([X|L1],Sum):-sumaPares(L1,S1),
                       par(X),Sum is S1+X,!.

sumaPares([X|L1],Sum):-sumaPares(L1,S1),
                       Sum is S1.
%%%%% 13 %%%%%
puropares([X]):-X mod 2 =:=0.
puropares([X|L1]):-X mod 2 =:=0,puropares(L1).
%%% 15 %%%
%%%% 22 %%%
eliminarult([_],[]).
eliminarult([X|L1],[X|L2]):-eliminarult(L1,L2).

%%%%% 24 %%%%

eliminarIesimo([X|L1],I,[L1]):-I=:=1 .
eliminarIesimo([X|L1],I,[X|L2]):-eliminarIesimo(L1,I-1,L2).
%%%%%  25 %%%
intercalar([],L,L).
intercalar(L,[],L).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

   