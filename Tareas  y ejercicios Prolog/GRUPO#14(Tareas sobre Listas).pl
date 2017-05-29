%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%				     %
%  GRUPO # 14:			     %
%				     %
%	FERNANDO MENDOZA CHÁVEZ.     %
%	LIGIA BARRERA COPA.	     %
%	EUSTAQUIO FERNANDEZ ABALOS.  %
%				     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%(1).
%----------------------------------------------------------------------
% frecuencia(L1, X, F) : Predicado que encuentra la frecuencia del 
% elemento X en la lista L1, el resultado encuentra en F.
%----------------------------------------------------------------------
% Solucion:

frecuencia([], _, 0):- !.
frecuencia([E1],E1,1):-!.
frecuencia([E1|L1],X,F):-frecuencia(L1,X,F2), E1=:=X, F is F2 +1;
				frecuencia(L1,X,F).

%(2).
%--------------------------------------------------------------------------------
% diferentes(L1) : Predicado que es True, si todos los elementos de la lista L1 
% son diferentes.
%--------------------------------------------------------------------------------
% Solucion:

%(3).
%--------------------------------------------------------------------------------
% iguales(L1) : Predicado que es True, si todos los elementos son iguales.
%--------------------------------------------------------------------------------
% Solucion:


%(4).
%-----------------------------------------------------------------------
% dominaPar(L1) : Predicado que es True, si la cantidad de elementos 
% pares es mayor que la cantidad de elementos impares en la lista L1.
%-----------------------------------------------------------------------
% Solucion:


%(5).
%-----------------------------------------------------------------------
% sumaPares(L1, Sum) : Predicado que encuentra la suma de los elementos
% pares de la lista L1 en Sum.
%-----------------------------------------------------------------------
% Solucion:


%(6).
%-----------------------------------------------------------------------
% existeKFrec(L1, K) : Predicado que es True, si existe en la lista L1 
% algún elemento que se repite k-veces.
%-----------------------------------------------------------------------
% Solucion:


%(7).
%-----------------------------------------------------------------------
% poker(L1) : Predicado que es True, si todos los elementos de la lista 
% L1 son iguales a excepción de un elemento.
%-----------------------------------------------------------------------
% Solucion:

poker(L):- L1=L, longitud(L1,N), N1 is N-1,
	   L1=L, menor(L1,Me), L1=L, frecuencia(L1,Me,1),
	   L1=L, mayor(L1,Ma), L1=L, frecuencia(L1,Ma,N1),!.

poker(L):- L1=L, longitud(L1,N), N1 is N-1,
	   L1=L, menor(L1,Me), L1=L, frecuencia(L1,Me,N1),
	   L1=L, mayor(L1,Ma), L1=L, frecuencia(L1,Ma,1).


%(8).
%-----------------------------------------------------------------------
% escalera(L1) : Predicado que es True, si todos los elementos de la 
% lista L1 forman escalera. Los elementos de la lista L1 no necesariamente 
% están ordenados.
%-----------------------------------------------------------------------
% Solucion:

escalera(L):-bubbleSort(L,L1),escala(L1).
escala([E|L] ):-esc(L,E).
esc([],_):-!.
esc([E|L],E1):-esc(L,E),abs(E-E1)=:=1.


%(9).
%-----------------------------------------------------------------------
% escaleraK(L1, K) : Predicado que es True, si todos los elementos de la 
% lista L1 forman escalera de K en K. 
%-----------------------------------------------------------------------
% Solucion:

escaleraK(L,K):-bubbleSort(L,L1),escalaK(L1,K).
escalaK([E|L], K):-escK(L,E,K).
escK([],_,_):-!.
escK([E|L],E1,K):-escK(L,E,K),abs(E-E1)=:=K.


%__________________________METODOS AUXILIARES____________________________


%------------------------------------------------------------------------
% longitud(L, N) : Predicado que encuentra la cantidad de elementos que
% tiene la lista L. N es la cantidad de elementos de L.
%------------------------------------------------------------------------
% Solucion:

longitud([],0):-!.
longitud([_|L],N):- longitud(L,N1), N is N1+1.

%------------------------------------------------------------------------
% menor(L, M) : Predicado que encuentra el menor elemento de la lista L.
% M es el elemento menor de la lista L.
%------------------------------------------------------------------------
% Solucion:

menor([E], E):-!.
menor([E|L], M):-menor(L,M1), E<M1, M is E; menor(L,M).

%------------------------------------------------------------------------
% mayor(L, M) : Predicado que encuentra el mayor elemento de la lista L.
% M es el elemento mayor de la lista L.
%------------------------------------------------------------------------
% Solucion:

mayor([E],E):-!.
mayor([E|L], M):-mayor(L,M1), M1<E, M is E ; mayor(L,M).

%------------------------------------------------------------------------
% bublesSort(L, L1) : Predicado que ordena los elementos de lista L.
% L1 es una lista con los elemento de L en forma ordenada E.
%------------------------------------------------------------------------
% Solucion:

bubbleSort(L,L1):-bubbleSort(L,[],L1).
bubbleSort([],Acc,Acc).
bubbleSort([H|T],Acc,L1):-bubble(H,T,NT,Max), bubbleSort(NT,[Max|Acc],L1).     
bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):- X>Y, bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-X=<Y, bubble(Y,T,NT,Max).

%------------------------------------------------------------------------
% eliminar(L, E, L1) : Predicado que elimina el elemento E de la lista L.
% L1 es una lista con los elemento de L excepto E.
%------------------------------------------------------------------------
% Solucion:

eliminar(L,E,L1):-elim(L,E,L1,1).
elim([],_,[],_):-!.
elim( [E1|L],E,L1,B):- E1=:=E,B=:=1,elim(L,E,L1,2).
elim( [E1|L],E,[E1|L1],B):-elim(L,E,L1,B).







    