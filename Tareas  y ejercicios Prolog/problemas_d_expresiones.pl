enejex((X,Y)).
enejey((X,Y)).

lugar(X,Y,1):-X>0,Y>0,!.
mismo_lugar(X1,Y1,X2,Y2):-lugar(X1,Y1,L1),lugar(X2,Y2,L1).
distancia(X1,Y1,X2,Y2,D1):-D1 is sqrt((X2-X1)**2+(Y2-Y1)**2).
eje_dif(X1,Y1,X2,Y2):-enejex(X1,Y1),enejey(X2,Y2);enejex(X2,Y2),enejey(X1,Y1).
lado_eneje(X1,Y1,X2,Y2,X3,Y3):-enejex(X1,Y1),enejex(X2,Y2),enejex(X3,Y3);enejey(X1,Y1),enejey(X2,Y2),enejey(X3,Y3);
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D1)=:=round(D2),round(D2)=\=round(D3),!.
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D1)=:=round(D3),round(D2)=\=round(D3),!.
triangIsosceles(X1, Y1, X2, Y2, X3, Y3):-distancia(X1,Y1,X2,Y2,D1),distancia(X1,Y1,X3,Y3,D2),
					distancia(X2,Y2,X3,Y3,D3),round(D3)=:=round(D2),round(D2)=\=round(D1).
vertical(X1,Y1,X2;Y2):-enejex(X1,Y1),enejex(X2,Y2).
horizontal(X1, Y1, X2, Y2):- Y1=:=Y2, X1=\=0, X2=\=0.
vertical(X1, Y1, X2, Y2):- X1=:=X2, Y1=\=0, Y2=\=0.