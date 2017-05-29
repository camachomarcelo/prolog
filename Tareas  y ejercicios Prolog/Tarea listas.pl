%Practico de Consultas y encontrar valores

%Mirko Ivan Gomez
%Alan Jhonny Hinojosa
%Maribel Maldonado

%1.-Iguales 

iguales([]):-!.
iguales([X,X|L1]):-iguales([X,L1]).

%2.-Existe Par 

existePar([X|_]):-X mod 2=:=0.
existePar([_|L1]):-existePar(L1).

%3.-Secuencia Par Impar

esPar(X):-X mod 2=:=0.
esImpar(X):-X mod 2=\=0.

secuenciaParImpar([X,Y]):-esPar(X),esImpar(Y).
secuenciaParImpar([X,Y|L1]):-esPar(X),esImpar(Y),secuenciaParImpar(L1).

%4.-Ordenado

ordenadoAsc([_]).
ordenadoAsc([X,Y]):-X < Y.
ordenadoAsc([X,Y|L1]):-X < Y,ordenadoAsc([Y|L1]).

ordenadoDes([_]).
ordenadoDes([X,Y]):-X > Y.
ordenadoDes([X,Y|L1]):-X > Y,ordenadoDes([Y|L1]).

ordenado(L1):-ordenadoAsc(L1);ordenadoDes(L1).

%5.-Primer Elemento.

primerElem([X,_],X).

%6.-Ultimo elemento

ultimoElem([X],X).
ultimoElem([_|L1],X):-ultimoElem(L1,X).

% 7.-I esimo Elemento de la lista.

iEsimo([X|_],1,X).
iEsimo([_|L1],I,X):-Z is I-1,iEsimo(L1,Z,X).

%8.-Diferentes OJO

diferentes([_]):-!.
diferentes([X,Y]):-X=\=Y.
diferentes([X,Y|L1]):-X=\=Y,diferentes(L1). 

%9.- Todos Pares

todosPares([X]):-esPar(X),!.
todosPares([X|L1]):-esPar(X),todosPares(L1).


%10.- Menor

menorc(_,B,B).
menorc(A,B,A):-A<B,!.

menor([X],X):-!.
menor([X|L1],M):-menor(L1,M1),menorc(X,M1,M).

%11.-Mayor

mayorc(_,B,B).
mayorc(A,B,A):-A>B,!.

mayor([X],X).
mayor([X|L1],M):-mayor(L1,M1),mayorc(X,M1,M).


%12.-Cantidad de elementos

cantidad([_],1):-!.
cantidad([_|L1],C):-cantidad(L1,C1), C is C1+1.

%13.-Suma de elementos

suma([X],X):-!.
suma([X|L1],Sum):-suma(L1,Sum1),Sum is Sum1+X.

%14.-Suma de pares

sumPar([X],S):-esPar(X), S is X,!.
sumPar([X|L1],Sum):-esPar(X),sumPar(L1,Sum1),Sum is Sum1+X.

%15.-penultimo 

penultimo([X,_],X).
penultimo([_|L1],X):-penultimo(L1,X).

%16.-Segundo

segundo([_,Y|_],Y).

%17.- Parejas Iguales

parejasIguales([X,X]):-!.
parejasIguales([_,_|L1]):-parejasIguales(L1).

%18.-Frecuencia

frecuencia([],_,0):-!.
frecuencia([X],X,1 ):-	!.
frecuencia([X|L1],Y,F):-frecuencia( L1,Y,F1 ),incrementarI( X,Y,F1,F ).

incrementarI(X,X,F1,F):-F is F1 + 1,!.
incrementarI(_,_,F1,F1).

%19.-Se Repite

seRepite(L1,X,Q):-frecuencia(L1,X,Q).

%20.-Existe Frecuencia

existeFrec([],0 ):-!.
existeFrec([_],1):-!.
existeFrec([X|L1],Q):-frecuencia([X|L1],X,F),F =:= Q,!.
existeFrec([_|L1],Q):-existeFrec(L1,Q).

%21.-Mismas Frecuencias

mismasFrec([]):-!.
mismasFrec([_]):-!.
mismasFrec([_,_]):-!.
mismasFrec([X|L1]):-frecuencia([X|L1],X,F1),eliminar(L1,X,[Y|L2]),
		frecuencia([Y|L2],Y,F2),iguales(F1,F2),mismasFrec([Y|L2]);
		frecuencia([X|L1],X,F1 ),eliminar(L1,X,[Y|L2] ),
		frecuencia([Y|L2],Y,F2 ),iguales(F1,F2),iguales(L2);
		iguales([X|L1]).

iguales( X,X ).

eliminar([],_,[]):-!.
eliminar([X],X,[]):-!.
eliminar([X],Y,[X]):-X=\=Y,!.
eliminar([X|L1],X,L2):-eliminar( L1,X,L2 ),!.
eliminar([Y|L1],X,[Y|L2]):-eliminar( L1,X,L2 ).


%22.-Escalera

escalera(L1):-mayor(L1,MA),menor(L1,ME),cantidad(L1,C),C-1 =:= MA-ME.

%23.- Poker

poker(L1):-cantidad(L1,C),existeFrec(L1,C-1).		 

%24.-Full

full([X|L1]):-frecuencia([X|L1],X,F1),eliminar(L1,X,[Y|L2]),frecuencia([Y|L2],Y,F2),iguales(F1,F2).

%25 Se Encuentra

seEncuentra([X|_],X):-!.
seEncuentra([_|L1],X):-seEncuentra(L1,X).







