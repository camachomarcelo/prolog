insertar(X,nil,arbol(nil,X,nil)).

insertar(X,arbol(Aizq,Y,Ader),arbol(Aizq1,Y,Ader)):- X < Y,
	insertar(X,Aizq,Aizq1),!.

insertar(X,arbol(Aizq,Y,Ader),arbol(Aizq,Y,Ader1)):-
	insertar(X,Ader,Ader1).

inOrden(nil).
inOrden(arbol(Aizq,X,Ader)):-
	inOrden(Aizq),
	write(X),write(', '),
	inOrden(Ader).

preOrden(nil).
preOrden(arbol(Aizq,X,Ader)):-
	write(X),write(', '),
	preOrden(Aizq),
	preOrden(Ader).

postOrden(nil).
postOrden(arbol(Aizq,X,Ader)):-
	postOrden(Aizq),
	postOrden(Ader),
	write(X),write(', ').

comenzar:-write('Digite N: '),
	read(N),
	ciclo(N,1,nil,A1),
	preOrden(A1),nl,
	inOrden(A1),
	postOrden(A1).

ciclo(N,I,A1,A1):-I>N,!.

ciclo(N,I,A1,A2):-write('Digite elemento: '),
	read(X),
	insertar(X,A1,A3),
	I1 is I+1,
	ciclo(N,I1,A3,A2).
