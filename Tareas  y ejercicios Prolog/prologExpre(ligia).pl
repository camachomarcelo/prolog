%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %LÓGICAS SOBRE ENTEROS.                                                                                                                                             %%
%%                                                                                                                                                                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
par(X):-X mod 2 =:= 0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
impar(X):-not(par(X)).

%%%%%%%%%%%%%%
parImpar(X,Y):-par(X),impar(Y);
	       par(Y),impar(X).

%AAAA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%opción 1
dospares(A,B,C,D):-impar(A),impar(B),par(C),par(D);
		   impar(A),par(B),impar(C),par(D);
		   impar(A),par(B),par(C),impar(D);
		   par(A),impar(B),par(C),impar(D);
		   par(A),par(B),impar(C),impar(D).
%%opción 2
dospares2(A,B,C,D):-parImpar(A,B),parImpar(C,D);
                              parImpar(A,C),parimpar(B,D).

%BBBBB%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trespares(X,Y,Z,W):-par(X),par(Y),par(Z),impar(W);
		 par(Y),par(Z),par(W),impar(X);
		 par(X),par(Z),par(W),impar(Y);
		 par(X),par(Y),par(W),impar(Z).
%%opción 1
todopar(X,Y):-par(X),par(Y).
trespares2(X,Y,Z,W):-parImpar(X,Y),todopar(Z,W);
                              parImpar(X,Z),todopar(Y,W);
                              parImpar(X,W),todopar(Y,Z).
%%opción 2
todospar(X,Y,Z):-par(X),par(Y),par(Z).
trespares3(X,Y,Z,W):-impar(X),todospar(Y,Z,W);
                              impar(Y),todospar(X,Z,W);
                              impar(Z),todospar(X,Y,W);
                              impar(W),todospar(X,Y,Z).

%CCCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sumapareS(X,Y,Z,S):- par(X),par(Y),par(Z),S is X+Y+Z; 
			par(X),par(Y),impar(Z),S is X+Y;
			par(X),impar(Y),impar(Z),S is X;
			impar(X),par(Y),par(Z),S is Y+Z;
			impar(X),impar(Y),par(Z),S is Z;
			impar(X),impar(Y),impar(Z),S is 0.    
%%% opción 1
espar(X,Y):-par(X),Y is X; Y is 0.
sumapares2(X,Y,Z,S):-espar(X,Q),espar(Y,W),espar(Z,E),S is Q+W+E.

%%%opción 2
sumapare3(X,Y,Z,S):- par(X),par(Y),par(Z),S is X+Y+Z; 
			par(X),par(Y),impar(Z),S is X+Y;
			par(X),impar(Y),impar(Z),S is X;
			impar(X),par(Y),par(Z),S is Y+Z;
			impar(X),impar(Y),par(Z),S is Z;
			impar(X),impar(Y),impar(Z),S is 0;    
                                          par(X),impar(Y),par(Z),S is X+Z;
                                          impar(X),par(Y),impar(Z),S is Y.

%DDDD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dosigual(A,A,C,D):-A=\=C,C=\=D,A=\=D,!.
dosigual(A,C,A,D):-A=\=C,C=\=D,A=\=D,!.
dosigual(A,C,D,A):-A=\=C,C=\=D,A=\=D,!.
dosigual(C,A,D,A):-A=\=C,C=\=D,A=\=D,!.
dosigual(C,D,A,A):-A=\=C,C=\=D,A=\=D,!.
dosigual(C,A,A,D):-A=\=C,C=\=D,A=\=D.

%EEEEE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayordos(X,Y,M):-X>Y,M is X,!.
mayordos(X,Y,M):- M is Y.

mayor(A,B,C,D,M):-mayordos(A,B,W),mayordos(C,D,Z),mayordos(W,Z,M).

%FFFFF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
menordos(X,Y,M):-X<Y,M is X,!.
menordos(X,Y,M):- M is Y.

menor(A,B,C,D,M):-menordos(A,B,W),menordos(C,D,Z),menordos(W,Z,M).

%GGGGGG%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
full(A,A,A,B,B):-A=\=B,!.
full(A,A,B,B,A):-A=\=B,!.
full(A,B,B,A,A):-A=\=B,!.
full(B,B,A,A,A):-A=\=B,!.
full(A,A,B,A,B):-A=\=B,!.
full(A,B,A,B,A):-A=\=B,!.
full(B,A,B,A,A):-A=\=B,!.
full(B,A,A,B,A):-A=\=B,!.
full(A,B,A,A,B):-A=\=B,!.
full(B,A,A,A,B):-A=\=B.

