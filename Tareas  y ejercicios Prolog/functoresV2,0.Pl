%A EJERCICIOS SOBRE PUNTOS.
%Ejercicios sobre puntos
%Tarea de Programación Lógica

dist(punto(X1,Y1),punto(X2,Y2),D1):- D1 is sqrt((X2-X1)**2+(Y2-Y1)**2).
distancia([P1,P2],D1):-dist(P1,P2,D1),!.
distancia([P1,P2|L1],D1):-distancia([P2|L1],D2),dist(P1,P2,D3), D1 is D2+D3.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 
estaD(punto(X,Y),R):-dist(punto(X,Y),punto(0,0),D),D=<R,!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2
sobreDE(punto(X,Y),punto(X2,Y2)):-X=:=0,Y=\=0,Y2=:=0,X2=\=0,!.
sobreDE(punto(X,Y),punto(X2,Y2)):-X=\=0,Y=:=0,Y2=\=0,X2=:=0,!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3
cuadrantesO(punto(X,Y),punto(X2,Y2)):-X>0,Y>0,X2<0,Y2<0,!.
cuadrantesO(punto(X,Y),punto(X2,Y2)):-X<0,Y<0,X2>0,Y2>0,!.
cuadrantesO(punto(X,Y),punto(X2,Y2)):-X<0,Y>0,X2>0,Y2<0,!.
cuadrantesO(punto(X,Y),punto(X2,Y2)):-X>0,Y<0,X2<0,Y2>0,!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4
ejeC(punto(X,Y),punto(X2,Y2)):-estaE(punto(X,Y)),estaEC(punto(X2,Y2)).
ejeC(punto(X,Y),punto(X2,Y2)):-estaE(punto(X2,Y2)),estaEC(punto(X,Y)).
estaE(punto(X,Y)):-X=:=0,Y=\=0;Y=:=0,X=\=0.
estaEC(punto(X,Y)):-X=\=0,Y=\=0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5
%predicado que devuelve true si dos puntos se encuentran en cuadreantes diferentes.
cuadDif(punto(X1,Y1),punto(X2,Y2),punto(X3,Y3)):-cuad(punto(X1,Y1),Q1),cuad(punto(X2,Y2),Q2),cuad(punto(X3,Y3),Q3),Q1=\=Q2,Q2=\=Q3,Q1=\=Q3,!.

%predicado que retorna ek numero del caudrante donde se encuentra el punto. 
cuad(punto(X,Y),Q):-X=:=0,Y=:=0,Q is 0,!.
cuad(punto(X,Y),Q):-X>0,Y>0,Q is 1,!.
cuad(punto(X,Y),Q):-X<0,Y>0,Q is 2,!.
cuad(punto(X,Y),Q):-X<0,Y<0,Q is 3,!.
cuad(punto(X,Y),Q):-X>0,Y<0,Q is 4,!.
cuad(punto(X,Y),Q):-X=\=0,Y=:=0,Q is 5,!.
cuad(punto(X,Y),Q):-X=:=0,Y=\=0,Q is 6,!.

%predicado que devuelve true si tres puntos se encuentran en cuadrantes iguales.
cuadI(P1,P2,P3):-cuad(P1,Q1),cuad(P2,Q2),cuad(P3,Q3),Q1=:=Q2,Q2=:=Q3,Q1=:=Q3,!.

