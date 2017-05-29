% Author:
% Date: 24/06/2008
%REGLAS DE AYUDA A LOS EJERECICIOS
lugar(punto(0,0),0).
lugar(punto(X,Y),1):-X>0,Y>0,!.
lugar(punto(X,Y),2):-X<0,Y>0,!.
lugar(punto(X,Y),3):-X<0,Y<0,!.
lugar(punto(X,Y),4):-X>0,Y<0,!.
%EJE X, Y=0
lugar(punto(_,0),5).
%EJE y, X=0
lugar(punto(0,_),6).
%DOS ELEMENTOS IGUALES
igual(X,X).
%SI ESTA EN EL EJE EL VALOR INDICADO
esEje(5).
esEje(6).
%punto medio de a dos
mitad(X,Y,M):-M is (X+Y)/2.
puntoMedio(punto(X1,Y1),punto(X2,Y2),punto(XM,YM)):-mitad(X1,X2,XM),mitad(Y1,Y2,YM).
%distancia de dos puntos
distancia(punto(X1,Y1),punto(X2,Y2),D):-D is sqrt( ((X2-X1)*(X2-X1))+((Y2-Y1)*(Y2-Y1)) ).
%CONCATENAR
conc([],L,L).
conc(L,[],L).
conc([X|L],L2,[X|L3]):-conc(L,L2,L3).
%X es menor a Y
menor(X,Y):-X<Y.


%FIN DE REGLAS

%1) El menor de la lista por X
esMenorX(punto(X,_),punto(Y,_)):-X<Y.
menorX(X,Y,X):-esMenorX(X,Y),!.
menorX(X,Y,Y):-esMenorX(Y,X).
menorX([X],X):-!.
menorX([X|L],P):-menorX(L,P1),menorX(P1,X,P).

%2) El menor de la lista por Y
esMenorY(punto(_,X),punto(_,Y)):-X<Y.
menorY(X,Y,X):-esMenorY(X,Y),!.
menorY(X,Y,Y):-esMenorY(Y,X).
menorY([Y],Y):-!.
menorY([Y|L],P):-menorY(L,P1),menorY(P1,Y,P).

%3) El mayor de la lista por X
mayorX(X,Y,X):- not(esMenorX(X,Y)),!.
mayorX(X,Y,Y):- not(esMenorX(Y,X)).
mayorX([Y],Y):-!.
mayorX([Y|L],P):-mayorX(L,P1),mayorX(P1,Y,P).

%4) El mayor de la lista por Y
mayorY(X,Y,X):-not(esMenorY(X,Y)),!.
mayorY(X,Y,Y):-not(esMenorY(Y,X)).
mayorY([Y],Y):-!.
mayorY([Y|L],P):-mayorY(L,P1),mayorY(P1,Y,P).

%5) Mismo lugar
mL(X,Y):-lugar(X,L1),lugar(Y,L2),igual(L1,L2).
mismoLugar([_]).
mismoLugar([X,Y|L]):-mL(X,Y),mismoLugar([Y|L]).

%6) puntos diferentes
esta([X],X).
esta([X|_],Y):-igual(X,Y),!.
esta([_|L],Y):-esta(L,Y).
puntosDif([_]).
puntosDif([X|L]):-not(esta(L,X)),puntosDif(L).

%7) lineal(L). si los puntos estan en una linea

%8) mimosPuntos(L). si los puntos son los mismos
mimosPuntos([_]).
mimosPuntos([X,Y|L]):-igual(X,Y),mimosPuntos([Y|L]).

%9. distancia(L1, D1) : Predicado que encuentra la distancia total de la lista de puntos L1.
distancia([X,Y],D):-distancia(X,Y,D).
distancia([X,Y|L],D):- distancia([Y|L],D1)
                      ,distancia(X,Y,D2)
                      ,D is D1+D2.

%10. soloEjes(L1) : si todos los puntos de L1 se encuentran en los ejes del plano cartesiano.
soloEjes([X]):-lugar(X,Lu),esEje(Lu),!.
soloEjes([X|L]):- lugar(X,Lu),esEje(Lu)
                 ,soloEjes(L).

%11. ascendentes(L1) : Predicado que es True, si la lista de puntos son ascendente en X.
ascendentes([_]).
ascendentes([X,Y|L]):- esMenorX(X,Y)
                      ,ascendentes([Y|L]).

%12. cantidadEje(L1, Q1) : Predicado que encuentra la cantidad de puntos que se encuentran los ejes del plano cartesiano.
cantidadEje([X],0):-lugar(X,Lu),not(esEje(Lu)),!.
cantidadEje([_],1).
cantidadEje([X|L],Q):- cantidadEje(L,Q1)
                      ,lugar(X,Lu)
                      ,((esEje(Lu),Q is Q1+1)
                      ;Q is Q1).

%13. puntosMedios(L1, L2) : Predicado que encuentra los puntos medios en L2, de cada segmento de la lista L1.
puntosMedios([X,Y],[PM]):-puntoMedio(X,Y,PM).
puntosMedios([X,Y|L],LM):- puntosMedios([Y|L],LM1)
                          ,puntoMedio(X,Y,PM)
                          ,conc([PM],LM1,LM).
                          
%14. menorDist(L1, Me) : menor distancia definida
menorDist([X,Y],Dm):-distancia(X,Y,Dm).
menorDist([X,Y|L],Dm):- menorDist(L,Dm1)
                      , distancia(X,Y,Dm2)
                      ,( (menor(Dm2,Dm1),Dm is Dm2)
                      ;Dm is Dm1 ).

%15) viaje, primero debe ser valido, luego mostrar los tiempos de viaje y luego de espera.
viajeValido(viaje(X,Y)):-X<Y.
esperaValida(viaje(_,Y1),viaje(X2,_)):-Y1=<X2.

valido([X]):-viajeValido(X),!.
valido([X,Y|L]):- viajeValido(X)
                 ,esperaValida(X,Y)
                 ,valido([Y|L]).

tV(viaje(X,Y),TV):-TV is Y-X.
tiempoViaje([X],[TV]):-tV(X,TV),!.
tiempoViaje([X|L],LTV):- tiempoViaje(L,LTV1)
                        ,tV(X,TV)
                        ,conc([TV],LTV1,LTV).
tE(viaje(_,L1),viaje(S2,_),TE):-TE is S2-L1.
tiempoEspera([X,Y],[TE]):-tE(X,Y,TE).
tiempoEspera([X,Y|L],LTE):- tiempoEspera([Y|L],LTE1)
                           ,tE(X,Y,TE)
                           ,conc([TE],LTE1,LTE).

tramos(L):- valido(L)
           ,tiempoViaje(L,LTV)
           ,print('LOS TIEMPO DE viaje DE CADA VUELO SON LOS SIGUIENTES'),nl
           ,print(LTV),nl
           ,tiempoEspera(L,LTE)
           ,print('LOS TIEMPO DE ESPERA ENTRE VUELOS SON'),nl
           ,print(LTE),nl,!.
tramos(_):-print('LOS DATOS DE LOS TRAMOS DE VIAJE SON ERRONEOS'),nl.
