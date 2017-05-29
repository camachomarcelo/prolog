


insertar(X,nil,arbol(nil,X,nil)).

insertar(X,arbol(Ai,Y,Ad), arbol(Aim,Y,Ad) ):- X < Y,
	insertar(X,Ai,Aim),!.

insertar(X,arbol(Ai,Y,Ad), arbol(Ai,Y,Adm) ):-
	insertar(X,Ad,Adm).


comenzar:-
	write('Cantidad de Elmentos: '), read(N),
	ciclo(N,1,nil,A1),
	terminales(A1,Num),
	write(Num).

ciclo(N,I,A1,A1):-I>N,!.
ciclo(N,I,A1,A3):-
	write('ingrese dato: '), read(X),
	insertar(X,A1,A2),
	I1 is I+1,
	ciclo(N,I1,A2,A3).


terminales(nil,0).
terminales(arbol(nil,_,nil),0).
terminales(arbol(Ai,_,Ad),Cant):-
	terminales(Ai,Ci),
	terminales(Ad,Cd),
	Cant is Ci+Cd+1.
