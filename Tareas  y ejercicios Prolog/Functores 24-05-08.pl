% Author: Marines Lopez Soliz   Alias La bicha
% Date: 24/04/2008
lugar(punto(X,Y),1):-X>0,Y>0,!.
lugar(punto(X,Y),2):-X<0,Y>0,!.
lugar(punto(X,Y),3):-X<0,Y<0,!.
lugar(punto(X,Y),4):-X>0,Y<0,!.
lugar(punto(X,Y),5):-Y=:=0,!.
lugar(punto(X,Y),6):-X=:=0,!.
lugar(punto(X,Y),0):-X=:=0,Y=:=0 .

iguales(X,X).
iguales(X,X,X).
diferentes(X,Y):-not(iguales(X,Y)).
diferentes(X,Y,Z):-not(iguales(X,Y,Z)).
lugarDif(punto(X1,Y1),punto(X2,Y2)):- lugar(punto(X1,Y1),L1),
                                      lugar(punto(X2,Y2),L2),
                                      diferentes(L1,L2).
lugarDif(punto(X1,Y1),punto(X2,Y2),punto(X3,Y3)):- lugar(punto(X1,Y1),L1),
                                                   lugar(punto(X2,Y2),L2),
                                                   lugar(punto(X3,Y3),L3),
                                                   diferentes(L1,L2,L3).
esDif(punto(X,Y),punto(X2,Y2)):-lugar(punto(X,Y),L),
                                lugar(punto(X2,Y2),L2),
                                (iguales(L,5);iguales(L,6)),
                                (iguales(L2,5);iguales(L2,6)),
                                diferentes(L,L2).

