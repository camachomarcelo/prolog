puntos(X,Y,X1,Y1,X2,Y2):- X =\= X1, X =\= X2, X1 =\= X2, Y =:= Y1, Y =\= Y2;
			  X =\= X1, X =\= X2, X1 =\= X2, Y1 =:= Y2, Y2 =\= Y;
			  X =\= X1, X =\= X2, X1 =\= X2, Y =:= Y2, Y1 =\= Y2.