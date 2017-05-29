%predicados auxiliares

par(A):-0 is A mod 2.

impar(A):-not(par(A)).

igual(A,B):-A==B.

dif(A,B):-not(igual(A,B)).

mayor(A,B,My):-A>B,My is A.
mayor(A,B,My):-B>=A,My is B.
mayor(A,B,C,My):-mayor(A,B,My1),mayor(My1,C,My).
mayor(A,B,C,D,My):-mayor(A,B,C,My1),mayor(My1,D,My).

menor(A,B,Me):-A<B,Me is A.
menor(A,B,Me):-B=<A,Me is B.
menor(A,B,C,Me):-menor(A,B,Me1),menor(Me1,C,Me).
menor(A,B,C,D,Me):-menor(A,B,C,Me1),menor(Me1,D,Me).

igual(A,B,C):-igual(A,B),igual(B,C).
igual(A,B,C,D):-igual(A,B),igual(B,C),igual(C,D).
igual(A,B,C,D,E):-igual(A,B),igual(B,C),igual(C,D),igual(D,E).

dif(A,B,C,D,E):-not(igual(A,B,C,D,E)).

ap1(X1,X2,X):-mayor(X1,X2,M1),X1==M1,X is X1-X2;
              mayor(X1,X2,M1),X2==M1,X is X2-X1.

ap2(X1,X2,X3,X4,My,Me):-mayor(X1,X2,X3,X4,My),menor(X1,X2,X3,X4,Me).

ap3(X1,X2,X3,X4,My1,My2):-mayor(X1,X2,X3,X4,My1),
                          (X1==My1,mayor(X2,X3,X4,My2);
                           X2==My1,mayor(X1,X3,X4,My2);
                           X3==My1,mayor(X1,X2,X4,My2);
                           X4==My1,mayor(X1,X2,X3,My2)
                          ).
                          


%--------1-----Logica sobre enteros--------------

dosPares(A,B,C,D):-par(A),par(B),impar(C),impar(D);
                   par(A),impar(B),par(C),impar(D);
                   par(A),impar(B),impar(C),par(D);
                   impar(A),par(B),impar(C),par(D);
                   impar(A),impar(B),par(C),par(D);
                   impar(A),par(B),par(C),impar(D).

tresPares(A,B,C,D):-par(A),par(B),par(C),impar(D);
                    par(A),par(B),impar(C),par(D);
                    par(A),impar(B),par(C),par(D);
                    impar(A),par(B),par(C),par(D).

sumaPares(X,Y,Z,Sum):-par(X),par(Y),par(Z),Sum is X+Y+Z.

dosIguales(A,B,C,D):-igual(A,B),dif(A,C),dif(A,D);
                     dif(A,B),igual(A,C),dif(A,D);
                     dif(A,B),dif(A,C),igual(A,D);
                     dif(A,B),igual(B,C),dif(B,D);
                     dif(A,B),dif(B,C),igual(B,D);
                     dif(A,B),dif(B,C),igual(C,D).

mayor(A,B,C,D,E,My):-mayor(A,B,C,D,My1),mayor(My1,E,My).

menor(A,B,C,D,E,Me):-menor(A,B,C,D,Me1),menor(Me1,E,Me).

full(A,B,C,D,E):-igual(A,B),igual(C,D,E),A=\=C;
                 igual(A,C),igual(B,D,E),A=\=B;
                 igual(A,D),igual(B,C,E),A=\=B;
                 igual(A,E),igual(B,C,D),A=\=B;
                 igual(B,C),igual(A,D,E),A=\=B;
                 igual(B,D),igual(A,C,E),A=\=B;
                 igual(B,E),igual(A,C,D),A=\=B;
                 igual(C,D),igual(A,B,E),A=\=C;
                 igual(C,E),igual(A,B,D),A=\=C;
                 igual(D,E),igual(A,B,C),A=\=D.

