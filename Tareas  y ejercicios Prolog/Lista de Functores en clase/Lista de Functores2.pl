% Materia: PROGRAMACION LOGICA Y FUNCIONAL

% Autor: BISMARCK VILLCA SOLIZ

/*----------------------------------------------------------------------------*/
/* LISTA DE FUNCTORES
/*----------------------------------------------------------------------------*/
menordeX(punto(X,Y),punto(Z,T),punto(X,Y)):-X<Z,!.
menordeX(punto(X,Y),punto(Z,T),punto(Z,T)):-!.
/*----------------------------------------------------------------------------*/
menordeY(punto(X,Y),punto(Z,T),punto(X,Y)):-Y<T,!.
menordeY(punto(X,Y),punto(Z,T),punto(Z,T)):-!.
/*----------------------------------------------------------------------------*/
mayordeY(punto(X,Y),punto(Z,T),punto(X,Y)):-Y>T,!.
mayordeY(punto(X,Y),punto(Z,T),punto(Z,T)):-!.
/*----------------------------------------------------------------------------*/
mayordeX(punto(X,Y),punto(Z,T),punto(X,Y)):-X>Z,!.
mayordeX(punto(X,Y),punto(Z,T),punto(Z,T)):-!.
/*----------------------------------------------------------------------------*/
cuadraN(punto(0,0),0):-!.
cuadraN(punto(X,Y),1):-X>0,Y>0,!.
cuadraN(punto(X,Y),2):-X<0,Y>0,!.
cuadraN(punto(X,Y),3):-X<0,Y<0,!.
cuadraN(punto(X,Y),4):-X>0,Y<0,!.
cuadraN(punto(X,0),5):-X=\=0,!.
cuadraN(punto(0,Y),6):-Y=\=0,!.
/*----------------------------------------------------------------------------*/
%mismocuadrente
cuadraN1(P1,P2):-cuadraN(P1,C),cuadraN(P2,C1),C=:=C1.

pendiente(punto(X1,Y1),punto(X2,Y2),M):-(X1=\=X2,M is (Y2-Y1)/(X2-X1)),!;(M is 1).
/*----------------------------------------------------------------------------*/
/*1.-*/
menorX([punto(X,Y)],punto(X,Y)):-!.
menorX([punto(X,Y)|L1],L):-menorX(L1,punto(T,F)),menordeX(punto(T,F),punto(X,Y),L).
/*----------------------------------------------------------------------------*/
/*2.-*/
menorY([punto(X,Y)],punto(X,Y)):-!.
menorY([punto(X,Y)|L1],L):-menorY(L1,punto(T,F)),menordeY(punto(T,F),punto(X,Y),L).
/*----------------------------------------------------------------------------*/
/*3.-*/
mayorX([punto(X,Y)],punto(X,Y)):-!.
mayorX([punto(X,Y)|L1],L):-mayorX(L1,punto(T,F)),mayordeX(punto(T,F),punto(X,Y),L).
/*----------------------------------------------------------------------------*/
/*4.-*/
mayorY([punto(X,Y)],punto(X,Y)):-!.
mayorY([punto(X,Y)|L1],L):-mayorY(L1,punto(T,F)),mayordeY(punto(T,F),punto(X,Y),L).
/*----------------------------------------------------------------------------*/
/*5.-*/
mismoLug([]):-!.
mismoLug([punto(X,Y)]):-!.
mismoLug([punto(X,Y),punto(Z,T)|L1]):-cuadraN(punto(X,Y),C),cuadraN(punto(Z,T),C1),
                                      C=:=C1,mismoLug([punto(Z,T)|L1]).
/*----------------------------------------------------------------------------*/
/*6.- */
puntosDif([punto(X,Y)]):-!.
puntosDif([punto(X,Y),punto(Z,T)|L1]):-(X=\=Z,!;Y=\=T),puntosDif([punto(X,Y)|L1]),
                                       puntosDif([punto(Z,T)|L1]).
/*----------------------------------------------------------------------------*/
/*7.- */
lineal([punto(X,Y)]):-!.
lineal([punto(X1,Y1),punto(X2,Y2)|L1]):-pendiente(punto(X1,Y1),punto(X2,Y2),M),
                                        lineal([punto(X2,Y2)|L1],M).
/*----------------------------------------------------------------------------*/
lineal([punto(X,Y)],M):-!.
lineal([punto(X1,Y1),punto(X2,Y2)|L1],M):-pendiente(punto(X1,Y1),punto(X2,Y2),M1),
                                          M=:=M1,
                                          lineal([punto(X2,Y2)|L1],M).
