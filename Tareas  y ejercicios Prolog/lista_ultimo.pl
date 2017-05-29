%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%algoritmo de ordenacion por Seleccion  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	ordSeleccion(L1,L2):-seleccion(L1,[],L2).
	 
	seleccion([],L2,L2).
	seleccion(L1,L2,L3):-menorlista(L1,M),
	              eliminar(M,L1,Laux),
	       setCabeza(M,Laux,[H|T]),
	       append(L2,H,Laux2),
	       seleccion(T,Laux2,L3).
	       
%%%%   ponemos un elemento como cabeza de la lista
	 
        setCabeza(H,L,[H|L]).	       
	       
%%%%%%    eliminamos un elemento X de la lista

	
        eliminar(_,[],[]):-fail. 
	eliminar(X,[X|R],R). 
	eliminar(X,[C|R],[C|R1]):- eliminar(X,R,R1).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  ordenacion por el método de insercion  %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	ordInsercion([],[]).
	ordInsercion([H|T],L):-ordInsercion(T,L1),
	         insertar(H,L1,L).
	 
	insertar(N,[],[N]).
	insertar(N,[H|T],[N,H|T]):- N
	insertar(N,[H|T],[H|S]):- insertar(N,T,S).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%  ordenamiento por burbuja%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 burbuja([],[]).  
 burbuja([X],[X]).  
 burbuja([X,Y|L],Lburb) :-  
               menorig(X,Y),  
               burbuja([Y|L],L1),  
               Lburb = [X|L1]. 
%% (X e Y están bien ordenados; la «burbuja» se traslada a [Y|L]). 
 
burbuja([X,Y|L],Lburb) :-  
              menor(Y,X),  
              burbuja([X|L],L1),  
              Lburb = [Y|L1].
 
%%  (X e Y se intercambian, y la «burbuja» se traslada a [X|L]). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%   inversa   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inversa([],[]).
inversa([H|T],L):- inversa(T,T1),
                    insertarFinal(T1,H,L).

%%% Insertar un elemento al final de una lista

insertarFinal(X,[],[X]).
insertarFinal(X,[L|Ls],[L|R]):-insertarFinal(X,Ls,R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    ORDENAMIENTO DE MEZCLA (merge sort)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ordenamiento_mezcla([],[]).
ordenamiento_mezcla(Lista,Ordenado) :- 
					divide(Lista,L1,L2), 
					ordenamiento_mezcla(L1,Ordenado1),
					ordenamiento_mezcla(L2,Ordenado2),
					mezcla(Ordenado1,Ordenado2,Ordenado).
mezcla([],L,L).
mezcla(L,[],L) :- L\=[].
mezcla([X|T1],[Y|T2],[X|T]) :- X<=Y,mezcla(T1,[Y|T2],T).
mezcla([X|T1],[Y|T2],[Y|T]) :- X>Y,mezcla([X|T1],T2,T).

divide(L,L1,L2) :- par_impar(L,L1,L2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%    ORDENAMIENTO RÁPIDO (quick sort)  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

quick_sort([],[]).
quick_sort([H|T],Ordenado) :- 
   				pivote(H,T,L1,L2),
				quick_sort(L1,Ordenado1),
				quick_sort(L1,Ordenado2),
  				agregar(Ordenado1,[H|Ordenado2]).
 
pivote(H,[],[],[]).
pivote(H,[X|T],[X|L],G) :- X<=H,pivote(H,T,L,G).
pivote(H,[X|T],L,[X|G]) :- X>H,pivote(H,T,L,G).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






















