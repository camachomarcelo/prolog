%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						%
%  GRUPO # 14:					%
%						%
%	FERNANDO MENDOZA CHÁVEZ.		%
%	LIGIA BARRERA COPA.			%
%	EUSTAQUIO FERNANDEZ ABALOS.		%
%						%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%					   %
%  PUNTOS EN EL CUADRANTE CARTESIANO.	   %
%					   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% a) ejeX(X, Y): predicado que es True, si el punto X, Y, se encuentra en el eje X.	%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejeX(X, Y):- X=\=0, Y=:=0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% b) ejeY(X, Y): predicado que es True, si el punto X, Y, se encuentra en el eje Y.	%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejeY(X, Y):- X=:=0, Y=\=0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% c) lugar(X, Y, Q): predicado que encuentra el cuadrante donde se encuentra el punto 	%
%    X, Y. (Cuadrantes: 0 Origen, 1: Cuadrante I, 2: Cuadrante II, 3: Cuadrante III, 	%
%    4: Cuadrante IV, 5: Eje X, 6: Eje Y).						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lugar(X, Y, Q):- X=:=0, Y=:=0, Q is 0,!.
lugar(X, Y, Q):- X > 0, Y > 0, Q is 1,!.
lugar(X, Y, Q):- X < 0, Y > 0, Q is 2,!.
lugar(X, Y, Q):- X < 0, Y < 0, Q is 3,!.
lugar(X, Y, Q):- X > 0, Y < 0, Q is 4,!.
lugar(X, Y, Q):- ejeX(X, Y), Q is 5,!.
lugar(X, Y, Q):- ejeY(X, Y), Q is 6.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% d) horizontal(X1, Y1, X2, Y2): Predicado que devuelve True, si la recta definida por 	%
%    los puntos X1, Y1 y X2, Y2 definen una recta horizontal.				%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
horizontal(X1, Y1, X2, Y2):- Y1=:=Y2, X1=\=0, X2=\=0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% e) vertical(X1, Y1, X2, Y2): Predicado que devuelve True, si la recta definida por 	%
%    los puntos X1, Y1 y X2, Y2 definen una recta vertical				%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vertical(X1, Y1, X2, Y2):- X1=:=X2, Y1=\=0, Y2=\=0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% f) distancia(X1, Y1, X2, Y2, Dist): Predicado que encuentra la distancia entre los 	%
%    puntos X1, Y1 y X2,Y2.							        %
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distancia(X1, Y1, X2, Y2, Dist):- D is (X2-X1)*(X2-X1)+(Y2-Y1)*(Y2-Y1), Dist is D^(0.5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% g) sobreEjes(X1, Y1, X2, Y2): Predicado que es True, si los puntos X1, Y1 Y X2, Y2 se %
%    encuentran sobre los ejes del plano cartesiano.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sobreEjes(X1, Y1, X2, Y2):- ejeX(X1,Y1);ejeY(X1,Y1),ejeX(X2,Y2);ejeY(X2,Y2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% h) ejesDif(X1, Y1, X2, Y2): Predicado que devuelve True, si los puntos X1, Y1 y X2, Y2%
%    se encuentran en ejes diferentes del plano cartesiano.				%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejesDif(X1, Y1, X2, Y2):- ejeX(X1,Y1),ejeY(X2,Y2),!.
ejesDif(X1, Y1, X2, Y2):- ejeX(X2,Y2),ejeY(X1,Y1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% i) diagOpuestos(X1, Y1, X2, Y2): Predicado que es True, si los puntos X1, Y1 y  X2, Y2%
% se encuentra en cuadrantes diagonalmente opuestos.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diagOpuestos(X1, Y1, X2, Y2):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),C1=:=1,C2=:=3,!.
diagOpuestos(X1, Y1, X2, Y2):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),C1=:=3,C2=:=1,!.
diagOpuestos(X1, Y1, X2, Y2):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),C1=:=2,C2=:=4,!.
diagOpuestos(X1, Y1, X2, Y2):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),C1=:=4,C2=:=2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% j) mismoLugar(X1, Y1, X2, Y2): Predicado que es True, si los puntos X1, Y1 y  X2, Y2  %
%    se encuentra en el mismo cuadrante						        %
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mismoLugar(X1, Y1, X2, Y2):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),C1=:=C2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% k) dentroCir(X1, X2, R): Predicado que devuelve True, si el punto X1, Y1 se encuentra %
%    dentro de una circunferencia con radio R y dentro del origen.			%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dentroCir(X1, Y1, R):- distancia(0,0,X1,Y1,D),D=<R.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% l) pendiente(X1, Y1, X2, Y2, Pend): Predicado que encuentra la pendiente de una recta %
%    en Pend, definida por los puntos X1, Y1 y  X2, Y2.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pendiente(X1, Y1, X2, Y2,Pen):- Pen is (Y2-Y1)/(X2-X1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% m) triangulo(X1, Y1, X2, Y2, X3, Y3): Predicado que es True, si los vértices del 	%
%    triangulo se encuentran se encuentran en los ejes del plano cartesiano.		%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangulo(X1, Y1, X2, Y2, X3, Y3):- ejeX(X1,Y1),ejeX(X2,Y2),X1=\=X2,ejeY(X3,Y3),!.
triangulo(X1, Y1, X2, Y2, X3, Y3):- ejeX(X1,Y1),ejeX(X3,Y3),X1=\=X3,ejeY(X2,Y2),!.
triangulo(X1, Y1, X2, Y2, X3, Y3):- ejeX(X2,Y2),ejeX(X3,Y3),X2=\=X3,ejeY(X1,Y1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% n) triangDif(X1, Y1, X2, Y2, X3, Y3): Predicado que devuelve True, si los vértices 	%
%    del triangulo se encuentran en diferentes cuadrantes del plano cartesiano. 	%
%    Asumir que se tiene los predicados del trabajo.					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangDif(X1, Y1, X2, Y2, X3, Y3):- lugar(X1,Y1,C1),lugar(X2,Y2,C2),lugar(X3,Y3,C3),C1=\=C2,C2\=C3,C1=\=C3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% o) trianguloRect(X1, Y1, X2, Y2, X3, Y3): Predicado que es True, si los vértices del 	%
%    triangulo forman un triangulo rectángulo.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangRect(X1, Y1, X2, Y2, X3, Y3):- 	distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round((D1^2))=:=round((D2^2)+(D3^2)),!.
triangRect(X1, Y1, X2, Y2, X3, Y3):- 	distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round((D2^2))=:=round((D1^2)+(D3^2)),!.
triangRect(X1, Y1, X2, Y2, X3, Y3):- 	distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round((D3^2))=:=round((D1^2)+(D2^2)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% p) trianguloEqui(X1, Y1, X2, Y2, X3, Y3): Predicado que es True, si los vértices del 	%
%    triangulo forman un triangulo equilátero.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangEquilatero(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D1)=:=round(D2),round(D2)=:=round(D3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% q) trianguloIsosceles(X1, Y1, X2, Y2, X3, Y3): Predicado que es True, si los vértices %
%    del triangulo forman un triangulo isósceles					%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D1)=:=round(D2),round(D2)=\=round(D3),!.
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D1)=:=round(D3),round(D2)=\=round(D3),!.
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D3)=:=round(D2),round(D2)=\=round(D1).