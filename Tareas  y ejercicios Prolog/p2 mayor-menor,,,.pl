 menor(A,B,ME):-A<B , ME is A,!.
 menor(A,B,ME):-ME is B.
 menor(A,B,C,Me):-menor(A,B,MC),menor(C,MC,Me).
 menor(A,B,C,D,Me):-menor(A,B,C,Ms),menor(D,Ms,Me).
 menor(A,B,C,D,E,Me):-menor(A,B,C,D,Ms),menor(E,Ms,Me).

mayor(A,B):-A>B.
mayor(A,B,My):-A>B , My is A,!.
mayor(A,B,My):-My is B.
mayor(A,B,C,My):-mayor(A,B,MC),mayor(C,MC,My).
mayor(A,B,C,D,My):-mayor(A,B,C,Ms),mayor(D,Ms,My).
mayor(A,B,C,D,E,My):-mayor(A,B,C,D,Ms),mayor(E,Ms,My).

medio(X,Y,Z,X):-estaEntre(X,Y,Z),!.
medio(X,Y,Z,Y):-estaEntre(Y,X,Z),!.
medio(_,_,Z,Z).

estaEntre(X,Y,Z):-(X<Y,X>Z);(X>Y,X<Z).

par(A):-((A mod 2)=:=0).
impar(A):-not(par(A)).

dosPares(A,B):-par(A),par(B).
dosPares(A,B,C):-(dosPares(A,B) ; dosPares(A,C) ; dosPares(B,C))
                 ,impar(_).
dosPares(A,B,C,D):-( dosPares(A,B,C) , impar(D) )
                  ;( dosPares(B,C,D) , impar(A) )
                  ;( dosPares(A,C,D) , impar(B) ).
dosPares(A,B,C,D,E):-( dosPares(A,B,C,D) , impar(E))
                    ;( dosPares(B,C,D,E) , impar(A))
                    ;( dosPares(A,E,B,C) , impar(D)).

tresPares(A,B,D):-dosPares(A,B),par(D).
tresPares(A,B,C,D):-(tresPares(A,B,C) , impar(D))
                   ;(tresPares(A,B,D) , impar(C))
                   ;(tresPares(A,C,D) , impar(B))
                   ;(tresPares(D,B,C) , impar(A)).
tresPares(A,B,C,D,E):-(tresPares(A,B,C,D);tresPares(A,E,B,C);tresPares(A,D,E,B);tresPares(C,D,E,A)).


cuatroPares(A,B,C,D):-tresPares(A,B,C),par(D).
cuatroPares(A,B,C,D,E):-(cuatroPares(A,B,C,D)
                        ;cuatroPares(A,B,C,E)
                        ;cuatroPares(A,B,E,D)
                        ;cuatroPares(A,E,C,D)
                        ;cuatroPares(E,B,C,D))
                        ,(impar(_)).

parImpar(A,B):- (par(A),impar(B))
               ;(par(B),impar(A)).
parImpar(A,B,C):-parImpar(A,B)
                ;parImpar(A,C)
                ;parImpar(B,C).
parImpar(A,B,C,D):-parImpar(A,B,C)
                  ;parImpar(B,C,D)
                  ;parImpar(A,C,D).
parImpar(A,B,C,D,E):-parImpar(A,B,C,D)
                    ;parImpar(A,B,C,E)
                    ;parImpar(B,C,D,E).

igual(X,X).
igual(X,X,X).
igual(X,X,X,X).
igual(X,X,X,X,X).
dif(X,Y):-not(igual(X,Y)).

suma(A,B,S):-S is (A+B).
suma(A,B,C,S):-S is (A+B+C).
suma(A,B,C,D,S):-S is (A+B+C+D).
suma(A,B,C,D,E,S):-S is (A+B+C+D+E).
congruente(A,B):-igual(A,B).
congruente(A,B,C):-(suma(A,B,S) , igual(S,C))
                  ;(suma(A,C,S1) , igual(S1,B))
                  ;(suma(C,B,S) , igual(S,A)).
congruente(A,B,C,D):-(suma(A,B,C,S) , igual(S,D))
                    ;(suma(A,B,D) , igual(S,C))
                    ;(suma(A,C,D,S) , igual(S,B))
                    ;(suma(B,C,D,S) , igual(S,A)).
