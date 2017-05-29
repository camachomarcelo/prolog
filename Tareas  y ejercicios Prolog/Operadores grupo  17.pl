%wilma cruz serrudo 200758543
%garcia rodriguez alejandro 200413899
%lopes terrazas vehimar 200610589

igual(X,Y):-X =:=Y.

dif(X,Y):-X=\=Y.
dif(X,Y):-not(igual(X,Y)).

par(X):-X mod 2=:=0.

impar(X):-not(par(X)).

dospares(X,Y,Z):-par(X),par(Y),impar(Z);
                 par(X),impar(Y),par(Z);
                 impar(X),par(Y),par(Z).

dospares(A,B,C,D):-dospares(A,B,C),impar(D);
                   dospares(A,B,D),impar(C);
                   dospares(A,C,D),impar(B);
                   dospares(B,C,D),impar(A).

dospares(A,B,C,D,E):-dospares(A,B,C,D),impar(E);
                     dospares(A,B,C,E),impar(D);
                     dospares(A,B,E,D),impar(C);
                     dospares(A,C,D,E),impar(B);
                     dospares(B,C,D,E),impar(A).

iguales(X,Y,Z):-igual(X,Y),igual(X,Z),igual(Y,Z).

iguales(X,Y,Z,T):-iguales(X,Y,Z),igual(Z,T).

dif(X,Y,Z):-dif(X,Y),dif(Y,Z),dif(X,Z).

dif(A,B,C,D):-dif(A,B,C),dif(C,D).

dif(A,B,C,D,E):-dif(A,B,C,D),dif(D,E).

menor(X,Y,X):-X<Y , !.
menor(X,Y,Y).

menor(A,B,C,ME):-menor(A,B,ME1),menor(C,ME1,ME).

menor(A,B,C,D,ME):-menor(A,B,C,ME1),menor(D,ME1,ME).

mayor(X,Y):-X>Y.

mayor(X,Y,Z):-mayor(X,Y),mayor(X,Z),mayor(Y,Z).

mayor(A,B,C,D):-mayor(A,B,C),mayor(A,D).

segmenor(A,B,C,ME):-menor(A,B,ME1),menor(C,ME1,ME).

segmenor(A,B,C,D,ME):-menor(A,B,C,ME1),menor(D,ME1,ME).



