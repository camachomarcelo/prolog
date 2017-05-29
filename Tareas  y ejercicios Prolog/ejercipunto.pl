lugar(punto(X,Y),1):-X>0,Y>0,!.
lugar(punto(X,Y),2):-X<0,Y>0,!.
lugar(punto(X,Y),3):-X<0,Y<0,!.
lugar(punto(X,Y),4):-X>0,Y<0,!.
lugar(punto(X,Y),5):-punto(0,_),!.
lugar(punto(X,Y),6):-punto(_,0),!.


igual(X,X).
igual(Y,Y,Y).

lugarpunto(P1,L1):-lugar(P1,L1).
 mismocuadrante(P1,P2):-lugar(P1,L1),lugar(P2,L2),
                        igual(L1,L2).
%lugardif(P1,P2,P3):-lugar(P1,O),lugar(P2,P),
                    lugar(P3,R),not(igual(O,P,R)).
lugardif(P1,P2,P3):-lugar(P1,Z) ,
                    lugar(P2,Z1) ,
                    lugar(P3,Z2)
                   ,not(igual(Z,Z1,Z2)).


