
insertar( X, nil, arbol(nil,X,nil) ).

insertar( X, arbol(Aizq,Y,Ader), arbol( Aizq1, Y , Ader ) ):- X < Y,
	insertar(X,Aizq,Aizq1),!. 

insertar(X,  arbol( Aizq, Y , Ader),  arbol( Aizq, Y , Ader1 )  ):- 
	insertar(X,Ader,Ader1),!. 


probarDiferentes(A1):-diferentes(A1),write('Son Diferentes'),!.

probarDiferentes(_):-write('No Son Diferentes').

probarIguales(A1):-iguales(A1),write('Son iguales'),!.

probarIguales(A1):-write('No son iguales').

comenzar:-
	write('Cuantos Elementos va a insertar: '),
	read(N),ciclo(N,1,nil,A1),
	probarDiferentes(A1).

ciclo(N,I,A1,A1):- I > N , ! .

ciclo(N,I,A1,A2):- write('Inserte un dato: '), read(X),
	insertar(X,A1,A3),
	I1 is I+1,
	ciclo(N,I1,A3,A2).

esta(_,nil):-fail,!.	%%	return false.

esta(X,arbol(_,X,_)):-!.

esta(X,arbol(Ai,Y,_)):- X < Y,
	esta(X,Ai),!.

esta(X,arbol(_,_,Ad)):-
	esta(X,Ad).


diferentes(nil):-!.

diferentes(arbol(nil,_,nil)):-!.

diferentes(arbol(Ai,X,Ad)):-
	not(esta(X,Ai)),
	not(esta(X,Ad)),
	diferentes(Ai),
	diferentes(Ad).

iguales(nil).

iguales(arbol(Ai,X,Ad)):-
	iguales(X,arbol(Ai,X,Ad)).

iguales(_,nil):-!.

iguales(X,arbol(nil,X,nil)):-!.

iguales(X,arbol(Ai,X,Ad)):-
	iguales(X,Ai),
	iguales(X,Ad).

mayor(arbol(_,X,nil),X).	

mayor(arbol(_,_,Ad), X):-mayor(Ad,X).

menor(arbol(nil,X,_),X).

menor(arbol(Ai,_,_),X):-menor(Ai,X).

rango(A1, Dif):-
	mayor(A1,May),menor(A1,Men),
	Dif is May - Men,!.
	
sumaTerm(nil,0).

sumaTerm(arbol(nil,X,nil),X).

sumaTerm(arbol(Ai,_,Ad),Sum):-
	sumaTerm(Ai,S1),
	SumaTerm(Ad,S2),
	Sum is S1+S2.

terminales(nil,0).

terminales(arbol(nil,_,nil),0).

terminales(arbol(Ai,_,Ad),Cant):-
	terminales(Ai,C1),
	terminales(Ad,C2),
	Cant is C1+C2+1.

inOrden(nil,[]).

inOrden(arbol(Ai,X,Ad), L1 ):-
	inOrden(Ai,L2),
	concat(L2,[X],L3),
	inOrden(Ad,L4),
	concat(L3,L4,L1).

preOrden(nil,[]).

preOrden(arbol(Ai,X,Ad), [X|L1]  ):-
	preOrden(Ai,L2),
	preOrden(Ad,L3),
	concat(L2,L3,L1).

postOrden(nil,[]).

postOrden(arbol(Ai,X,Ad), L1 ):-
	postOrden(Ai,L2),
	postOrden(Ad,L3),
	concat(L2,L3,L4),
	concat(L4,[X],L1).

concat([],L2,L2).

concat([X|L1],L2,[X|L3]):-
	concat(L1,L2,L3).

crearArbol([],nil).

crearArbol([X], arbol(nil,X,nil)).

crearArbol([X|L1], A1 ):-
	crearArbol(L1,A2),
	insertar(X,A2,A1).

mostrarNivel(nil).

mostrarNivel(A1):-
	mostrarNivel(A1,0).

mostrarNivel(nil,_):-!.

mostrarNivel(arbol(Ai,X,Ad), N):-
	N1 is N +1,
	mostrarNivel(Ai,N1),
	write('Dato: '),write(X),write('  Nivel: '),write(N),nl,
	mostrarNivel(Ad,N1).

dataArbol( arbol(_,X,_), X ).

inOrden(nil).
inOrden( arbol(Aizq,X,Ader) ):- inOrden(Aizq), write(X) , write(', ') , inOrden(Ader),!.

preOrden(nil).
preOrden( arbol(Aizq,X,Ader) ):- write(X) , write(', '), preOrden(Aizq), preOrden(Ader) ,!.

postOrden(nil).
postOrden( arbol(Aizq,X,Ader) ):- postOrden(Aizq), postOrden(Ader),write(X) , write(', '),!.

altura(nil,0).
altura(arbol(nil,_,nil),1).
altura(arbol(Aizq,_,Ader), H ):-
	altura(Ader,Hd),
	altura(Aizq,Hi),
	mayor(Hd,Hi,H2),
	H is H2 +1.	

