

% LISTAS DE FUNCTORES. 


lugar(punto(X,Y),1):- X > 0,Y > 0,!.
lugar(punto(X,Y),2):- X < 0,Y > 0,!.
lugar(punto(X,Y),3):- X < 0,Y < 0,!.
lugar(punto(X,Y),4):- X > 0,Y < 0,!.
lugar(punto(_,Y),5):- Y=:=0,!.  
lugar(punto(X,_),6):- X=:=0.

iguales([_]).
iguales([P,P|L]):- iguales([P|L]).



%--------------------------------------------------------------------------------------------------------------------

% 1. menorX(L1, P1) : Predicado que encuentra en P1, el punto con valor menor en X. 


menorX([P],P).
menorX([P1|L],P):- menorX(L,P2),menorX(P1,P2,P).

menorX(punto(X1,_),punto(X2,Y2),punto(X2,Y2)):- X2 < X1,!.
menorX(punto(X1,Y1),_,punto(X1,Y1)). 

%--------------------------------------------------------------------------------------------------------------------

% 2. menorY(L1, P1) : idem. 


menorY([P],P).
menorY([P1|L],P):- menorY(L,P2),menorY(P1,P2,P).

menorY(punto(_,Y1),punto(X2,Y2),punto(X2,Y2)):- Y2 < Y1,!.
menorY(punto(X1,Y1),_,punto(X1,Y1)).


%--------------------------------------------------------------------------------------------------------------------

% 3. mayorX(L1, P1) : Idem.


mayorX([P],P).
mayorX([P1|L],P):- mayorX(L,P2), mayorX(P1,P2,P).

mayorX(punto(X1,_),punto(X2,Y2),punto(X2,Y2)):- X2 >= X1,!.
mayorX(punto(X1,Y1),_,punto(X1,Y1)).


%--------------------------------------------------------------------------------------------------------------------

% 4. mayorY(L1, P1) : Idem.


mayorY([P],P).
mayorY([P1|L],P):- mayorY(L,P2),mayorY(P1,P2,P).

mayorY(punto(_,Y1),punto(X2,Y2),punto(X2,Y2)):- Y2 > Y1,!.
mayorY(punto(X1,Y1),_,punto(X1,Y1)).


%--------------------------------------------------------------------------------------------------------------------
 
% 5. mismoLugar(L1) : Predicado que es True, si todos los puntos de la lista de puntos de L1 están en el mismo 
%    lugar del plano cartesiano.


mismoLugar([]).
mismoLugar([_]).
mismoLugar([P1,P2|L]):- lugar(P1,L1),lugar(P2,L1),mismoLugar([P2|L]).


%--------------------------------------------------------------------------------------------------------------------

% 6. puntosDif(L1) : Predicado que es True, si todos los puntos de la lista de puntos L1 son diferentes.


puntosDif([_]).
puntosDif([P1|L]):- not(seEncuentra(L,P1)),puntosDif(L).

seEncuentra([P|_],P):-!.
seEncuentra([_|L],P):- seEncuentra(L,P).


%--------------------------------------------------------------------------------------------------------------------

% 7. Lineal(L1) : Predicado que es True, si todos los puntos de la lista de puntos L1 se encuentran en una 
%                 misma recta.


lineal( [_,_] ).
lineal( [P1,P2|L1 ] )		:-	pendiente( P1,P2,Pen),lineal( [P1|L1],Pen ).

lineal( [P1,P2],Pen )		:-	pendiente( P1,P2,Pen).
lineal( [P1,P2|L1],Pen )	:-	pendiente( P1,P2,Pen),lineal( [P2|L1],Pen ).


pendiente( punto( X1,_ ),punto( X2,_ ),  0 ) :-  (X2-X1) =:= 0.
pendiente( punto( X1,Y1 ),punto( X2,Y2 ), Pend ) :- Pend is ( Y2-Y1 ) / ( X2-X1 ).



%--------------------------------------------------------------------------------------------------------------------

% 8. mismosPuntos(L1, L2) : Predicado que es True, si las listas de puntos L1 y L2 tienen los mismos puntos.