%HHHHH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
poker(A,A,A,A,X):-A=\=X,!.
poker(A,A,A,X,A):-A=\=X,!.
poker(A,A,X,A,A):-A=\=X,!.
poker(A,X,A,A,A):-A=\=X,!.
poker(X,A,A,A,A):-A=\=X,!.

%IIIIII%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
esc(A,B):-A=\=B.
esc(A,B,C):-esc(A,B),esc(B,C),esc(A,C).
esc(A,B,C,D):-esc(A,B,C),esc(A,D),esc(B,D),esc(C,D).

%JJJJJJ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
suma(A,B,C,D):-A=:= B+C+D;B=:=A+C+D;C=:=A+B+D;D=:=A+B+C.

%KKKKK%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
quina(X):-X=:=5.

quina2(X,Y,Z):-quina(X),quina(Y),Z is 10;   quina(X),not(quina(Y)),Z is 5;  quina(Y),not(quina(X)),Z is 5;Z is 0.

quina3(X,Y,Z,W):-quina2(X,Y,Q),quina(Z),W is Q+5  ;quina2(X,Y,Q),W is Q.

quinas(A,B,C,D,E,Q):-quina2(A,B,X),quina3(C,D,E,Y),Q is X+Y.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%NOTAS DE ALUMNOS                                                                                                                                                         %%
%%                                                                                                                                                                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%AAAAA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
promedio(N1,N2,N3,NF):- NF is (N1+N2+N3)/3.

%%BBBBB%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prom(N1,N2,NF):-NF is (N1+N2)/2.

mejorProm(N1,N2,N3,NF):-prom(N1,N2,X),prom(N2,N3,Y),prom(N1,N3,Z),X>=Y,X>=Z,NF is X;
                                         prom(N1,N2,X),prom(N2,N3,Y),prom(N1,N3,Z),Y>=X,Y>=Z,NF is Y;
                                         prom(N1,N2,X),prom(N2,N3,Y),prom(N1,N3,Z),Z>=X,Z>=Y,NF is Z.

%%CCCCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
igual(X,Y):-X=:=Y.
promModal(N1,N2,N3,NF):-igual(N1,N2),igual(N2,N3),NF is N1;
                                       igual(N1,N2),not(igual(N2,N3)),NF is N1;
                                       igual(N2,N3),not(igual(N2,N1)),NF is N2;
                                       igual(N1,N3),not(igual(N2,N1)),NF is N1;
                                       NF is N2. 
%%%opción 2
promModal2(N1,N1,N1,NF):-NF is N1,!.
promModal2(N1,N1,N2,NF):-N1=\=N2,NF is N1,!.
promModal2(N1,N2,N1,NF):-N1=\=N2,NF is N1,!.
promModal2(N2,N1,N1,NF):-N1=\=N2,NF is N1,!.
promModal2(N1,N2,N3,NF):-NF is N2.

%%DDDDD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayor60(X):-X>=60.
habilitado(N1,N2,N3,N4):-mayor60(N1),mayor60(N2),mayor60(N3),mayor60(N4);
                                     mayor60(N1),mayor60(N2),mayor60(N3),not(mayor60(N4));
                                     mayor60(N2),mayor60(N3),mayor60(N4),not(mayor60(N1));
                                     mayor60(N1),mayor60(N2),mayor60(N4),not(mayor60(N3));
                                     mayor60(N1),mayor60(N3),mayor60(N4),not(mayor60(N2)).

%%EEEEE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
dif(X,Y,Z):- Z is X-Y,Z>=0;Z is Y-X.  
promProx(N1,N2,N3,NF):- dif(N1,N2,X),dif(N2,N3,Y),dif(N1,N3,Z),X=<Y,X=<Z,NF is (N1+N2)/2;
                                      dif(N1,N2,X),dif(N2,N3,Y),dif(N1,N3,Z),Y=<X,Y=<Z,NF is (N2+N3)/2;
                                      dif(N1,N2,X),dif(N2,N3,Y),dif(N1,N3,Z),Z=<X,Z=<Y,NF is (N1+N3)/2.

%%FFFFF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayor4(X,Y,Z,W,My):-mayordos(X,Y,A),mayordos(Z,W,B),mayordos(A,B,My).
menor4(X,Y,Z,W,Mn):-menordos(X,Y,A),menordos(Z,W,B),menordos(A,B,Mn).
%%No Terminado,No Terminado,No Terminado,No Terminado
%promedioMedio(N1,N2,N3,N4,NF):-mayor4(N1,N2,N3,N4,A),