poker(A,B,C,D,E):-igual(A,B,C,D),A=\=E;
                  igual(A,B,C,E),A=\=D;
                  igual(A,B,D,E),A=\=C;
                  igual(A,C,D,E),A=\=B;
                  igual(B,C,D,E),A=\=B.

escalera(A,B,C,D,E):-dif(A,B,C,D,E),A<B,B<C,C<D,D<E;
                     dif(A,B,C,D,E),E<D,D<C,C<B,B<A.

suma(A,B,C,D):-S is A+B+C,S==D;
               S is A+B+D,S==C;
               S is A+C+D,S==B;
               S is B+C+D,S==A.

%quinas(A,B,C,D,E,Q):-


%---------------2---Notas de alumnos------------------------

promedio(N1,N2,N3,NF):-NF is (N1+N2+N3)/3.

mejorProm(N1,N2,N3,NF):-mayor(N1,N2,N3,M1),
                        ((N1==M1,mayor(N2,N3,M2),NF is (M1+M2)/2);
                         (N2==M1,mayor(N1,N3,M2),NF is (M1+M2)/2);
                         (N3==M1,mayor(N2,N3,M2),NF is (M1+M2)/2)
                        ).

promModal(N1,N2,N3,NF):-dif(N1,N2),dif(N1,N3),NF is N2;
                        igual(N1,N2,N3),NF is N1;
                        igual(N1,N2),dif(N1,N3),NF is N1;
                        dif(N1,N2),igual(N2,N3),NF is N2;
                        dif(N1,N2),igual(N1,N3),NF is N1.

habilitado(N1,N2,N3,N4):-N1>=60,N2>=60,N3>=60;
                         N1>=60,N2>=60,N4>=60;
                         N1>=60,N3>=60,N4>=60;
                         N2>=60,N3>=60,N4>=60.

promProx(N1,N2,N3,NF):-ap1(N1,N2,X),ap1(N2,N3,Y),ap1(N1,N3,Z),
                       ((X<Y,X<Z,NF is (N1+N2)/2);
                        (Y<X,Y<Z,NF is (N2+N3)/2);
                        (Z<X,Z<Y,NF is (N1+N3)/2); 
                        (X==Y,promedio(N1,N2,N3,NF)) 
                       ).

promedioMedio(N1,N2,N3,N4,NF):-ap2(N1,N2,N3,N4,My1,Me1),
                               ((N1==My1,N4==Me1;N1==Me1,N4==My1),NF is (N2+N3)/2;
                                (N1==My1,N3==Me1;N1==Me1,N3==My1),NF is (N2+N4)/2;
                                (N1==My1,N2==Me1;N1==Me1,N2==My1),NF is (N3+N4)/2;
                                (N2==My1,N4==Me1;N2==Me1,N4==My1),NF is (N1+N3)/2;
                                (N2==My1,N3==Me1;N2==Me1,N3==My1),NF is (N1+N4)/2;
                                (N3==My1,N4==Me1;N3==Me1,N4==My1),NF is (N1+N2)/2
                               ).

notaFinal(N1,N2,N3,N4,NF):-ap3(N1,N2,N3,N4,M1,M2),
                           (((N1==M1;N1==M2),(N4==M2;N4==M1)),NF is (N2+N3)/2;
                            ((N1==M1;N1==M2),(N3==M2;N3==M1)),NF is (N2+N4)/2;
                            ((N1==M1;N1==M2),(N2==M2;N2==M1)),NF is (N3+N4)/2;
                            ((N2==M1;N2==M2),(N4==M2;N4==M1)),NF is (N1+N3)/2;
                            ((N2==M1;N2==M2),(N3==M2;N3==M1)),NF is (N1+N4)/2;
                            ((N3==M1;N3==M2),(N4==M2;N4==M1)),NF is (N1+N2)/2
                           ).

