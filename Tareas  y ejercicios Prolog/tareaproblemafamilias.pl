hombre(adan).
hombre(jorge).
hombre(reynaldo).
hombre(julian).
hombre(pedro).
hombre(luis).
hombre(pepe).
hombre(raul).
hombre(jaime).
hombre(alejandro).
hombre(getulio).

mujer(eva).
mujer(ana).
mujer(erika).
mujer(eliana).
mujer(fabiola).
mujer(lucia).
mujer(gloria).
mujer(antonieta).
mujer(mariana).
mujer(lili).
mujer(ely).
mujer(gaby).
mujer(julieta).
mujer(mary).
mujer(elvia).
matr(adan,eva).
matr(jorge,ana).
matr(reynaldo,erika).
matr(julian,fabiola).
matr(alejandro,julieta).
matr(pedro,lucia).
matr(luis,gloria).
matr(raul,ely).
matr(jaime,mary).

madre(eva,ana).
madre(eva,erika).
madre(ana,lucia).
madre(ana,luis).
madre(lucia,pepe).
madre(lucia,lili).
madre(gloria,ely).
madre(gloria,gaby).
madre(ely,mary).
madre(ely,elvia).
madre(erika,eliana).
madre(erika,julian).
madre(fabiola,antonieta).
madre(fabiola,mariana).
madre(antonieta,julieta).
madre(julieta,getulio).
 
igual(X,X).
dif(X,Y):-not(igual(X,Y)).

padre(X,Y):-madre(Z,Y),matr(X,Z).
abuela(X,Y):-madre(X,Z),(padre(Z,Y);madre(Z,Y)).
abuelo(X,Y):-padre(X,Z),(padre(Z,Y);madre(Z,Y)).


soltero(X):-hombre(X), not(matr(X,_)).
soltera(M):-mujer(M), not(matr(_,M)).
persona(X):-hombre(X);mujer(X).

hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y),dif(X,Y).
hermana(X,Y):-mujer(X),(madre(Z,X),madre(Z,Y)),dif(X,Y).

sinHijos(X,Y):-(matr(X,Y);matr(Y,X)), not((madre(Y,_));(madre(X,_))).

hijoUnico(X):-not(hermano(X,_)).
hijaUnica(M):-not(hermana(M,_)).

primosHermanos(X,Y) :- abuela(Z,X),abuela(Z,Y),dif(X,Y),not(hermano(X,Y);hermana(X,Y)).

cunado(X,Y) :- ((matr(X,Z),hermana(Z,Y))  ;  ((matr(Y,Z);matr(Z,Y)) ,hermano(X,Z))).
cunada(X,Y) :- ((matr(Z,X),hermano(Z,Y));((matr(Y,Z);matr(Z,Y)),hermana(X,Z))).

tio(X,Y) :- madre(Z,Y) , padre(Q,Y) ,(hermano(X,Z) ; cunado(X,Z) ; primosHermanos(X,Z);primosHermanos(X,Q);(primosHermanos(P,Q),matr(X,P))).
tia(X,Y) :- madre(Z,Y) , padre(Q,Y), (hermana(X,Z) ; cunada(X,Z) ;primosHermanos(X,Z); primosHermanos(X,Q);(primosHermanos(P,Q),matr(P,X))).

sobrino(X,Y) :- hombre(X),(tio(Y,X) ; tia(Y,X)). 
sobrina(X,Y) :- mujer(X),(tio(Y,X) ; tia(Y,X)).

hijo(X,Y) :- hombre(X) , (madre(Y,X) ; padre(Y,X)).                
hija(X,Y) :- mujer(X) , (madre(Y,X) ; padre(Y,X)).

yerno(X,Y):-hombre(X),(madre(Y,Z);padre(Y,Z)),matr(X,Z).
nuera(X,Y):-mujer(X),(madre(Y,Z);padre(Y,Z)),matr(Z,X).

suegro(X,Y) :- matr(X,Z) , madre(Z,P) , ( matr(P,Y) ; matr(Y,P) ).
suegra(X,Y) :- madre(X,P) , ( matr(P,Y) ; matr(Y,P) ).

nieto(X,Y) :- hombre(X) , (abuela(Y,X) ; abuelo(Y,X)).
nieta(X,Y) :- mujer(X) , (abuela(Y,X) ; abuelo(Y,X)).	

bisabuelo(X,Y) :- padre(X,Z) , (abuelo(Z,Y) ; abuela(Z,Y)).
bisabuela(X,Y) :- madre(X,Z) , (abuelo(Z,Y) ; abuela(Z,Y)).

bisnieto(X,Y) :- hombre(X) , ( bisabuelo(Y,X) ; bisabuela(Y,X) ).
bisnieta(X,Y) :- mujer(X) , ( bisabuelo(Y,X) ; bisabuela(Y,X) ).

tioAbuelo(X,Y):- abuela(Z,Y) , ( hermano(X,Z) ; cunado(X,Z) ; primoHermano(X,Z)).
tiaAbuela(X,Y):- abuela(Z,Y) , ( hermana(X,Z) ; cunada(X,Z) ; primoHermano(X,Z)).

sobrinoNieto(X,Y) :- hombre(X) , ( tioAbuelo(Y,X) ; tiaAbuela(Y,X) ).
sobrinaNieta(X,Y) :- mujer(X) , ( tioAbuelo(Y,X) ; tiaAbuela(Y,X) ).

concunado(X,Y) :- hermano(X,Z) , ( cunado(Z,Y) ; cunada(Z,Y) ).
concunada(X,Y) :- hermana(X,Z) , ( cunado(Z,Y) ; cunada(Z,Y) ).

consuegro(X,Y) :- hombre(X) , (hijo(P,X) , hijo(Q,Y) , ( matr(P,Q) ; matr(Q,P) )).
consuegra(X,Y) :- mujer(X) , (hijo(P,X) , hijo(Q,Y) , ( matr(P,Q) ; matr(Q,P) )).

tatarabuelo(X,Y) :- padre(X,A) , ( bisabuelo(A,Y) ; bisabuela(A,Y) ).
tatarabuela(X,Y) :- madre(X,A) , ( bisabuelo(A,Y) ; bisabuela(A,Y) ).

tataranieto(X,Y) :- hombre(X) , ( tatarabuelo(Y,X) ; tatarabuela(Y,X) ).
tataranieta(X,Y) :- mujer(X) , ( tatarabuelo(Y,X) ; tatarabuela(Y,X) ).

