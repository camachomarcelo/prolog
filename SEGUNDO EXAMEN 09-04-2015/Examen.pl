menor(X,Y,M):-(X<Y), M is X;Y<X, M is Y.
menor(X,Y,Z,M):-menor(X,Y,M1),menor(M1,Z,M).


notaFinal(X,Y,Z,NF):-menor(X,Y,Z,Mi), NF is (X+Y+Z-Mi) / 2.
lugar(punto(X, Y), L) :- X =:= 0, Y =:= 0, L is 0, !;
                         X > 0, Y > 0, L is 1, !;
                         X < 0, Y > 0, L is 2, !;
                         X < 0, Y < 0, L is 3, !;
                         X > 0, Y < 0, L is 4, !;
                         Y =:= 0, L is 5, !;
                         X =:= 0, L is 6.
						 
diferente(X1,Y1,X2,Y2,X3,Y3):-lugar(X1,Y1,L1),lugar(X2,Y2,L2),lugar(X3,Y3,L3),L1=\=L2,L2=\=L3,L1=\L3.						 