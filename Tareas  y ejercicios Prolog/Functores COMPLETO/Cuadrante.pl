%------------------------practico 5-------------------------------------+

% Programación Lógica, Functores.
% Lic. Edwin Vargas Yapura.

%----------------------A. Ejercicios sobre Puntos.----------------------+

lugar(punto(X, Y), 1):- X > 0, Y >0, !.

lugar(punto(X, Y), 2):- X < 0, Y >0, !.

lugar(punto(X, Y), 3):- X < 0, Y <0, !.

lugar(punto(X, Y), 4):- X > 0, Y <0, !.

lugar(punto(X, Y), 5):- Y=0, !.

lugar(punto(X, Y), 6):- X=0, !.

lugar(punto(X, Y), 0):- X=0, Y=0.

distancia1(punto(X1, Y1), punto(X2, Y2), D1):- D1 is sqrt((X2 - X1)**2+(Y2 - Y1)**2).


% 1. lugar(P1; L1) : Predicado que encuentra el lugar del punto P1 en el plano cartesiano.

lugar1(P1, L1):- lugar(P1, L1).


%2. mismoCuadrante( P1, P2 ) : Predicado que es True, si los puntos P1 y P2 se encuentran en el mismo cuadrante.

mismoCuadrante( P1, P2 ):- lugar(P1, Q1), lugar(P2, Q1).


% 3. estaDentro( P1, R ): Predicado que es True, si el punto P1 se encuentra dentro de una circunferencia con centro en el origen y radio R.

estaDentro( P1, R ):- distancia(P1, punto(0,0), D1), D1 =< R.


% 4. sobreEjesDiferentes( P1, P2 ) : Predicado que es True, si los puntos P1 y P2 se encuentran sobre ejes de coordenadas diferentes.

sobreEjesDiferentes( P1, P2 ) :- lugar(P1, 5), lugar(P2, 6), !.

sobreEjesDiferentes( P1, P2 ) :- lugar(P1, 6), lugar(P2, 5).


% 5. cuadrantesOpuesto( P1, P2 ) : Predicado que es True, si los puntos P1 y P2 se encuentran en cuadrantes diametralmente opuestos.

cuadrantesOpuesto( P1, P2 ) :- lugar(P1, 1), lugar(P2, 3), !.

cuadrantesOpuesto( P1, P2 ) :- lugar(P1, 3), lugar(P2, 1), !.

cuadrantesOpuesto( P1, P2 ) :- lugar(P1, 2), lugar(P2, 4), !.

cuadrantesOpuesto( P1, P2 ) :- lugar(P1, 4), lugar(P2, 2).


% 6. ejeCuadrante( P1, P2 ) : Predicado que es True, si los puntos P1 y P2 se encuentran uno en un eje cualquiera y el otro en un cuadrante cualquiera.

ejeCuadrante( P1, P2 ) :- lugar(P1, Q1), lugar(P2, Q2), (Q1=:=1; Q1=:=2; Q1=:=3; Q1=:=4), (Q2=:=5; Q2=:=6), !.

ejeCuadrante( P1, P2 ) :- lugar(P1, Q1), lugar(P2, Q2), (Q2=:=1; Q2=:=2; Q2=:=3; Q2=:=4), (Q1=:=5; Q1=:=6).


% 7. lugaresDif ( P1, P2, P3 ) : predicado que es True, si los puntos P1, P2 y P3 se encuentran en lugares diferentes en el plano cartesiano.

lugaresDif(P1, P2, P3):- lugar(P1 ,C), lugar(P2 ,C1), lugar(P3 ,C2),
			 C =\= C1,C =\= C2,C1 =\= C2.


% 8. distancia( P1, P2, Dist ) : Predicado que encuentra la distancia en Dist entre los puntos P1 y P2.

distancia( P1, P2, Dist ) :- distancia1(P1, P2, Dist).


% 9. puntoMedio( P1, P2, PM ) : Predicado que es encuentra el punto medio en PM, entre los puntos P1 y P2.

puntom(punto(X1, Y1), punto(X2, Y2), punto(XM, YM)):- XM is ((X2 + X1)/2), YM is ((Y2 + Y1)/2).

puntoMedio( P1, P2, PM) :-  puntom(P1, P2, PM).


% 10. Plantear otros predicados que manipulen uno, dos o tres puntos.

%------------------------------------OTROS EJERCICIOS-------------------------+

enEjeX(P1):- lugar(P1, Q1), Q1=:=5 .

enEjeY(P1):- lugar(P1, Q1), Q1=:=6 .

mismoEje(P1, P2):- enEjeX(P1), enEjeX(P2), !.
mismoEje(P1, P2):- enEjeY(P1), enEjeY(P2).


mismoEje(P1, P2):- lugar(P1, Q1), lugar(P1, Q2), Q1=:=6, Q2=:=6 .

equidistante(P1, P2, P3):- distancia(P1, P2, D), distancia(P1, P3, D), distancia(P2, P3, D).


% B Ejercicios sobre Rectas _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


% 1. vertical( R1 ) : Predicado que es True, si la recta R1 es una recta vertical.

vert(seg(punto(X1, Y1), punto(X1, Y2))).

vertical( R1 ) :- vert(R1).


% 2. horizontal( R1 ) : Predicado que es True, si la recta R1 es horizontal.

horiz(seg(punto(X1, Y1), punto(X2, Y1))).

horizontal( R1 ):- horiz(R1).


% 3. Pendiente( R1, Pend ) : Predicado que encuentra la pendiente de la recta R1 en Pend.

pend1(seg(punto(X1, Y1), punto(X2, Y2)), P):- P is ((Y2 - Y1)/(X2 - X1)).

pendiente( R1, Pend ) :- pend1(R1, Pend).