notaFinal(N1,N2,N3,NF):-N1>=51,N2>=51,N3>=51,NF is (N1+N2+N3)/3;
                        N1>=51,N2>=51,N3<51,NF is (N1+N2)/2;
                        N1>=51,N2<51,N3>=51,NF is (N1+N3)/2;
                        N1>=51,N2<51,N3<51,NF is N1;
                        N1<51,N2>=51,N3>=51,NF is (N2+N3)/2;
                        N1<51,N2>=51,N3<51,NF is N2;
                        N1<51,N2<51,N3>=51,NF is N3;
                        N1<51,N2<51,N3<51,NF is 0.



%--------------3----------Puntos en el cuadrante cartesiano------------

ejeX(X,Y):-X==0.

ejeY(X,Y):-Y==0.

lugar(X,Y,Q):-ejeX(X,Y),ejeY(X,Y),Q is 0;
              X>0,Y>0,Q is 1;
              X<0,Y>0,Q is 2;
              X<0,Y<0,Q is 3;
              X>0,Y<0,Q is 4;
              ejeX(X,Y),Q is 5;
              ejeY(X,Y),Q is 6.

horizontal(X1,Y1,X2,Y2):-Y1==Y2.

vertical(X1,Y1,X2,Y2):-X1==X2.

distancia(X1,Y1,X2,Y2,Dist):-A is X2-X1,B is Y2-Y1,S is atan(B/A),
                             T is sin(S),Dist is B/T.

sobreEjes(X1,Y1,X2,Y2):-ejeX(X1,Y1),ejeX(X2,Y2);
                        ejeX(X1,Y1),ejeY(X2,Y2);
                        ejeY(X1,Y1),ejeX(X2,Y2);
                        ejeY(X1,Y1),ejeY(X2,Y2).

ejesDif(X1,Y1,X2,Y2):-ejeX(X1,Y1),ejeY(X2,Y2);
                      ejeY(X1,Y1),ejeX(X2,Y2).

diagOpuestos(X1,Y1,X2,Y2):-lugar(X1,Y1,Q1),lugar(X2,Y2,Q2),
                           (Q1==1,Q3==3;Q1==2,Q3==4).

mismoLugar(X1,Y1,X2,Y2):-lugar(X1,Y1,Q1),lugar(X2,Y2,Q2),Q1==Q2.

dentroCirc(X1,Y1,R):-S is asin(X1/R),T is tan(S),Y is X1/T,Y1==Y.

pendiente(X1,Y1,X2,Y2,Pend):-A is X2-X1,B is Y2-Y1,A=\=0,Pend is B/A.

triangulo(X1,Y1,X2,Y2,X3,Y3):-ejeX(X1,Y1),ejeY(X2,Y2),ejeX(X3,Y3);
                              ejeY(X1,Y1),ejeX(X2,Y2),ejeY(X3,Y3).

triangDif(X1,Y1,X2,Y2,X3,Y3):-lugar(X1,Y1,Q1),lugar(X2,Y2,Q2),lugar(X3,Y3,Q3),
                              Q1=\=Q2,Q2=\=Q3.

ang2Rect(X1,Y1,X2,Y2,X3,Y3,X4,Y4,A):-pendiente(X1,Y1,X2,Y2,P1),pendiente(X3,Y3,X4,Y4,P2),
                                     S is (P2-P1)/(1+(P2*P1)), T is atan(S),A is (T*180)/pi.

trianguloRect(X1,Y1,X2,Y2,X3,Y3):-horizontal(X1,Y1,X2,Y2),vertical(X1,Y1,X3,Y3);
                                  vertical(X1,Y1,X2,Y2),horizontal(X1,Y1,X3,Y3);
                                  pendiente(X1,Y1,X2,Y2,P1),pendiente(X1,Y1,X3,Y3,P2),
                                  P is (-1)*P2,P1==P.

trianguloEqui(X1,Y1,X2,Y2,X3,Y3):-ang2Rect(X1,Y1,X2,Y2,X2,Y2,X3,Y3,A1),A1==60,
                                  (horizontal(X1,Y1,X2,Y2);vertical(X1,Y1,X2,Y2)).

%trianguloIsos(X1,Y1,X2,Y2,X3,Y3):-