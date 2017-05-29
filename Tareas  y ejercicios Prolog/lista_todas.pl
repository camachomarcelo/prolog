% Author: Marines Lopez Soliz		presentado
% Date: 30/05/2008

cantidad([],0).
cantidad([_|L1],Q):-cantidad(L1,Q1),Q is Q1+1.
%seEncuentra([X|_],X):-!.
%seEncuentra([_|L1],X):-seEncuentra(L1,X).
ultimo([X],X):-!.
ultimo([_|L1],X):-ultimo(L1,X).
%iguales([]).	%para poker
iguales([_]):-!.
iguales([X,X|L1]):-iguales([X|L1]).
%sum=suma de los elementos de la lista
suma([],0).
suma([X|L1],Sum):-suma(L1,Sum1),Sum is Sum1+X.
%sum=suma de elemtos pares de la lista
sumaPares([X],0):-(X mod 2)=:=1 .
sumaPares([X],X).
sumaPares([X|L1],Sum):-sumaPares(L1,Sum1),
						X/2=:=0,
						Sum is Sum1+X,!.
sumaPares([_|L1],Sum):-sumaPares(L1,Sum).
%
frecuencia([],_,0).
frecuencia([X],X,1).
frecuencia([X|L1],X,F):-frecuencia(L1,X,F1),F is F1+1.
frecuencia([_|L1],X,F):-frecuencia(L1,X,F).
%
ordenado(L):-ordenadoA(L);ordenadoD(L).
ordenadoA([X]):-!.
ordenadoA([X,Y|L1]):-X<Y,ordenado([Y|L1]).
ordenadoD([X]):-!.
ordenadoD([X,Y|L1]):-X>Y,ordenado([Y|L1]).
%
diferentes(L1):-not(iguales(L1)).
%
existeFrec(L1,K):-frecuencia(L1,_,K).
%poker(L1):-. todos igua les -1
%poker(L):-concatenar([Y|L1],[X,Y|L2],L),X=/=Y,iguales([Y|L1]),igualse([Y|L2]).
poker(L):-concatenar(L1,[X|L2],L),X=\=Y,
		  ( (L1=:=[Y|L11],iguales([Y|L11])) ;L1=:=[]),
		  ( (L2=:=[Y|L22],igualse([Y|L22])) ;L2=:=[]).
%mayor de 2 numeros
mayorN(A,B,A):-A>B.
mayorN(_,B,B).
%mayor de la lista
mayor([X],X).
mayor([X|L1],May):-mayor(L1,M1),mayorN(X,M1,May).
%menor de 2 numeros
menorN(X,Y,X):-X<Y,!.
menorN(_,Y,Y).
%menor de la lista
menor([X],X).
menor([X|L1],Me):-menor(L1,M1),menorN(X,M1,Me).
%escalera(L1):-.

%********************************************************
%********************************************************

% Author:  Marines Lopez Soliz 		presentado
% Author:  Zarate
% Date: 03/06/2008		

intercalar([],L,L).
intercalar(L,[],L).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

insertarIesimo([],X,1,[X]).
insertarIesimo([X|L1],E,I,[E,X|L1]):-I=:=1 .
insertarIesimo([X|L1],E,I,[X|L2]):-insertarIesimo(L1,E,I-1,L2).

eliminarIesimo([X|L1],I,[L1]):-I=:=1 .
eliminarIesimo([X|L1],I,[X|L2]):-eliminarIesimo(L1,I-1,L2).

%********************************************************
%********************************************************

% Author: Marines Lopez Soliz
% Date: 06/06/2008
concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

seEncuentra(L1,X):-concatenar(_,[X|_],L1).
insertarUlt(L1,X,L2):-concatenar(L1,[X],L2).
eliminarUlt(L1,L2):-concatenar(L2,[_],L1).
extremosIguales(L1):-concatenar([X|_],[X],L1).

sublista(I,B):-concatenar(L1,L2,B),concatenar(S,L3,L2).
insertarInicio(L1,X,L2):-concatenar([X],L1,L2).
eliminarInicio(L1,L2):-concatenar([_],L2,L1).


%poker fue hecho utilizando concatenar
%dospares(L):-concatenar(L1,[X|L2],L),concatenar(L1,[Y|L2],L),.
dospares(L):-concatenar(_,[X|_],L),
			 concatenar(_,[Y|_],L),
			 par(X),par(Y).
trespares(L):-concatenar(_,[X|_],L),
			  concatenar(_,[Y|_],L),
			  concatenar(_,[Z|_],L),
			  par(X),par(Y),par(Z).
cuatropares(L):-concatenar(_,[X|_],L),
				concatenar(_,[Y|_],L),
				concatenar(_,[Z|_],L),
				concatenar(_,[W|_],L),
				par(X),par(Y),par(Z),par(W).
parImpar(L):-concatenar(_,[X|_],L),
			 concatenar(_,[Y|_],L),
			 par(X),impar(Y).

%poker(L):-concatenar(L1,[X|L2],L),X=/=Y,
%		  ( (L1=:=[Y|L11],iguales([Y|L11])) ;L1=:=[]),
%		  ( (L2=:=[Y|L22],igualse([Y|L22])) ;L2=:=[]).
%anexos
par(X):-X mod 2=:=0 .
impar(X):-X mod 2=:=1 .
