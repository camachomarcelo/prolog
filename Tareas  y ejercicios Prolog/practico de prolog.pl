% Author:
% Date: 25/04/2008
%INTEGRANTES :  ELIANA ZURUGUAY CORCUY %
igual(X,X).
igual(Y,Y,Y).

lugar(punto(X,Y),1):-X>0,Y>0,!.
lugar(punto(X,Y),2):-X<0,Y>0,!.
lugar(punto(X,Y),3):-X<0,Y<0,!.
lugar(punto(X,Y),4):-X>0,Y<0,!.
lugar(punto(X,Y),5):-punto(0,_),!.
lugar(punto(X,Y),6):-punto(_,0),!.

enEjeX(punto(_,0)).
enEjeY(punto(0,_)).

lugarDif(P1,P2):-lugar(P1,Z) ,
                 lugar(P2,Z1),
                 not(igual(Z,Z1)).
                                  
lugarDif(P1,P2,P3):-lugar(P1,Z) ,
                    lugar(P2,Z1) ,
                    lugar(P3,Z2)
                   ,not(igual(Z,Z1,Z2)).

ejesDif(P1,P2):-( enEjeX(P1), enEjeY(P2) ) ;
                 ( enEjeX(P2), enEjeY(P1) ) ,
                 (not(igual(P1,P2))).

distancia(punto(X1,Y1),punto(X2,Y2),D1):-D1 is sqrt((X1-X2)**2+(Y1-Y2)**2).
%PRACTICO %
%Predicado que encuentra el lugar del punro P1 en el plano cartesiano%
lugarPunto(P1,L1):-lugar(P1,L1).

%predicado que es True si los puntos P1 y P2  se encuentran en el mismo cuadrante%
mismoCuadrante(P1,P2):-lugar(P1,L1),lugar(P2,L2),igual(L1,L2).

%predicado que es true si el punto P1 se encuentra dentro de un circunferencia
% con centro en el origen y radio R

estaDentro(P1,R):-distancia(P1,punto(0,0),D),(D<R;igual(D,R)).

%predicado que es true , si los puntos P1 y P2 se encuentran %

