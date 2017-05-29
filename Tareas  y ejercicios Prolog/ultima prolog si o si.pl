seencuentra([X|_],X):-!.
seencuentra([_|L],X):-seencuentra(L,X).

iguales([_]):-!.
iguales([X|L]):-seencuentra(L,X),iguales(L).

diferentes([_]):-!.
diferentes([X|L]):-not(seencuentra(L,X)),diferentes(L).

estantodos([],_):-!.
estantodos([X|L1],L2):-seencuentra(L2,X),estantodos(L1,L2).

mismos(L1,L2):-estantodos(L1,L2),estantodos(L2,L1).

frecuencia([],_,0):-!.
frecuencia([X|L],X,S):-frecuencia(L,X,S1),S is S1+1,!.
frecuencia([_|L],X,S):-frecuencia(L,X,S),!.

cantDig([],0):-!.
cantDig([X|L],S):-frecuencia([X|L],X,Z),Z=:=1,cantDig(L,S1),S is S1+1,!.
cantDig([_|L],S):-cantDig(L,S),!.

eliminarRep([],[]):-!.
eliminarRep([X|L1],[X|L2]):-frecuencia([X|L1],X,Z),Z=:=1,eliminarRep(L1,L2).
eliminarRep([_|L1],L2):-eliminarRep(L1,L2),!.

existeKveces([_],K):-K=:=1,!.
existeKveces([X|L],K):-frecuencia([X|L],X,Z),K=:=Z,!.
existeKveces([_|L],K):-existeKveces(L,K),!.

cantEle([],0):-!.
cantEle([_|L],S):-cantEle(L,S1),S is S1+1,!.

poker(L):-not(iguales(L)),cantEle(L,S),K is S-1,existeKveces(L,K),!.

menor(A,B,A):-A<B,!.
menor(_,B,B):-!.
menor([X],X):-!.
menor([X|L],M):-menor(L,M1),menor(X,M1,M).

primo(N):-primo(N,2).
primo(N,I):-I>N//2,!.
primo(N,I):-N mod I =\=0,I1 is I+1,primo(N,I1).
primo(A,B,[]):-A>B,!.
primo(A,B,[A|L]):-primo(A),A1 is A+1,primo(A1,B,L),!.
primo(A,B,L):-A1 is A+1, primo(A1,B,L),!.

concatenar([],L,L).
concatenar([X|L1],L2,[X|L]):-concatenar(L1,L2,L).

%verifica si el elemento X pertenece a la lista L1
pertenece(X,L1):- concatenar(_,[X|_],L1),!.

%elimina el ultimo elemento de la lista L1 y lo muestra en L2
eliminar(L1,L2):-concatenar(L2,[_],L1),!.  

%insertar el primero en la ultima posicion
rotaizq([X|L1],L2):-concatenar(L1,[X],L2).

%verifica si el elemento X esta atras del elemento Y
verifprox(X,Y,L):- concatenar(_,[Y,X|_],L),!.

%verificar si en elemento es el ultimo de la lista
verifult(X,L):- concatenar(_,[X],L),!.

%eliminar los 3 ultimos elementos de la lista
elim3ult(L1,L2):- concatenar(L2,[_,_,_],L1).


insertarlugar([],X,[X]).
insertarlugar([Y|L1],X,[X,Y|L1]):-X<Y.
insertarlugar([Y|L1],X,[Y|L2]):-insertarlugar(L1,X,L2).

ordenar([],[]).
ordenar([X|L1],L2):-ordenar(L1,L3),insertarlugar(L3,X,L2),!.

% #8) ------------------------------+
% Intercalar los datos de la Lista  |
% ----------------------------------+

 intercalar([],L2,L2):-!.
 intercalar(L1,[],L1):-!.
 intercalar([X,L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).



% #9) ----------------------------------------+
% Mezcla los datos de la lista ordenadamente  |
% --------------------------------------------+

 mezcla([],L2,L2):-!.
 mezcla(L1,[],L1):-!.
 mezcla([X|L1],[Y|L2],[X|L3]):- X<Y,mezcla(L1,[Y|L2],L3).
 mezcla([X|L1],[Y|L2],[Y|L3]):- mezcla([X|L1],L2,L3).



% #10) -----------------------------------------+
% Ordenar los datos de la Lista por QuickSort  |
% ---------------------------------------------+
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).
 
 separar([],[],[],_).
 separar([Y|L1],[Y|Lme],Lmy,X):-Y<X,!,separar(L1,Lme,Lmy,X).
 separar([Y|L1],Lme,[Y|Lmy],X):-separar(L1,Lme,Lmy,X).


 quicksort([],[]).
 quicksort([X|L1],L2):-separar(L1,Lme,Lmy,X),
			quicksort(Lme,Lmeor),
			quicksort(Lmy,Lmyor),
			concatenar(Lmeor,[X|Lmyor],L2).