/*----------------------------------------------------------------------------*/
/*8.- */
mismoPuntos([punto(X,Y)]):-!.
mismoPuntos([punto(X,Y),punto(Z,T)|L1]):-(X=:=Z,!;Y=:=T),mismoPuntos([punto(X,Y)|L1]),
                                                         mismoPuntos([punto(Z,T)|L1]).
/*----------------------------------------------------------------------------*/
/*9.- */
distancia([punto(X,Y)],0):-!.
distancia([punto(X,Y),punto(X1,Y1)|L1],D):-distancia([punto(X1,Y1)|L1],D1),
                                           D is D1+(sqrt((X1-X)^2 + (Y1-Y)^2)),!.
/*----------------------------------------------------------------------------*/
/*10.-*/
soloEjes([punto(X,0)]):-!.
soloEjes([punto(0,Y)]):-!.
soloEjes([punto(X,0)|L1]):-soloEjes(L1),!.
soloEjes([punto(0,Y)|L1]):-soloEjes(L1),!.
/*----------------------------------------------------------------------------*/
/*11.-*/
ascendentes([punto(X,Y)]):-!.
ascendentes([punto(X,Y),punto(X1,Y1)|L1]):-X1>=X,ascendentes([punto(X1,Y1)|L1]),!.
/*----------------------------------------------------------------------------*/
/*12.- */
cantidadEje([punto(X,Y)],1):-X=:=0,!;Y=:=0,!.
cantidadEje([punto(X,Y)],0):-!.
cantidadEje([punto(X,0)|L1],Q1):-cantidadEje(L1,Q2),Q1 is Q2+1,!.
cantidadEje([punto(0,Y)|L1],Q1):-cantidadEje(L1,Q2),Q1 is Q2+1,!.
cantidadEje([punto(X,Y)|L1],Q1):-cantidadEje(L1,Q1),!.
/*----------------------------------------------------------------------------*/
/*13.- */
puntosMedios([punto(X,Y),punto(X1,Y1)],[punto(X2,Y2)]):-X2 is (X+X1)/2,Y2 is (Y+Y1)/2,!.
puntosMedios([punto(X,Y),punto(X1,Y1)|L1],[punto(X2,Y2)|L2]):-X2 is (X+X1)/2 ,Y2 is (Y+Y1)/2,
                                                                 puntosMedios([punto(X1,Y1)|L1],L2).
/*----------------------------------------------------------------------------*/
/*14.- menor_distancia */
distancia(punto(X1,Y1), punto(X2,Y2), D1):- D1 is sqrt((X1- X2)**2 +(Y1-Y2)**2).
menorDist([],0):-!.
menorDist([_],0):-!.
menorDist([punto(X,Y),punto(X1,Y1)|L1],Me):-distancia(punto(X,Y), punto(X1,Y1), Me1),Me1 < Me,
                                            menorDist([punto(X1,Y1)|L1],Me1).
menorDist([punto(X,Y),punto(X1,Y1)|L1],Me):-menorDist([punto(X1,Y1)|L1],Me).
/*----------------------------------------------------------------------------*/
% ------ 15 --- a).-
valido([viaje(S1,L1)]):-S1<L1,!.
valido([viaje(S1,L1),viaje(S2,L2)|V]):-S1<L1,L1<S2,S2<L2,valido([viaje(S2,L2)|V]).
/*----------------------------------------------------------------------------*/
% ------ 15 --- b).-
tiempoViaje([viaje(S,L)],TV):-TV is L-S,!.
tiempoViaje([viaje(S,L)|V],TV):-tiempoViaje(V,TV1),TV is (TV1+L-S).
/*----------------------------------------------------------------------------*/
% ------ 15 --- c).-
tiempoEspera([_],0):-!.
tiempoEspera([viaje(S1,L1),viaje(S2,L2)|V],TE):-tiempoEspera([viaje(S2,L2)|V],TE1),
                                                TE is (TE1+S2-L1).
/*----------------------------------------------------------------------------*/
% ------ 16 --- a).-
%valido.
/*----------------------------------------------------------------------------*/
% ------ 16 --- b).-
tiempoViaje([viaje(S,L,T)],T):-!.
tiempoViaje([viaje(S,L,T)|V],TV):-tiempoViaje(V,TV1),TV is T+TV1.
/*----------------------------------------------------------------------------*/
% ------ 16 --- c).-
tiempoCorto([viaje(S,L,T)],T):-!.
tiempoCorto([viaje(S,L,T)|V],TC):-tiempoCorto(V,TC1),menor(TC1,T,TC),!.
/*----------------------------------------------------------------------------*/