%predicado que devuelve true si los 3 puntos se encuentran sobre los ejes cartesianos.
sobreE(P1,P2,P3):-estaE(P1),estaE(P2),estaE(P3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%B EJERCICIOS SOBRE TRIANGULOS.
%1
%predicado que devuelve true si 2 triangulos son iguales
iguales(t(P11,P12,P13),t(P21,P22,P23)):-
dist(P11,P12,A1),dist(P12,P13,A2),dist(P13,P11,A3),
dist(P21,P22,B1),dist(P22,P23,B2),dist(P23,P21,B3),
A1=:=B1,A2=:=B2,A3=:=B3.

%predicado que devuelve true si 2 triangulos son iguales en cualquier posicion.
igualesg(t(P11,P12,P13),t(P21,P22,P23)):-
dist(P11,P12,A1),dist(P12,P13,A2),dist(P13,P11,A3),
dist(P21,P22,B1),dist(P22,P23,B2),dist(P23,P21,B3),
iguales(A1,B1,B2,B3),iguales(A2,B1,B2,B3),iguales(A3,B1,B2,B3).

pendiente(X1,Y1,X2,Y2,Pend):-X2=\=X1,Pend is (Y2-Y1)/(X2-X1);Pend is 0.
angulo(punto(X1,Y1),punto(X2,Y2),punto(X3,Y3),punto(X4,Y4),An):-pendiente(X1,Y1,X2,Y2,A),pendiente(X3,Y3,X4,Y4,B),X is atan((B-A)/(1+A*B)),An is (X*180/pi).

iguales(A,B,C,D):-A=:=B,A=\=C,A=\=D;
                 A=:=C,A=\=B,A=\=D;
				 A=:=D,A=\=B,A=\=C.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%				 
%3				 
enCuadrante(t(P1,P2,P3)):-cuad(P1,Q1),
                          cuad(P2,Q2),
				          cuad(P3,Q3),
						  Q1=\=0,Q1=\=5,Q1=\=6,
						  Q1=:=Q2,Q2=:=Q3. 

iguales(punto(X,Y),punto(X1,Y1),punto(X2,Y2),punto(X3,Y3)):-X=:=X1,Y=:=Y1,X=\=X2,Y=\=Y2,X=\=X3,Y=\=Y3;
                                                            X=:=X2,Y=:=Y2,X=\=X1,Y=\=Y1,X=\=X3,Y=\=Y3;
														    X=:=X3,Y=:=Y3,X=\=X2,Y=\=Y2,X=\=X1,Y=\=Y1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5
triangRec(t(P1,P2,P3)):-dist(P1,P2,D1),
                        dist(P2,P3,D2),
					    dist(P3,P1,D3), 
					    round((D1^2))=:=round((D2^2)+(D3^2)),!.
													  
triangRec(t(P1,P2,P3)):-dist(P1,P2,D1),
                        dist(P2,P3,D2),
						dist(P3,P1,D3), 
					    round((D2^2))=:=round((D1^2)+(D3^2)),!.
													  
triangRec(t(P1,P2,P3)):-dist(P1,P2,D1),
                        dist(P2,P3,D2),
						dist(P3,P1,D3), 
						round((D3^2))=:=round((D1^2)+(D2^2)),!.													  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6
triangIsosceles(P1,P2,P3):-dist(P1,P2,D1),
                           dist(P1,P3,D2),	
                           dist(P2,P3,D3),
						   round(D1)=:=round(D2),round(D2)=\=round(D3),!.
						   
triangIsosceles(P1,P2,P3):-dist(P1,P2,D1),
                           dist(P1,P3,D2),
				           dist(P2,P3,D3),
						   round(D1)=:=round(D3),round(D2)=\=round(D3),!.
						   
triangIsosceles(P1,P2,P3):-dist(P1,P2,D1),
                           dist(P1,P3,D2),
 						   dist(P2,P3,D3),
						   round(D3)=:=round(D2),round(D2)=\=round(D1),!.
														 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%													  
%7															
unidoporP(t(P11,P12,P13),t(P21,P22,P23)):-iguales(P11,P21,P22,P32);
										  iguales(P12,P21,P22,P32);
										  iguales(P13,P21,P22,P32).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%8
dosI(punto(X,Y),punto(X1,Y1),punto(X,Y),punto(X1,Y1)).

unidosPL(t(P11,P12,P13),t(P21,P22,P23)):-dosI(P11,P12,P21,P22);
										 dosI(P11,P12,P22,P23);
										 dosI(P11,P12,P23,P21);
										 dosI(P12,P13,P22,P23);
										 dosI(P12,P13,P21,P23);
										 dosI(P12,P13,P21,P22);
										 dosI(P11,P13,P21,P23);
										 dosI(P11,P13,P22,P23);
										 dosI(P11,P13,P21,P22).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%9
pitagoaras(t(P1,P2,P3)):-triangRec(t).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EJERCICIOS SOBRE LISTAS DE PUNTOS.
%1
equi([P1,P2,P3]):-dist(P1,P2,D1), dist(P2,P3,D2),D1=:=D2,!.
equi([P1,P2,P3|L1]):-equi([P2,P3|L1]), dist(P1,P2,D1), dist(P2,P3,D2),D1=:=D2.

%2
lineaR(L):-linearectax(L);
           linearectay(L).

linearectax([P1,P2]):-inx(P1,P2),!.
linearectax([P1,P2|L]):-inx(P1,P2),linearecta([P2|L]),!.
inx(punto(X,_),punto(X,_)).

linearectay([P1,P2]):-iny(P1,P2),!.
linearectay([P1,P2|L]):-iny(P1,P2),linearecta([P2|L]),!.
iny(punto(_,Y),punto(_,Y)).

%3

mismoP([P],[P]):-!.
mismoP([P1|L1],[P1|L2]):-mismoP(L1,L2),!.

%4

menorDist([P1,P2],D):-dist(P1,P2,D),!.
menorDist([P1,P2|L],D):-dist(P1,P2,D),menorDist([P2|L],D2),D2<D,D is D2. 
menorDist([P1,P2|L],D):-menorDist([P2|L],D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ejercicios sobre Rectas

puntoIntersec(R1,R2,P1):-.