mismosPuntos(L1,L2)   :- estanTodos(L1,L2),estanTodos(L2,L1).

estanTodos([P1],L1)   :- seEncuentra(L1,P1),!.
estanTodos([P1|L1],L2):- seEncuentra(L2,P1),estanTodos(L1,L2).


%--------------------------------------------------------------------------------------------------------------------

% 9. distancia(L1, D1) : Predicado que encuentra la distancia total de la lista de puntos L1.


distancia([P1,P2],D)		   :- dist(P1,P2,D).
distancia([P1,P2|L1],D)            :- dist(P1,P2,D1),distancia([P2|L1],D2),D is D1 + D2.

dist(punto(X1,Y1),punto(X2,Y2),D1) :- D1 is sqrt((X1 - X2)**2 + (Y1 - Y2)**2).


%--------------------------------------------------------------------------------------------------------------------

% 10. soloEjes(L1) : Predicado que es True, si todos los puntos de L1 se encuentran en los ejes del plano cartesiano.


soloEjes([P])     :- enEje(P),!.
soloEjes([P1|L1]) :- enEje(P1),soloEjes(L1).

enEje(P)          :- lugar(P,5);lugar(P,6).


%--------------------------------------------------------------------------------------------------------------------

% 11. ascendentes(L1) : Predicado que es True, si la lista de puntos son ascendente en X.

ascendentes([]).
ascendentes([_]).
ascendentes([punto(X1,_),punto(X2,_)|L1]):- X1 =< X2, ascendentes([punto(X2,_)|L1]). 


%--------------------------------------------------------------------------------------------------------------------

% 12. cantidadEje(L1, Q1) : Predicado que encuentra la cantidad de puntos que se encuentran los ejes del plano cartesiano. 

cantidadEje([],0).
cantidadEje([P],1)       :- enEje(P),!.
cantidadEje([P1|L1],Q1)  :- enEje(P1),cantidadEje(L1,Q), Q1 is Q + 1.
cantidadEje([_|L1],Q1)   :- cantidadEje(L1,Q),Q1 is Q.


%--------------------------------------------------------------------------------------------------------------------

%  13. puntosMedios(L1, L2) : Predicado que encuentra los puntos medios en L2, de cada segmento de la lista L1.


puntosMedios([P1,P2],[P3])       :- puntoM(P1,P2,P3). 
puntosMedios([P1,P2|L1],[P3|L2]) :- puntoM(P1,P2,P3),puntosMedios([P2|L1],L2). 

puntoM(punto(X1,Y1),punto(X2,Y2),punto(X3,Y3)):- X3 is (X1+X2)/2 ,Y3 is (Y1+Y2)/2.


%--------------------------------------------------------------------------------------------------------------------

%  14. menorDist(L1, Me) : Predicado que encuentra la menor distancia definida por puntos adyacentes de la lista L1.


menorDist([P1,P2],Me)    :- dist(P1,P2,Me).
menorDist([P1,P2|L1],Me) :- dist(P1,P2,D),menorDist([P2|L1],Me1), D < Me1, Me is D,!.
menorDist([_,P2|L1],Me)  :- menorDist([P2|L1],Me1), Me is Me1.  


%--------------------------------------------------------------------------------------------------------------------

%  15. Sea una lista de tramos de viajes de un solo día. Ejemplo:  
%      L1 = [viaje(8, 10), viaje(11, 12), viaje(15, 18)]
%      Un tramo de viaje esta formado por una hora de salida y una hora de llegada.
%      Encontrar los siguientes: 

%  a.  valido(L1) : Predicado que es True, si la secuencia de viajes esta correcto. Ejemplos de secuencias no validas: 
%      L1 = [viaje(8, 10), viaje(9, 12), viaje(15, 18)]  
%      L1 = [viaje(8, 10), viaje(11, 12), viaje(18, 15)]



	valido([V])        :- val(V).
	valido([V1,V2|L1]) :- val(V1),val(V2),mayor(V1,V2),valido([V2|L1]).


	val(viaje(S,LL))    :- S < LL, S =<22, LL =< 23.

	mayor(viaje(_,LL1),viaje(S2,_)):- S2 >= LL1.