congruente(A,B,C,D,E):-(suma(A,B,C,D,S) , igual(S,E))
                      ;(suma(A,B,C,E,S) , igual(S,D))
                      ;(suma(A,B,D,E,S) , igual(S,C))
                      ;(suma(A,C,D,E,S) , igual(S,B))
                      ;(suma(B,C,D,E,S) , igual(S,A)).

diferencia(A,B,S):-(mayor(A,B) , S is (A-B))
                  ;(mayor(B,A) , S is (B-A)).
menorDiferencia(A,B,Me):-diferencia(A,B,Me).
menorDiferencia(A,B,C,Me):-diferencia(A,B,Me1)
                          ,diferencia(A,C,Me2)
                          ,diferencia(B,C,Me3)
                          ,menor(Me1,Me2,Me3,Me).
menorDiferencia(A,B,C,D,Me):-menorDiferencia(A,B,C,M1)
                            ,menorDiferencia(A,B,D,M2)
                            ,menorDiferencia(A,D,C,M3)
                            ,menorDiferencia(D,B,C,M4)
                            ,menor(M1,M2,M3,M4,Me).
menorDiferencia(A,B,C,D,E,Me):-menorDiferencia(A,B,C,D,M1)
                              ,menorDiferencia(A,B,C,E,M2)
                              ,menorDiferencia(A,B,D,E,M3)
                              ,menorDiferencia(A,D,C,E,M4)
                              ,menorDiferencia(D,B,C,E,M5)
                              ,menor(M1,M2,M3,M4,M5,Me).

%FALTA ESCALERA JIJIJIJ

poker(A,B):-dif(A,B).
poker(A,B,C):-(igual(A,B) , dif(A,C))
             ;(igual(A,C) , dif(A,B))
             ;(igual(C,B) , dif(C,A)).
poker(A,B,C,D):-(igual(A,B,C) , dif(A,D))
               ;(igual(A,B,D) , dif(A,C))
               ;(igual(A,C,D) , dif(A,B))
               ;(igual(B,C,D) , dif(C,A)).
poker(A,B,C,D,E):-((igual(A,B,C,D) , dif(A,E))
                  ;(igual(A,B,C,E) , dif(A,D))
                  ;(igual(A,B,D,E) , dif(A,C))
                  ;(igual(A,D,C,E) , dif(A,B))
                  ;(igual(B,C,D,E) , dif(B,A))).

%FULL
full(A,B):-diferentes(A,B).
full(A,B,C):-diferentes(A,B,C).
full(A,B,C,D):-(igual(A,B) , igual(C,D) , diferentes(A,D))
              ;(igual(A,C) , igual(B,D) , diferentes(A,D))
              ;(igual(C,B) , igual(A,D) , diferentes(A,C)).
full(A,B,C,D,E):-
(igual(A,B,C),igual(D,E),diferentes(A,D));
(igual(A,B,D),igual(C,E),diferentes(A,C));
(igual(A,C,D),igual(B,E),diferentes(A,B));
(igual(B,C,D),igual(A,E),diferentes(B,A));
(igual(A,B,E),igual(C,D),diferentes(A,C));
(igual(A,C,E),igual(B,D),diferentes(A,B));
(igual(B,C,E),igual(A,D),diferentes(B,A));
(igual(A,D,E),igual(B,C),diferentes(A,B));
(igual(B,D,E),igual(A,C),diferentes(A,B));
(igual(C,D,E),igual(A,B),diferentes(A,C)).

segMayor(A, B, My):-mayor(A,B,My).
segMayor(A,B,C,SMa):-medio(A,B,C,SMa).
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,A),mayor(B,C,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,B),mayor(A,C,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,D,SM),igual(SM,C),mayor(A,B,D,SMa),!.
segMayor(A,B,C,D,SMa):-mayor(A,B,C,SMa).

segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=A,mayor(B,C,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=B,mayor(A,C,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=C,mayor(A,B,D,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,E,SMa1),SMa1=:=D,mayor(A,B,C,E,SMa),!.
segMayor(A,B,C,D,E,SMa):-mayor(A,B,C,D,SMa).

segMedio(A,B,C,SMa):-medio(A,B,C,SMa).
segMenor(A,B,Me):-menor(A,B,Me).
segMenor(A,B,C,Me):-medio(A,B,C,Me).
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=A,menor(B,C,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=B,menor(A,C,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=C,menor(B,A,D,SMe),!.
segMenor(A,B,C,D,SMe):-menor(A,B,C,D,SMe1),SMe1=:=D,menor(B,C,A,SMe).

segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=A,menor(B,C,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=B,menor(A,C,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=C,menor(A,B,D,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=D,menor(A,B,C,E,SMe),!.
segMenor(A,B,C,D,E,SMe):-menor(A,B,C,D,E,SMe1),SMe1=:=E,menor(A,B,C,D,SMe).

iguales(A,B):-igual(A,B).
iguales(A,B,C):-igual(A,B,C).
iguales(A,B,C,D):-igual(A,B,C,D).
iguales(A,B,C,D,E):-igual(A,B,C,D,E).

diferentes(A,B):- not(igual(A,B)).
diferentes(A,B,C):- diferentes(A,B)
                   ,diferentes(B,C)
                   ,diferentes(A,C).
diferentes(A,B,C,D):- diferentes(A,B,C)
                     ,diferentes(A,B,D)
                     ,diferentes(A,D,C)
                     ,diferentes(D,B,C).
diferentes(A,B,C,D,E):-diferentes(A,B,C,D),diferentes(A,B,C,E)
                      ,diferentes(A,B,D,E),diferentes(A,D,C,E),diferentes(D,B,C,E).

%true si dos son iguales
dosIguales(A,A).
dosIguales(A,B,C):-(iguales(A,B),diferentes(B,C)) ; (iguales(B,C),diferentes(A,C));(iguales(A,C),diferentes(A,B)).
dosIguales(A,B,C,D):-(auxiliar(A,B,C,Di,Ig),not(dosIguales(D,Di,Ig)));(auxiliar(B,C,D,Di,Ig)
                      ,not(dosIguales(A,Di,Ig)));(auxiliar(A,C,D,Di,Ig),not(dosIguales(B,Di,Ig)))
                       ;(auxiliar(A,B,D,Di,Ig),not(dosIguales(C,Di,Ig))).
dosIguales(A,B,C,D,E):-(auxiliar(A,B,C,Di,Ig),not(dosIguales(D,E,Di,Ig)));(auxiliar(A,B,D,Di,Ig)
                       ,not(dosIguales(C,E,Di,Ig)));(auxiliar(A,B,E,Di,Ig),not(dosIguales(C,D,Di,Ig)))
                       ;(auxiliar(A,C,D,Di,Ig),not(dosIguales(B,E,Di,Ig)));(auxiliar(A,C,E,Di,Ig)
                        ,not(dosIguales(B,D,Di,Ig)));(auxiliar(A,D,E,Di,Ig),not(dosIguales(B,C,Di,Ig)))
                       ;(auxiliar(B,C,D,Di,Ig),not(dosIguales(A,E,Di,Ig)));(auxiliar(B,C,E,Di,Ig)
                       ,not(dosIguales(A,D,Di,Ig)));(auxiliar(B,C,E,Di,Ig),not(dosIguales(A,D,Di,Ig)))
                       ;(auxiliar(C,D,E,Di,Ig),not(dosIguales(A,B,Di,Ig))).

%true si tres son iguales
tresIguales(A,A,A).
tresIguales(A,B,C,D):-(tresIguales(A,B,C),diferentes(A,D));(tresIguales(A,B,D),diferentes(C,D))
                     ;(tresIguales(A,C,D),diferentes(C,B));(tresIguales(B,C,D),diferentes(A,D)).
tresIguales(A,B,C,D,E):-(aux(A,B,C,D,Di,Ig),not(tresIguales(E,Di,Ig)))
                       ;(aux(A,B,C,E,Di,Ig),not(tresIguales(D,Di,Ig)))
                       ;(aux(A,B,D,E,Di,Ig),not(tresIguales(C,Di,Ig)))
                       ;(aux(A,C,D,E,Di,Ig),not(tresIguales(B,Di,Ig)))
                       ;(aux(B,C,D,E,Di,Ig),not(tresIguales(A,Di,Ig))).

%Suma si todos los elementos diferentes, si son diferentes se da 0 por defecto
cuatroIguales(A,A,A,A).
sumaDiferentes(A,B,Sum):-(diferentes(A,B),Sum is A+B);Sum is 0.
sumaDiferentes(A,B,C,Sum):-((diferentes(A,B,C),Sum is A+B+C);(auxiliar(A,B,C,Di,Ig),diferentes(Di,Ig),Sum is Di))
                         ;Sum is 0.
sumaDiferentes(A,B,C,D,Sum):- (diferentes(A,B,C,D),Sum is A+B+C+D)
                            ; (aux(A,B,C,D,Di,Ig), diferentes(Di,Ig) ,Sum is Di)
                            ; (aux2(A,B,C,D,Ig),((diferentes(Ig,A,B),Sum is A+B)
                                                ;(diferentes(Ig,A,C),Sum is A+C)
                                                ;(diferentes(Ig,A,D),Sum is A+D)
                                                ;(diferentes(Ig,B,C),Sum is B+C)
                                                ;(diferentes(Ig,B,D),Sum is B+D)
                                                ;(diferentes(Ig,C,D),Sum is C+D)))
                            ; Sum is 0.
sumaDiferentes(A,B,C,D,E,Sum):-diferentes(A,B,C,D,E),Sum is A+B+C+D+E,!.
sumaDiferentes(A,B,C,D,E,Sum):-iguales(A,B,C,D,E),Sum is 0,!.
sumaDiferentes(A,B,C,D,E,Sum):-aux4(A,B,C,D,E,Di,Ig),Sum is Di,!.
sumaDiferentes(A,B,C,D,E,Sum):-aux3(A,B,C,D,E,I,D1,D2)
                             ,((diferentes(I,D1,D2),Sum is D1+D2)
                             ; (iguales(D1,D2),diferentes(I,D1)
                             ,Sum is 0)),!.
sumaDiferentes(A,B,C,D,E,Sum):-aux2(A,B,C,D,E,I,D1,D2,D3)
                              ,((diferentes(I,D1,D2,D3),Sum is D1+D2+D3)
                              ;(iguales(D1,D2,D3),diferentes(D1,I),Sum is 0)
                              ;(aux2(D1,D2,D3,Igu,Dif),diferentes(I,Igu,Dif)
                              ,Sum is Dif)).

%suma purga
sumaPurga(A,B,Sum):-(iguales(A,B),Sum is (A) );( not(iguales(A,B)) , Sum is (A+B) ).
sumaPurga(A,B,C,Sum):-(diferentes(A,B,C),Sum is A+B+C)
                     ;(auxiliar(A,B,C,Ig,Di)
                     ,diferentes(Ig ,Di),Sum is Ig+Di)
                     ;Sum is A.
sumaPurga(A,B,C,D,Sum):-diferentes(A,B,C,D),Sum is A+B+C+D,!.
sumaPurga(A,B,C,D,Sum):-aux(A,B,C,D,Di,Ig),diferentes(Di,Ig),Sum is Ig+Di,!.
sumaPurga(A,B,C,D,Sum):-(auxiliar(A,B,C,Di,Ig), ( (diferentes(Di,Ig,D),Sum is Di+Ig+D ) ; (Sum is Di+Ig)) ),!.
sumaPurga(A,B,C,D,Sum):-(auxiliar(B,C,D,Di,Ig), ( (diferentes(Di,Ig,A),Sum is Di+Ig+A ) ; (Sum is Di+Ig)) ),!.
sumaPurga(A,B,C,D,Sum):-(auxiliar(A,B,D,Di,Ig), ( (diferentes(Di,Ig,C),Sum is Di+Ig+C ) ; (Sum is Di+Ig)) ),!.
sumaPurga(A,B,C,D,Sum):-(auxiliar(A,C,D,Di,Ig), ( (diferentes(Di,Ig,B),Sum is Di+Ig+B ) ; (Sum is Di+Ig)) ),!.
sumaPurga(A,B,C,D,A).
sumaPurga(A,B,C,D,E,Sum):-diferentes(A,B,C,D,E),Sum is A+B+C+D+E,!.
sumaPurga(A,B,C,D,E,Sum):-iguales(A,B,C,D,E),Sum is A,!.
sumaPurga(A,B,C,D,E,Sum):-aux4(A,B,C,D,E,Di,Ig),Sum is Di+Ig,!.
sumaPurga(A,B,C,D,E,Sum):-aux3(A,B,C,D,E,I,D1,D2),((diferentes(I,D1,D2),Sum is I+D1+D2) ;
                                                   (iguales(D1,D2),diferentes(I,D1),Sum is I+D1)),!.
sumaPurga(A,B,C,D,E,Sum):-aux2(A,B,C,D,E,I,D1,D2,D3),
                         ((diferentes(I,D1,D2,D3),Sum is I+D1+D2+D3)
                         ;(iguales(D1,D2,D3),diferentes(D1,I),Sum is I+D1)
                         ;(aux2(D1,D2,D3,Igu,Dif),diferentes(I,Igu,Dif)
                         ,Sum is I+Igu+Dif)).

%MEJOR SUMA
mejorSuma(A,B,Sum):-igual(A,B),Sum is (A+B),!.
mejorSuma(A,B,Sum):-Sum is (0).
mejorSuma(A,B,C,Sum):-iguales(A,B,C),Sum is (A+B+C),!.
mejorSuma(A,B,C,Sum):-(iguales(A,B),Sum is (A+B))
                     ;(iguales(A,C),Sum is(A+C))
                     ;(iguales(B,C),Sum is (B+C))
                     ;(not(iguales(A,B,C)),Sum is (0)).
mejorSuma(A,B,C,D,Sum):-igual(A,B,C,D),Sum is A*4,!.
mejorSuma(A,B,C,D,Sum):-diferentes(A,B,C,D), Sum is 0,!.
mejorSuma(A,B,C,D,Sum):-aux(A,B,C,D,_,I),Sum is I*3,!.
mejorSuma(A,B,C,D,Sum):-aux2(A,B,C,D,I,D1,D2)
                     ,((iguales(D1,D2),mayor(D1,I,Ma), Sum is Ma*2 )
                     ; Sum is (I*2) ).
mejorSuma(A,B,C,D,E,Sum):-igual(A,B,C,D,E), Sum is A*5,! .
mejorSuma(A,B,C,D,E,Sum):-diferentes(A,B,C,D,E),Sum is 0,! .
mejorSuma(A,B,C,D,E,Sum):-aux4(A,B,C,D,E,_,I), Sum is I*5,! .
mejorSuma(A,B,C,D,E,Sum):-aux3(A,B,C,D,E,Ig,D1,D2)
                        ,(iguales(D1,D2),mayor(D1,Ig,Ma), Sum is Ma*2)
                        ,Sum is Ig*3 .

%SUMA PARES
sumaPares(A,B,Sum):- par(A),par(B),Sum is (A+B),!.
sumaPares(A,B,Sum):-(par(A),impar(B),Sum is A)
                   ;(impar(A),par(B),Sum is B);Sum is (0).

sumaPares(A,B,C,Sum):-sumaPares(A,B,S1),((par(C),Sum is (S1+C))
                    ;(impar(C),Sum is (S1))).
sumaPares(A,B,C,D,Sum):-sumaPares(A,B,C,S1),((par(D),Sum is (S1+D));(impar(D),Sum is (S1))).
sumaPares(A,B,C,D,E,Sum):-sumaPares(A,B,C,D,S1),((par(E),Sum is (S1+E));(impar(E),Sum is (S1))).
%suma impares
sumaImpares(A,B,Sum):- impar(A),impar(B),Sum is (A+B),!.
sumaImpares(A,B,Sum):-(par(A),impar(B),Sum is B);(impar(A),par(B),Sum is A);Sum is (0).

sumaImpares(A,B,C,Sum):-sumaImpares(A,B,S1),((par(C),Sum is (S1));(impar(C),Sum is (S1+C))).
sumaImpares(A,B,C,D,Sum):-sumaImpares(A,B,C,S1),((par(D),Sum is (S1));(impar(D),Sum is (S1+D))).
sumaImpares(A,B,C,D,E,Sum):-sumaImpares(A,B,C,D,S1),((par(E),Sum is (S1));(impar(E),Sum is (S1+E))).

%MEJOR SUMA PARES

mejorSumaPares(A,B):-par(A),par(B),!.
mejorSumaPares(A,B):-(par(A),impar(B),(A>B));(impar(A),par(B),(B>A)).

mejorSumaPares(A,B,C):-par(A),par(B),par(C),!.
mejorSumaPares(A,B,C):-(par(A);impar(A)),sumaPares(A,B,C,S1),sumaImpares(A,B,C,S2),(S1>S2).

mejorSumaPares(A,B,C,D):-(par(A);impar(A)),sumaPares(A,B,C,D,S1),sumaImpares(A,B,C,D,S2),(S1>S2).
mejorSumaPares(A,B,C,D,E):-(par(A);impar(A)),sumaPares(A,B,C,D,E,S1),sumaImpares(A,B,C,D,E,S2),(S1>S2).


%iguales si todos son iguales
iguales(A,A).
iguales(A,B,C):-iguales(A,B),iguales(A,C).
iguales(A,B,C,D):-iguales(A,B,C),iguales(A,D).
iguales(A,B,C,D,E):-iguales(A,B,C,D),iguales(A,E).

%diferentes si todos son diferentes
diferentes(A,B):-not(iguales(A,B)).
diferentes(A,B,C):-diferentes(A,B),diferentes(A,C),diferentes(B,C).
diferentes(A,B,C,D):-diferentes(A,B,C),diferentes(A,B,D),diferentes(A,C,D),diferentes(B,C,D).
diferentes(A,B,C,D,E):-diferentes(A,B,C,D),diferentes(A,B,C,E),diferentes(A,B,D,E),diferentes(A,C,D,E)
                       ,diferentes(B,C,D,E).

%funcion que devuelve los iguales y el diferente de tres
auxiliar(A,B,C,Dif,Igu):- (iguales(A,B),Igu is A,Dif is C) ; (iguales(A,C),Igu is A,Dif is B)
                         ; (iguales(C,B),Igu is B,Dif is A).

%De un grupo de cuatro devuelve el igual(si hay tres) y el diferente
aux(A,B,C,D,Di,Ig):-(iguales(A,B,C),Di is D,Ig is A);(iguales(A,B,D),Di is C,Ig is A)
                   ;(iguales(A,C,D),Di is B,Ig is A);(iguales(B,C,D),Di is A,Ig is B).
%De un grupo de cinco devuelve el igual(si hay cuatro) y el diferente
aux4(A,B,C,D,E,Di,Ig):-(iguales(A,B,C,D),Di is E,Ig is A)
                      ;(iguales(A,B,C,E),Di is D,Ig is A)
                      ;(iguales(A,B,D,E),Di is C,Ig is A)
                      ;(iguales(A,C,D,E),Di is B,Ig is A)
                      ;(iguales(B,C,D,E),Di is A,Ig is B).

%funcion que devuelve el elemento que se repite dos veces de una lista de 4
aux2(A,B,C,D,Ig):-(iguales(A,B),Ig is A);(iguales(A,C),Ig is A);(iguales(A,D),Ig is A);(iguales(B,C),Ig is B)
                 ;(iguales(B,D),Ig is B);(iguales(C,D),Ig is C).
%funcion que devuelve el elmento que se repite dos veces de una lista de 5
aux2(A,B,C,D,E,Ig):-(iguales(A,B),Ig is A);(iguales(A,C),Ig is A)
                   ;(iguales(A,D),Ig is A)
                   ;(iguales(A,E),Ig is A);(iguales(B,C),Ig is B)
                   ;(iguales(B,D),Ig is B);(iguales(B,E),Ig is B)
                   ;(iguales(C,D),Ig is C);(iguales(C,E),Ig is C)
                   ;(iguales(D,E),Ig is D).

%funcion que devuelve el elmento que se repite tres veces
aux3(A,B,C,D,E,Ig):-(iguales(A,B,C),Ig is A)
                    ;(iguales(A,B,D),Ig is A);(iguales(A,B,E),Ig is A)
                     ;(iguales(A,C,D),Ig is A);(iguales(A,C,E),Ig is A)
                   ;(iguales(A,D,E),Ig is A);(iguales(B,C,D),Ig is B)
                   ;(iguales(B,C,E),Ig is B);(iguales(B,D,E),Ig is B);(iguales(C,D,E),Ig is C).
%de 5 elementos si tres son iguales devuelve en Ig y los otros en D1, D2
aux3(A,B,C,D,E,Ig,D1,D2):-(iguales(A,B,C), Ig is A, D1 is D, D2 is E );
                          (iguales(A,B,D),Ig is A, D1 is C, D2 is E);
                          (iguales(A,B,E),Ig is A, D1 is C, D2 is D);
                          (iguales(A,C,D),Ig is A, D1 is B, D2 is E);
                          (iguales(A,C,E),Ig is A, D1 is B, D2 is D);
                          (iguales(A,D,E),Ig is A, D1 is B, D2 is C);
                          (iguales(B,C,D),Ig is B, D1 is A, D2 is E);
                          (iguales(B,C,E),Ig is B, D1 is A, D2 is D);
                          (iguales(B,D,E),Ig is B, D1 is A, D2 is C);
                          (iguales(C,D,E),Ig is C, D1 is A, D2 is B).
%de 4 elementos si 2 son iguales devuelve el igal y los otros 3 en D1 D2 D3
aux2(A,B,C,D,I,D1,D2):-(iguales(A,B),I is A , D1 is C ,D2 is D);
                       (iguales(A,C),I is A , D1 is B ,D2 is D);
                       (iguales(A,D),I is A , D1 is B ,D2 is C);
                       (iguales(B,C),I is B , D1 is A ,D2 is D);
                       (iguales(B,D),I is B , D1 is A ,D2 is C);
                       (iguales(C,D),I is C , D1 is A ,D2 is B).

%de 5 elementos si 2 son iguales devuelve el igal y los otros 3 en D1 D2 D3
aux2(A,B,C,D,E,I,D1,D2,D3):-(iguales(A,B),I is A , D1 is C ,D2 is D, D3 is E);
                            (iguales(A,C),I is A , D1 is B ,D2 is D, D3 is E);
                            (iguales(A,D),I is A , D1 is B ,D2 is C, D3 is E);
                            (iguales(A,E),I is A , D1 is B ,D2 is C, D3 is D);
                            (iguales(B,C),I is B , D1 is A ,D2 is D, D3 is E);
                            (iguales(B,D),I is B , D1 is A ,D2 is C, D3 is E);
                            (iguales(B,E),I is B , D1 is A ,D2 is C, D3 is D);
                            (iguales(C,D),I is C , D1 is A ,D2 is B, D3 is E);
                            (iguales(C,E),I is C , D1 is A ,D2 is B, D3 is D);
                            (iguales(D,E),I is D , D1 is A ,D2 is B, D3 is C).
%de 3 elementos  si 2 son iguales devuelve el igual en I,el diferente en Di
aux2(A,B,C,I,Di):-(iguales(A,B),diferentes(B,C),I is A,Di is C) ; (iguales(B,C),diferentes(A,C),I is B,Di is A)
               ;(iguales(A,C),diferentes(A,B),I is A,Di is B).
%ESCALERA

masuno(A,B):-A =:=B-1 .
escalera(A,B):-masuno(A,B);masuno(B,A).
escalera(A,B,C):-(masuno(A,B),masuno(B,C));(masuno(C,B),masuno(B,A));(masuno(B,A),masuno(A,C))
                 ;(masuno(B,C),masuno(C,A));(masuno(C,A),masuno(A,B)).
escalera(A,B,C,D):-mayor(A,B,C,D,Ms),menor(A,B,C,D,Me),suma(Ms,Me,S),suma(A,B,C,D,ST),(S*2)=:=ST.
escalera(A,B,C,D,E):-mayor(A,B,C,D,E,Ms),menor(A,B,C,D,E,Me),suma(Ms,Me,S),suma(A,B,C,D,E,ST),((S*3)-(Me+2))=:=ST.

