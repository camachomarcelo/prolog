
insertar( X,nil,arbol(nil,X,nil) ):-!.
insertar( X,arbol(Ai,Y,Ad), arbol(Aim,Y,Ad) ):- X < Y,
	insertar( X,Ai,Aim ),!.
insertar( X, arbol(Ai,Y,Ad),arbol(Ai,Y,Adm) ):-
	insertar(X,Ad,Adm).

comenzar:-
	write('Digite cantidad: '), read(N),
	ciclo(N,1,nil,A1),nl,read(L1),
	estanTodos(L1,A1),write('Estan'),nl.

ciclo( N,I,A1,A1 ):- I > N,!.
ciclo( N,I,A1,A3 ):-
	write('Digite elemento: '),read(X),
	insertar(X,A1,A2),	
	I1 is I + 1,
	ciclo(N,I1,A2,A3).

esta( _,nil ):-fail,!.
esta( X,arbol(_,X,_) ):-!.
esta( X,arbol(Ai,Y,_) ):-X < Y,
	esta(X,Ai),!.
esta( X,arbol(_,_,Ad) ):-
	esta(X,Ad).

diferentes( nil ):-!.
diferentes( arbol(nil,_,nil) ):-!.
diferentes( arbol(Ai,X,Ad) ):-
	not( esta(X,Ai) ),
	not( esta(X,Ad) ),
	diferentes(Ai),
	diferentes(Ad).

probardif(A1):-diferentes(A1),write('Son diferentes'),!.
probardif(_):-write('No son diferentes'),!.

iguales( nil ):-!.
iguales( arbol(Ai,X,Ad) ):-
	iguales(X,arbol(Ai,X,Ad)),!.
iguales( _,nil ):-!.
iguales( X,arbol(nil,X,nil) ):-!.
iguales( X,arbol(Ai,X,Ad) ):-
	iguales(X,Ai),
	iguales(X,Ad).

probarigu(A1):-iguales(A1),write('Son iguales'),!.
probarigu(_):-write('No son iguales'),!.

mayor( arbol(_,X,nil),X ).
mayor( arbol(_,_,Ad),May ):-
	mayor(Ad,May).
menor( arbol(nil,X,_),X ).
menor( arbol(Ai,_,_),Men ):-
	menor(Ai,Men).

rango( A1,Dif ):-mayor(A1,Mayor),
	menor(A1,Menor),
	Dif is Mayor - Menor.

sumaTerm( nil,0 ).
sumaTerm( arbol(nil,X,nil), X ).
sumaTerm( arbol(Ai,_,Ad),Tt ):-
	sumaTerm(Ai,Ti),
	sumaTerm(Ad,Td),
	Tt is Ti + Td.

crearArbol( [],nil ).
crearArbol( [X],arbol(nil,X,nil) ).
crearArbol( [X|L1],A2 ):-
	crearArbol(L1,A1),
	insertar(X,A1,A2).

concat( [],L2,L2 ).
concat( [X|L1],L2, [X|L3]):-
	concat(L1,L2,L3).

inOrden( nil,[] ).
inOrden( arbol(Ai,X,Ad),L2 ):-
	inOrden(Ai,Li),
	concat(Li,[X],L1),
	inOrden(Ad,Ld),
	concat(L1,Ld,L2).

preOrden( nil,[] ).
preOrden( arbol(Ai,X,Ad), [X|L1] ):-
	preOrden(Ai,Li),
	preOrden(Ad,Ld),
	concat(Li,Ld,L1).

postOrden( nil,[] ).
postOrden( arbol(Ai,X,Ad),L2 ):-
	postOrden(Ai,Li),
	postOrden(Ad,Ld),
	concat(Li,Ld,L1),
	concat(L1,[X],L2).

mostrarNivel( nil ):-!.
mostrarNivel( A1 ):-
	mostrarNivel(A1,1).

mostrarNivel( nil,_ ):-!.
mostrarNivel( arbol(Ai,X,Ad),N ):-
	N1 is N + 1,
	mostrarNivel(Ad,N1),
	mostrarNivel(Ai,N1),	
	write('Elemento: '),write(X),
	write('  Nivel: '),write(N),nl.
	
estanTodos([],A1):-!.
estanTodos([X|L1],A1):-
	esta(X,A1),
	estanTodos(L1,A1).