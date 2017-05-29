seEncuentra(T,arbol(_,T,_)):- !.
seEncuentra(X,arbol(I,T,D)):- seEncuentra(X,I);
							seEncuentra(X,D).

diferentes(null):- !.

diferentes(arbol(I,T,D)):- not(seEncuentra(T,I)),
							not(seEncuentra(T,D)),
							diferentes(I),
							diferentes(D).
							
iguales(null):- !.
iguales(arbol(null,_,null)):- !.
iguales(arbol(null,T1,arbol(I2,T1,D2))):- iguales(arbol(I2,T1,D2)).
iguales(arbol(arbol(I1,T1,D1),T1,null)):- iguales(arbol(I1,T1,D1)).
iguales(arbol(arbol(I1,T1,D1),T1,arbol(I2,T1,D2))):- iguales(arbol(I1,T1,D1)),
												iguales(arbol(I2,T1,D2)).

rango(A,Dif):- mayor(A,M),
						menor(A,Mn),
				Dif is M - Mn.
				
mayor(arbol(_,M,null),M):- !.
mayor(arbol(_,_,D),M):- mayor(D,M).

menor(arbol(null,Mn,_),Mn):- !.
menor(arbol(I,_,_),Mn):- menor(I,Mn).

suma(null,0).
suma(arbol(I,X,D),S):- suma(I,S1),
						suma(D,S2),
						S is S1+S2+X.
						
terminales(null,0):- !.
terminales(arbol(null,_,null),0):- !.
terminales(arbol(I,_,D),Cant):- terminales(I,C1),
							terminales(D,C2),
							Cant is C1+C2+1.

insertar(null,X,arbol(null,X,null)):- !.
							
insertar(arbol(I,T,D),X,arbol(I2,T,D)):- X < T,
								insertar(I,X,I2).
								
insertar(arbol(I,T,D),X,arbol(I,T,D2)):- insertar(D,X,D2).
							
crearArbol([X],arbol(null,X,null)):- !.
crearArbol([X|L],A):- crearArbol(L,A1),
						insertar(A1,X,A).
						
concatenar([],L,L):- !.
concatenar([X|L1],L2,[X|L]):- concatenar(L1,L2,L), !.

inOrden(null,[]):- !.		
inOrden(arbol(null,T,null),[T]):- !.
inOrden(arbol(I,T,D),L):- inOrden(I,L1),
							inOrden(D,L2),
							concatenar(L1,[T|L2],L).
							
preOrden(null,[]):- !.		
preOrden(arbol(null,T,null),[T]):- !.
preOrden(arbol(I,T,D),L):- preOrden(I,L1),
							preOrden(D,L2),
							concatenar([T|L1],L2,L).
							
postOrden(null,[]):- !.		
postOrden(arbol(null,T,null),[T]):- !.
postOrden(arbol(I,T,D),L):- postOrden(I,L1),
							postOrden(D,L2),
							concatenar(L1,L2,L3),
							concatenar(L3,[T],L).
							
mostrarNivel(A):- mostrarNivel(A,1).

mostrarNivel(null,_):- !.
mostrarNivel(arbol(I,T,D),C):- write('Elemento: '),
						write(T), write('Nivel: '),
							write(C), nl,
							C2 is C+1,
							mostrarNivel(I,C2),
							mostrarNivel(D,C2).