% 4. encimados( R1, R2 ) : Predicado que es True, si las recta R1 y R2 están encimados.

enc(seg(punto(X1, Y1), punto(X2, Y2)), seg(punto(X1, Y1), punto(X2, Y2))).

encimados( R1, R2 ) :- enc(R1, R2).


5. paralelas( R1, R2 ): Predicado que es True, si las rectas R1 y R2 son rectas paralelas

paralelas( R1, R2 ):- pendiente(R1, P1), pendiente(R2, P1).



% 6. perpend( R1, R2 ) : Predicado que es True, si las rectas R1 y R2 son perpendiculares.

perpend( R1, R2 ) :- pendiente(R1, P1), pendiente(R2, P2), P1=:=(-1/P2).

puntointer(seg(P1,P2), seg(P3,P4), P5):- pendiente(seg(P1, P5), P1), pendiente(seg(P3, P5), P2),
					 pendiente(seg(P1, P2), P1), pendiente(seg(P3, P4), P2).


%%%% 7. puntoIntersec( R1, R2, P1 ) : Predicado que es True, si las rectas R1 y R2 tiene intersección en el punto P1.

puntoIntersec( R1, R2, P1 ) :-  puntointer(R1, R2, P1).


%%%% 8. ecuacionRecta( R1, E1 ) : Predicado que es True, si la ecuación de Recta E1 corresponde a la recta R1. La ecuación de una recta se representa por: ecuación(a, b, c), dónde a, b y c son los coeficientes de la ecuación de una recta.

corresponde(seg(punto(X1, Y1), punto(X2, Y2)), ecuación(A, B, C)):- ((A*X1)+(B*Y1)+C)=:=0,
								    ((A*X2)+(B*Y2)+C)=:=0.
ecuacionRecta( R1, E1 ) :-  corresponde(R1, E1).


%%%% 9. satisface( E1, P1 ) : Predicado que es True, si el punto P1, satisface la ecuación de la recta E1.

satisface1(ecuacion(A, B, C), punto(X1, Y1)):- (A*X1)+ (B*Y1)+ C =:=0.

satisface( E1, P1 ) :- satisface1(E1, P1).

%------------------------OTROS EJERCICIOS-----------------------------------+

%predicado que es true si las rectas son paralelas comparando E1 y R1

paralela1(ecuacion(A, B, C), seg(P1, P2)):- M is (-A/B), pendiente(P1, P2, M).

paralelas(E1, R1):- paralela1(E1, R1).


%predicado que devuelve el angulo de inclinacion de una recta

inclinacion(R1, Ang):- pendiente(R1, Pend), Ang is atan(Pend).


%C. Ejercicios sobre Triángulos. _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


iguales1(seg(P1, P2, P3), seg(P1, P2, P3)).

iguales( T1, T2 ):- iguales1(T1, T2).

sobreRecta1(seg(P1, P2, P3)):- pendiente(seg(P1, P2), Pend1), pendiente(seg(P2, P3), Pend1).

sobreRecta( T1 ):- sobreRecta1(T1).

enCuadrante1(seg(P1, P2, P3)):- lugar(P1, Q1), lugar(P2, Q1), lugar(P3, Q1).

enCuadrante( T1 ) :-   enCuadrante1(T1).

corteEje1(seg(P1, P2, P3)):- not(lugar(P1, Q1)), lugar(P2, Q1), lugar(P3, Q1).

corteEje( T1 ) :- corteEje1(T1).

trianguloRect1(seg(P1, P2, P3)):- distancia(P1, P2, D1), distancia(P1, P3, D2),
				  distancia(P2, P3, D3), ((D1**2)+(D3**2))=:=(D2**2).

trianguloRect( T1 ) :- trianguloRect1(T1).

trianguloIsosceles1(seg(P1, P2, P3)):- distancia(P1, P2, D1), distancia(P1, P3, D2),
				      distancia(P2, P3, D3), (D1=D2 ; D1=D3; D2= D3).

trianguloIsosceles( T1 ) :- trianguloIsosceles1(T1).

unidoPorPunto1(seg(P1, P2, P3), seg(P4, P5, P6)):- P1=P4; P1=P5; P1=P6;
						   P2=P4; P2=P5; P2=P6;
						   P3=P4; P3=P5; P3=P6.

unidoPorPunto( T1, T2 ) :- unidoPorPunto1(T1, T2).

iguales(P1, P1).

unidoPorLado1(seg(P1, P2, P3), seg(P4, P5, P6)):- (iguales(P1, P4); iguales(P1, P5);
						 iguales(P1, P6)), (iguales(P2, P4);
						 iguales(P2, P5); iguales(P2, P6)), !.

unidoPorLado1(seg(P1, P2, P3), seg(P4, P5, P6)):- (iguales(P1, P4); iguales(P1, P5);
						 iguales(P1, P6)), (iguales(P3, P4);
						 iguales(P3, P5); iguales(P3, P6)), !.

unidoPorLado1(seg(P1, P2, P3), seg(P4, P5, P6)):- (iguales(P2, P4); iguales(P2, P5);
						 iguales(P2, P6)), (iguales(P3, P4);
						 iguales(P3, P5); iguales(P3, P6)), !.


unidoPorLado( T1, T2 ) :- unidoPorLado1(T1, T2).

pitagoras(T1) :- trianguloRect( T1 ).

%------------------OTROS EJERCICIOS-----------------------------+

%predicado que es true si P1, P2, P3, P4 forman un paralelogramo

paralelogramo(P1, P2, P3, P4):- pendiente(seg(P1, P2), Pend1), pendiente(seg(P4, P3), Pend1),
			        pendiente(seg(P1, P4), Pend2), pendiente(seg(P2, P3), Pend2).








