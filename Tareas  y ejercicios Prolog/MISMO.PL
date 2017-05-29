% Author:
% Date: 25/04/2008
%INTEGRANTES :  ELIANA ZURUGUAY CORCUY %

igual(X,X).
igual(Y,Y,Y).

lugar(punto(X,Y),1):-X>0,Y>0,!.
lugar(punto(X,Y),2):-X<0,Y>0,!.
lugar(punto(X,Y),3):-X<0,Y<0,!.
lugar(punto(X,Y),4):-X>0,Y<0,!.
lugar(punto(X,Y),5):-enEjeX(punto(X,Y)),!.
lugar(punto(X,Y),6):-enEjeY(punto(X,Y)).

%predicado que es True si P1 se encuentra en un cuadrante y no en los ejes
enCuadrante(P1):- not(enEjeX(P1)),
                  not(enEjeY(P1)).

%predicado que devuelve en L1 en cuadrante al que pertenece el punto , no asi en un eje
enCuadrante(P1,L1):-enCuadrante(P1),lugar(P1,L),L1 is L.

enEje(P1):-enEjeX(P1);enEjeY(P1).
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


%PRACTICO %
%Predicado que encuentra el lugar del punro P1 en el plano cartesiano%
lugarPunto(P1,L1):-lugar(P1,L) ,L1 is L. 

%predicado que es True si los puntos P1 y P2  se encuentran en el mismo cuadrante%
mismoCuadrante(P1,P2):-lugar(P1,L1),lugar(P2,L2),igual(L1,L2),not(igual(L1,5)),not(igual(L1,6)).

%predicado que es true si el punto P1 se encuentra dentro de un circunferencia
% con centro en el origen y radio R

estaDentro(P1,R):-distancia(P1,punto(0,0),D),(D<R;igual(D,R)).

%predicado que es true , si los puntos P1 y P2 se encuentran
% sobre ejes de coordenadas diferentes
sobreEjesDiferentes(P1,P2):-ejesDif(P1,P2).

%Predicado que es True, si los puntos P1 y P2 se encuentran en cuadrantes
%diametralmente opuestos

cuadrantesOpuestos(P1,P2):- lugar(P1,L1) , lugar(P2,L2) ,
                         ( (igual(L1,1), igual(L2,3) );
                           (igual(L1,3), igual(L2,1) );
                           (igual(L1,2), igual(L2,4) );
                           (igual(L1,4), igual(L2,2) )).



% Predicado que es True, si los puntos P1 y P2 se encuentran uno en eje cualquiera
%y el otro en un cuadrante


ejeCuadrante(P1,P2):-( enEje(P1) ,enCuadrante(P2) ) ;
                     ( enEje(P2) ,enCuadrante(P1) ).
                     

%Predicado que es True, si los puntos P1 ,P2 Y P3 se encuentran en lugares diferentes
%en el plano cartesiano

lugarDif(P1,P2,P3):-lugar(P1,Z) ,
                    lugar(P2,Z1) ,
                    lugar(P3,Z2) ,
                    not(igual(Z,Z1,Z2)).
                    
%Predicado que esncuentra la distancia en D1 entre los puntos P1 y P2.
distancia(punto(X1,Y1),punto(X2,Y2),D1):-D1 is sqrt((X1-X2)**2+(Y1-Y2)**2).

%Predicado que encuentra el punto medio  en Pm entre los puntos P1 y P2
%en X=(X2+X1)/2 y en Y=(y2+y1)/2
puntoMedio(punto(X1,Y1),punto(X2,Y2),XX,YY):-XX is (X2+X1)/2 ,
                                             YY is (Y2+Y1)/2 .





%EJERCICIOS SOBRE RECTAS
% 1) Predicado que es True , si la recta R1 es un recta vertical
vertical( recta(punto(X1,Y1),punto(X2,Y2)) ):-igual(X1,X2).

% 2)Predicado que es True , si la recta R1 es horizontal
horizontal( recta(punto(X1,Y1),punto(X2,Y2)) ):-igual(Y1,Y2).

% 3) Predicado que encuentra la pendiente de la recta R1 en Pend.
pendiente(recta(punto(X1,Y1),punto(X2,Y2)),P):-  not(vertical( recta(punto(X1,Y1),punto(X2,Y2)))),
                                                 not(horizontal( recta(punto(X1,Y1),punto(X2,Y2)))),
                                                 Y is Y2-Y1,
                                                 X is X2-X1,
                                                 P is (Y/X),!.
pendiente(recta(punto(X1,Y1),punto(X2,Y2)),P):- (vertical( recta(punto(X1,Y1),punto(X2,Y2))),write('recta vertical'));
                                                (horizontal( recta(punto(X1,Y1),punto(X2,Y2))),write('recta horizontal')) .

pendiente(recta(punto(X1,Y1),punto(X2,Y2)),p(X,Y)):- Y is Y2-Y1,
                                                     X is X2-X1.
                                                     

% 4)Predicado que es true si la recta r1 y r2 estan encimados
encimados(R1,R2):-igual(R1,R2).