%--------------------------------------------------------------------------------------------------------------------

%  Sea una lista de tramos de viajes de un solo día. Ejemplo: 
%  L1 = [viaje(8, 10), viaje(11, 12), viaje(15, 18)] 
%  Un tramo de viaje esta formado por una hora de salida y una hora de llegada. 

%  Encontrar los siguientes: 

%  b. tiempoViaje(L1, TV) : Predicado que encuentra el tiempo de viaje en TV de la lista de tramos de viajes L1.


tiempoViaje([V],TV)        :- tiempo(V,TV).
tiempoViaje([V1|L1],TV)    :- tiempo(V1,TV1),valido(L1),tiempoViaje(L1,TV2),TV is TV1 + TV2.

tiempo(viaje(S,LL),T):- val(viaje(S,LL)),T is LL - S. 


%--------------------------------------------------------------------------------------------------------------------

%  c. tiempoEspera(L1, TE) : Predicado que encuentra el tiempo de espera en TE de la lista de tramos de viajes L1.

%     [viaje(8,10),viaje(11,12),viaje(15,18)]


	tiempoEspera([V1,V2],TE)	      :- espera(V1,V2,TE),mayor(V1,V2).
	tiempoEspera([V1,V2|L1],TE)           :- espera(V1,V2,TE1),mayor(V1,V2),valido([V2|L1]),
			             	         tiempoEspera([V2|L1],TE2),TE is TE1 + TE2.

	espera(viaje(S1,LL1),viaje(S2,LL2),E) :- val(viaje(S1,LL1)),val(viaje(S2,LL2)),E is S2 - LL1.


%--------------------------------------------------------------------------------------------------------------------

% 16. Sea una lista de tramos de viaje. Ejemplo: 

%     L1 = [viaje(a, b, 5), viaje(b, c, 2), viaje(c, d, 3), viaje(d, a, 7)]

%     Un tramo de viaje esta formado por lugar de salida, lugar de llegada y tiempo de viaje. 

%     Encontrar los siguientes: 


%  a. valido(L1) : Predicado que es True, si la secuencia de viajes esta correcto. Ejemplos de secuencias no validas:

%     L1 = [viaje(a, b, 5), viaje(e, c, 2), viaje(c, d, 3), viaje(d, a, 7)]

	valido2([_]).
	valido2(V1,V2):- vali(V1,V2).
	valido2([V1,V2|L1]):- vali(V1,V2),valido2([V2|L1]).


        vali(viaje(a,b,_),viaje(b,c,_)).
	vali(viaje(b,c,_),viaje(c,d,_)).
	vali(viaje(c,d,_),viaje(d,a,_)).
	vali(viaje(d,a,_),viaje(a,b,_)).

%--------------------------------------------------------------------------------------------------------------------

% b. tiempoViaje(L1, TV) : Predicado que encuentra el tiempo de viaje en TV de la lista de tramos de viajes L1.


	tiempoViaje([V1,V2],T)    :- vali(V1,V2),tiempo2(V1,V2,T).
	tiempoViaje([V1,V2|L1],T) :- vali(V1,V2),tiempo2(V1,V2,T1),valido2([V2|L1]),tiempoViaje([V2|L1],T2),
			             T is T1 + T2.

	tiempo2(viaje(_,_,T1),viaje(_,_,T2),T):- vali(viaje(_,_,T1),viaje(_,_,T2)),T2 > T1,T is T2-T1,!.	
	tiempo2(viaje(_,_,T1),viaje(_,_,T2),T):- T is T1 - T2.
	
% c. tiempoCorto(L1, TC): Predicado que encuentra el tiempo mas corto de viaje

tiempoCorto([viaje(S,L,T)],T):-!.
tiempoCorto([viaje(S,L,T)|V],TC):-tiempoCorto(V,TC1),menor(TC1,T,TC),!.	




