%%GGGGG%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
notaFinal(N1,N2,N3,N4,NF):-prom(N1,N2,X),prom(N2,N3,Y),prom(N3,N4,Z),prom(N4,N1,W),X>=Y,X>=Z,X>=W,NF is X;
                                         prom(N1,N2,X),prom(N2,N3,Y),prom(N3,N4,Z),prom(N4,N1,W),Y>=X,Y>=Z,Y>=W,NF is Y;
                                         prom(N1,N2,X),prom(N2,N3,Y),prom(N3,N4,Z),prom(N4,N1,W),Z>=X,Z>=Y,Z>=W,NF is Z;
                                         prom(N1,N2,X),prom(N2,N3,Y),prom(N3,N4,Z),prom(N4,N1,W),W>=X,W>=Y,W>=Z,NF is W.

%%HHHHH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aprob(X,Y):-X>=51,Y is X;Y is 0.

notaFinal(N1,N2,N3,NF):-aprob(N1,A),aprob(N2,B),aprob(N3,C),NF is (A+B+C)/3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%PUNTOS EN EL CUADRANTE CARTESIANO                                                                                                                        %%
%%                                                                                                                                                                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%AAAAA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejeX(X,Y):-Y=:=0.

%%BBBBB%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejeY(X,Y):-X=:=0.

%%CCCCC%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
origen(X,Y):-X=:=0,Y=:=0.
cuad1(X,Y):-X>0,Y>0.
cuad2(X,Y):-X<0,Y>0.
cuad3(X,Y):-X<0,Y<0.
cuad4(X,Y):-X>0,Y<0.

lugar(X,Y,Q):-origen(X,Y),Q is 0; ejeX(X,Y),Q is 5; ejeY(X,Y),Q is 6; cuad1(X,Y),Q is 1; cuad2(X,Y),Q is 2; cuad3(X,Y),Q is 3; cuad4(X,Y),Q is 4.

%%DDDDD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
horizontal(X1,Y1,X2,Y2):-Y1=:=Y2.

%%EEEEE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vertical(X1,Y1,X2,Y2):-X1=:=X2.

%%FFFFF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distancia(X1,Y1,X2,Y2,Dist):-A is (X1-X2)^2, B is (Y1-Y2)^2,Dist is sqrt(A+B).

%%GGGGG%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sobreEjes(X1,Y1,X2,Y2):-ejeX(X1,Y1),ejeY(X2,Y2); ejeX(X2,Y2),ejeY(X1,Y1); ejeX(X1,Y1),ejeX(X2,Y2); ejeY(X1,Y1),ejeY(X2,Y2).

%%HHHHH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejesDif(X1,Y1,X2,Y2):-ejeX(X1,Y1),ejeY(X2,Y2); ejeY(X1,Y1),ejeX(X2,Y2).

%%IIIIII%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diagOpuestos(X1,Y1,X2,Y2):-lugar(X1,Y1,A),lugar(X2,Y2,B),A=:=1,B=:=3;
			lugar(X1,Y1,A),lugar(X2,Y2,B),A=:=2,B=:=3.

%%JJJJJ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mismoLugar(X1,Y1,X2,Y2):-lugar(X1,Y1,A),lugar(X2,Y2,B),A=:=B.

%%KKKKK%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dentroCirc(X1,Y1,R):-((X1^2)+(Y1^2))=<R^2.

%%LLLLLL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pendiente(X1,Y1,X2,Y2,Pend):-Pend is (Y2-Y1)/(X2-X1).

%%MMMMM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejeXN(X,Y):-Y=:=0,X<0.
ejeXP(X,Y):-Y=:=0,X>0.
ejeYN(X,Y):-X=:=0,Y<0.
ejeYP(X,Y):-X=:=0,Y>0.
triangulo(X1,Y1,X2,Y2,X3,Y3):- ejeXN(X1,Y1),ejeYP(X2,Y2),ejeXP(X3,Y3);
                                             ejeXN(X3,Y3),ejeYP(X1,Y1),ejeXP(X2,Y2);
                                             ejeXN(X2,Y2),ejeYP(X3,Y3),ejeXP(X1,Y1);
                                             ejeYP(X1,Y1),ejeXP(X2,Y2),ejeYN(X3,Y3);
                                             ejeYP(X3,Y3),ejeXP(X1,Y1),ejeYN(X2,Y2);
                                             ejeYP(X2,Y2),ejeXP(X3,Y3),ejeYN(X1,Y1);
                                             ejeXP(X1,Y1),ejeYN(X2,Y2),ejeXN(X3,Y3);
                                             ejeXP(X3,Y3),ejeYN(X1,Y1),ejeXN(X2,Y2);
                                             ejeXP(X2,Y2),ejeYN(X3,Y3),ejeXN(X1,Y1);
                                             ejeYP(X1,Y1),ejeXN(X2,Y2),ejeYN(X3,Y3);
                                             ejeYP(X3,Y3),ejeXN(X1,Y1),ejeYN(X2,Y2);
                                             ejeYP(X2,Y2),ejeXN(X3,Y3),ejeYN(X1,Y1).

