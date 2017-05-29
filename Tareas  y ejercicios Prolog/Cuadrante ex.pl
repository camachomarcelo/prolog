par(X):-0 is Xmod2.
impar(X):-(not(par(X))).
cuadrante(punto(X,Y),0):-X=:=0,Y=:=0.
cuadrante(punto(X,Y),1):-X>0,Y>0.
cuadrante(punto(X,Y),2):-X<0,Y=:=0.
cuadrante(punto(X,Y),3):-X<0,Y<0.
cuadrante(punto(X,Y),0):-X>0,Y<0.

diagonalopuesto(punto(X1,Y1),punto(X2,Y2)):-cuadrante(punto(X1,Y1),A),cuadrante(punto(X2,Y2),B),(A=\=B),((par(A),par(B));(impar(A),impar(B))).