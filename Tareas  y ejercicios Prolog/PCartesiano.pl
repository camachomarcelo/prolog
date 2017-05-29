lugar(X,Y,1):- X>0, 
		Y>0, !.
lugar(X,Y,2):- X<0,
		Y>0, !.
lugar(X,Y,3):- X<0,
		Y<0, !.
lugar(X,Y,4):- X>0,
		Y<0, !.
lugar(X,Y,5):- Y = 0, !.
lugar(X,Y,6):- X = 0, !.
lugar(X,Y,0).

mismoLugar(X1,Y1,X2,Y2):- lugar(X1,Y1,L1),
				lugar(X2,Y2,L1).

distancia(X1,Y1,X2,Y2,D1):-
				D1 is sqrt((X2-X1)**2+(Y2-Y1)**2).

ejeX(X,Y):- lugar(X,Y,5).

ejeY(X,Y):- lugar(X,Y,6).

horizontal(X1,Y1,X2,Y2):- (Y1 =:= Y2).

vertical(X1,Y1,X2,Y2):- (X1 =:= X2).

sobreEjes(X1,Y1,X2,Y2):- ejeX(X1,Y1); ejeY(X1,Y1),
				ejeX(X2,Y2) ; ejeY(X2,Y2).

ejesDif(X1,Y1,X2,Y2):- not(sobreEjes(X1,Y1,X2,Y2)).

diagOpuestos(X1,Y1,X2,Y2):- lugar(X1,Y1,L1), 
				lugar(X2,Y2,L2),
					(L2 =:= (L1 + 2)) ;  ((L2+2) =:= L1).

dentroCirc(X,Y,R):- distancia(0,0,X,Y,D),
			D =< R. %36

pendiente(X1,Y1,X2,Y2,Pend):- (X1 =\=X2) ,Pend is ((Y2 - Y1)/(X2 - X1)).

triangulo(X1,Y1,X2,Y2,X3,Y3):- lugar(X1,Y1,L1), lugar(X2,Y2,L1), lugar(X3,Y3,L2), 
				distancia(X1,Y1,X2,Y2,D), (D>0);
					lugar(X1,Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L2), 
					distancia(X2,Y2,X3,Y3,D), (D>0);
						lugar(X1,Y1,L1), lugar(X2,Y2,L2), lugar(X3,Y3,L1), 
						distancia(X1,Y1,X3,Y3,D), (D>0).

triangDif(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1), D1>0,
				  distancia(X2,Y2,X3,Y3,D2), D2>0,
					distancia(X3,Y3,X1,Y1,D3), D3>0,
					   ejesDif(X1,Y1,X2,Y2), 
						ejesDif(X3,Y3,X2,Y2).

trianguloRect(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1), D1 > 0,
				  	distancia(X2,Y2,X3,Y3,D2), D2 > 0,
						distancia(X3,Y3,X1,Y1,D3), D3 > 0,
							(D1**2 =:= D2**2 + D3**2);
							  (D2**2 =:= D1**2 + D3**2);
							     (D3**2 =:= D1**2 + D2**2).

trianguloEqui(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1),
				  	distancia(X2,Y2,X3,Y3,D1),
						distancia(X3,Y3,X1,Y1,D1), D1>0.

trianguloIsoceles(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1), D1 > 0,
				  	distancia(X2,Y2,X3,Y3,D2), D2 > 0,						distancia(X3,Y3,X1,Y1,D3) , D3 > 0,
							(D1 =:= D2), (D2 =\= D3);
							(D2 =:= D3), (D1 =\= D2).