% 5)Predicado que es True si las rectas R1 y R2 son Rectas Paralelas
%dos rectas son paralelas si tienen la misma pendiente
paralelas(R1,R2):-pendiente(R1,P1),pendiente(R2,P2),igual(P1,P2).

% 6)Predicado que es True si R1 Y R2 son rectas perpendiculares
%Dos rectas con pendientes m1 y m2 son perpendiculares si y sólo si m1m2 = -1.
perpend(R1,R2):-pendiente(R1,P1),pendiente(R2,P2),M is P1*P2,igual(M,-1).

% 7)Predicado que es Tie si las rectas R1 y R2 tienen interseccion en el punto P1.
puntoIntersec(recta(punto(X1,Y1),punto(X2,Y2)),recta(punto(X11,Y11),punto(X22,Y22)),punto(X,Y)):- pendiente(recta(punto(X1,Y1),punto(X2,Y2)),P1),
                                                                                                 pertenece(punto(X1,Y1),punto(X,Y),P1),
                                                                                                 pendiente(recta(punto(X11,Y11),punto(X22,Y22)),P2),
                                                                                                 pertenece(punto(X11,Y11),punto(X,Y),P2).


%  prediCado que es true si el punto(X1,Y1) intersecta a la recta con punto(X,Y) y pediente P
pertenece(punto(X,Y),punto(X1,Y1),P):-XX is X1-X,
                                      YY is Y1-Y,
                                      PEND is YY/XX,
                                      (igual(P,PEND)).

%  8)Predicado que es True si la ecuacion de la recta E1 corresponde a la recTA R1
%La ecuacion de una recta se representa por ecuacion(a,b,c), donde a,b,c son los coeficientes
%de la ecuacion de una recta.
ecuacionRecta(recta(punto(X1,Y1),punto(X2,Y2)),ecuacion(A,B,C)):-satisface(ecuacion(A,B,C),punto(X1,Y1)),
                                                                 satisface(ecuacion(A,B,C),punto(X2,Y2)) .

% 9)Predicado que es True , si el punto P1 satisface la ecuacion de la recta E1.

satisface(ecuacion(A,B,C),punto(X,Y)):-A1 is (A*X)+(B*Y),
                                       C1 is C*(-1),
                                       (igual(A1,C1)).
                                       

%EJERCICIOS SOBRE TRIANGULOS

% 1) Predicado que es True si los triangulos T1,T2 Son iguales
iguales(T1,T2):-igual(T1,T2).


%2) Predicado que es True si los puntos del triangulo T1 se encuentran en una misma recta
sobreRecta(triangulo(P1,P2,P3)):-horizontal(recta(P1,P2));vertical(recta(P1,P2));
                                 horizontal(recta(P1,P3));vertical(recta(P1,P3));
                                 horizontal(recta(P2,P3));vertical(recta(P2,P3)).


%3) Predicado que es True, si el triangulo T1 se encuentra enteramente en un unico cuadrante
enCuadrante(triangulo(P1,P2,P3)):- enCuadrante(P1,L1),
                                   enCuadrante(P2,L2),
                                   enCuadrante(P3,L3),
                                   igual(L1,L2,L3).
                                   

%4) Predicado que es true, si el triangulo  T1 es cortado por alguno de los ejes cartesianos .
%corteEje(T1):- .

%5) Predicado que es true si el triangulo es un triangulo rectangulo
% Un triangulo es rectangulo si cumple con el teorema de Pitagoras
trianguloRect(T1):-pitagoras(T1).

%6) Predicado que es True , si el triangulo dado es un triangulo isosceles   .
%Es isosceles si
%trianguloIsosceles(T1):-.


%7) Predicado que es True si los triangulos T1 Y T2 estan unidos por un vertice  .
unidoPorPunto(triangulo(P1,P2,P3),triangulo(P4,P5,P6)):- igual(P1,P4);igual(P1,P5);igual(P1,P6);
                                                         igual(P2,P4);igual(P2,P5);igual(P2,P6);
                                                         igual(P3,P4);igual(P3,P5);igual(P3,P6).
%8) Predicado que es True , si los triangulos T1 y T2 estan unidos por un lado  .
%unidoPorLado(T1,T2):-.

%9) Predicado que es True, si el triagulo T1 cumple con el teorema de Pitagoras .
pitagoras(triangulo(P1,P2,P3)):-distancia(P1,P2,A),
                                distancia(P1,P3,B),
                                distancia(P2,P3,C),
                               ((C1 is A**2+B**2,igual(C1,C));
                                (C1 is A**2+C**2,igual(C1,B));
                                (C1 is C**2+B**2,igual(C1,A))).
								
								
%9) Predicado que es True, SI LOS ELEMENTOS DE LA LISTA PERTENECEN AL MISMO PUNTO
mismoLugar([X]):-!.
mismoLugar([X,Y]):-mismoCuadrante(X,Y).
mismoLugar([X,Y|L]):-mismoCuadrante(X,Y),mismoLugar([Y|L]).





                                       