%%NNNNN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
triangDif(X1,Y1,X2,Y2,X3,Y3):-lugar(X1,Y1,A),lugar(X2,Y2,B),lugar(X3,Y3,C),A=\=B,B=\=C,C=\=A.

%%OOOOO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
angulo(X1,Y1,X2,Y2,X3,Y3,X4,Y4,An):-pendiente(X1,Y1,X2,Y2,A),pendiente(X3,Y3,X4,Y4,B),X is atan((B-A)/(1+A*B)),An is (X*180/3.141593).
trianguloRect(X1,Y1,X2,Y2,X3,Y3):-angulo(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A),A=:=90;
                                                   angulo(X1,Y1,X2,Y2,X1,Y1,X3,Y3,A),A=:=90;
                                                   angulo(X2,Y2,X3,Y3,X1,Y1,X3,Y3,A),A=:=90.
  
%%PPPPP%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trianguloEqui(X1,Y1,X2,Y2,X3,Y3):-angulo(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A),
                                                   angulo(X1,Y1,X2,Y2,X1,Y1,X3,Y3,B),
                                                   angulo(X2,Y2,X3,Y3,X1,Y1,X3,Y3,C),
                                                   A=:=B,B=:=C.

%%QQQQQ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trianguloIsosceles(X1,Y1,X2,Y2,X3,Y3):-angulo(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A),angulo(X1,Y1,X2,Y2,X1,Y1,X3,Y3,B),angulo(X2,Y2,X3,Y3,X1,Y1,X3,Y3,C),
                                                         A=:=B,B=\=C;
                                                         angulo(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A),angulo(X1,Y1,X2,Y2,X1,Y1,X3,Y3,B),angulo(X2,Y2,X3,Y3,X1,Y1,X3,Y3,C),
                                                         A=:=C,C=\=B;
                                                         angulo(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A),angulo(X1,Y1,X2,Y2,X1,Y1,X3,Y3,B),angulo(X2,Y2,X3,Y3,X1,Y1,X3,Y3,C),
                                                         C=:=B,B=\=A.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%OTROS EJERCICIOS INTERESANTES DE LÓGICA                                                                                                               %%
%%                                                                                                                                                                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%%%1111111111111111111111111111111111111111111111111111111111111111111111%%%%%%%%%%%%%%%%%%%%%%   
e(0).
e(1).
e(2).
e(3).
e(4).
e(5).
e(6).
e(7).
e(8).
e(9).
o(+).
o(-).
o(*).
o(/).
o1(+,1).
o1(-,2).
o1(*,3).
o1(/,4).

expresiones(X,Y,Z):-e(X),o(Y),e(Z).                                                   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
resultado(X,Y,Z,T):-o1(Y,W),W=:=1,T is X+Z;
                            o1(Y,W),W=:=2,T is X-Z;
 		o1(Y,W),W=:=3,T is X*Z;
		o1(Y,W),W=:=4,T is X/Z.
                         
%%22222222222222222222222222222222222222222222222222222222222222222222222%%%%%%%%%%%%%%%%%%%%%%
departamento(contabilidad).
departamento(administracion).
departamento(gerencia).
departamento(recursosH).
departamento(produccion).
departamento(ventas).

persona(andres).
persona(patricia).
persona(arturo).
persona(anni).
persona(miguel).
persona(estela).
persona(juan).
persona(marco).
persona(sandra).
persona(pedro).
persona(antonio).
persona(willy).
persona(jose).

trabaja(andres,contabilidad).
trabaja(patricia,contabilidad).
trabaja(arturo,contabilidad).
trabaja(anni,administracion).
trabaja(miguel,administracion).
trabaja(estela,gerencia).
trabaja(juan,gerencia).
trabaja(marco,recursosH).
trabaja(sandra,recursosH).
trabaja(pedro,produccion).
trabaja(antonio,produccion).
trabaja(jose,ventas).
trabaja(willy,ventas).

jefe(andres,contabilidad).
jefe(anni,administracion).
jefe(estela,gerencia).
jefe(marco,recursosH).
jefe(pedro,produccion).
jefe(pedro,ventas).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maximo(X):-jefe(X,_).

minimo(X):-not(jefe(X,_)).

mismoDep(X,Y):-jefe(X,Z),trabaja(Y,Z).

ordenar(X,Y):-mismoDep(X,Y).