lugar(punto(X,Y),1):- X>0,Y>0,!.
lugar(punto(X,Y),2):- X<0,Y>0,!.
lugar(punto(X,Y),3):- X<0,Y<0,!.
lugar(punto(X,Y),4):- X>0,Y<0,!.
lugar(punto(X,Y),0):- !.

mismoCuadrante(P1,P2):- lugar(P1,L),lugar(P2,L).

% estaDentro(P1,R)

sobreEjesDiferentes(P1,P2):-not(mismoCuadrante(P1,P2)).

cuadrantesOpuestos(P1,P2):-lugar(P1,A),lugar(P2,B),(A-B)=:=2;
lugar(P1,A),lugar(P2,B),(A-B)=:=-2.

ejeCuadrante(P1,P2):- lugar(P1,A),lugar(P2,B),A=:=0,B=\=0;
lugar(P1,A),lugar(P2,B),B=:=0,A=\=0.

lugaresDif(P1,P2,P3):-sobreEjesDiferentes(P1,P2),sobreEjesDiferentes(P1,P3),sobreEjesDiferentes(P3,P2).

distancia(punto(X1,Y1),punto(X2,Y2),Dist):-Dist is sqrt((X2-X1)**2+(Y2-Y1)**2).

% puntoMedio(P1,P2,PM)

% -------------------- Rectas ----------------------- %

vertical(recta(punto(X1,Y1),punto(X2,Y2))):- (X1-X2)=:=0.

horizontal(recta(punto(X1,Y1),punto(X2,Y2))):- (Y1-Y2)=:=0.

pendiente(R1,10000):-vertical(R1),!.

pendiente(recta(punto(X1,Y1),punto(X2,Y2)),Pend):- Pend is (Y2-Y1)/(X2-X1).

encimados(R1,R2):-pendiente(R1,A),pendiente(R2,B),A-B=:=0.

paralelas(R1,R2):-pendiente(R1,P),pendiente(R2,P).

perpend(R1,R2):- vertical(R1),horizontal(R2);
vertical(R2),horizontal(R1),!.

perpend(R1,R2):-pendiente(R1,M1),pendiente(R2,M2), M1*M2=:=-1.

% puntoIntersec(R1,R2,P1)

% ecuacionRecta(R1,E1)

% satisface(E1,P1)

% ---------------------- Triángulos ------------- %

iguales():-

