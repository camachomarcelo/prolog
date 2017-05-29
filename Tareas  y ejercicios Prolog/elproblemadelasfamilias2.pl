%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Tarea #1. El Problema de las Familias %							       %
% 																	       %
% Representar una Base de Conocimientos sobre sus propias familias         %
% considerar a lo más 4 generaciones y al menos 30 personas                % 
%                                                                          %
% hombre(X),                                                               %
% mujer(X),																   %	
% matr(X, Y),                                                              %
% madre(X, Y),															   %
%																	       %
% Completar la base de conocimiento con al menos 25 reglas de inferencia   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



hombre(gerardo).
hombre(teofilo).
hombre(orlando).
hombre(lalo).
hombre(kevin).
hombre(grover).
hombre(tito).
hombre(robert).
hombre(beto).
hombre(jaime).
hombre(yhony).
hombre(paul).
hombre(fernando).
hombre(lucas).
hombre(diego).
hombre(braian).
hombre(alvaro).
hombre(ariel).
hombre(buby).
hombre(andres).
hombre(macgiber).

mujer(kintina).
mujer(angela).
mujer(marlene).
mujer(consuelo).
mujer(aide).
mujer(natalia).
mujer(yola).
mujer(mirian).
mujer(alejandra).
mujer(kity).
mujer(araceli).
mujer(adriana).
mujer(daniela).
mujer(valeria).
mujer(camila).
mujer(mariela).
mujer(marioly).
mujer(mariajose).
mujer(alison).
mujer(carlita).
mujer(tiburcia).
mujer(brijida).

matr(gerardo,kintina).
matr(teofilo,yola).
matr(yhony,angela).
matr(jaime,marlene).
matr(orlando,mirian).
matr(beto,consuelo).
matr(lalo,alejandra).
matr(teofilo,kity).
matr(ariel,aide).
matr(robert,carlita).
matr(grover,tiburcia).
matr(buby,angela).

madre(kintina,teofilo).
madre(kintina,angela).
madre(kintina,marlene).
madre(kintina,orlando).
madre(kintina,consuelo).
madre(kintina,lalo).
madre(yola,grover).
madre(yola,alvaro).
madre(yola,braian).
madre(kity,kevin).
madre(angela,tito).
madre(angela,alison).
madre(marlene,paul).
madre(marlene,fernando).
madre(marlene,daniela).
madre(marlene,valeria).
madre(marlene,camila).
madre(mirian,robert).
madre(mirian,marioly).
madre(mirian,mariela).
madre(mirian,mariajose).
madre(consuelo,diego).
madre(consuelo,lucas).
madre(consuelo,natalia).
madre(alejandra,adriana).
madre(aide,andres).
madre(tiburcia,araceli).
madre(brijida,aide).
madre(kintina,brijida).

persona(X):-hombre(X);mujer(X).
padre(X,Y):-madre(Z,Y),matr(X,Z).
abuela(X,Y):-padre(Z,Y),madre(X,Z);madre(Z,Y),madre(X,Z).
abuelo(X,Y):-abuela(Z,Y),matr(X,Z).
hijos(X,Y,P):-madre(Y,P).
tio(X,Y):-madre(Z,Y),hermano(X,Z);padre(Z,Y),hermano(X,Z).
tia(X,Y):-madre(Z,Y),hermana(X,Z);padre(Z,Y),hermana(X,Z).
tios(X,Y):-madre(Z,Y),hermanos(X,Z);padre(Z,Y),hermanos(X,Z).
hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y),X\=Y.
hermana(X,Y):-madre(Z,Y),madre(Z,X),mujer(X),X\=Y.
hermanos(X,Y):-madre(Z,X),madre(Z,Y),X\=Y.
primos(X,Y):-abuela(Z,Y),abuela(Z,X),not(hermanos(X,Y)),X\=Y.
primo(X,Y):-abuela(Z,Y),abuela(Z,X),hombre(X),not(hermanos(X,Y)),X\=Y.
prima(X,Y):-abuela(Z,Y),abuela(Z,X),mujer(X),not(hermanos(X,Y)),X\=Y.
suegro(X,Y):-matr(Z,Y),padre(X,Z);matr(Y,Z),padre(X,Z).
suegra(X,Y):-matr(Z,Y),madre(X,Z);matr(Y,Z),madre(X,Z).
madrastra(X,Y):-padre(Z,Y),matr(Z,X),not(madre(X,Y)).
hermanastro(X,Y):-padre(Z,Y),matr(Z,P),not(madre(P,Y)), hijos(Z,P,X).
yerno(X,Y):-matr(Y,Z),hijos(Y,Z,P),mujer(P),matr(X,P);matr(Z,Y),hijos(Z,Y,P),mujer(P),matr(X,P).
nuera(X,Y):-matr(Z,Y),hijos(Z,Y,P),hombre(P),matr(P,X);matr(Y,Z),hijos(Y,Z,P),hombre(P),matr(P,X).
concuñada(X,Y):-matr(Z,Y),hermano(P,Z),matr(P,X);matr(Y,Z),hermano(P,Z),matr(P,X).
concuñado(X,Y):-matr(Z,Y),hermana(P,Z),matr(X,P);matr(Y,Z),hermana(P,Z),matr(X,P).
cuñados(X,Y):-matr(Z,Y),hermanos(X,Z);matr(Y,Z),hermanos(X,Z).
soltero(X):-mujer(X),not(matr(_,X));hombre(X),not(matr(X,_)  ).
nieto(Y,X):-abuelo(X,Y);abuela(X,Y).
hijounico(X):-not(hermanos(X,Y)).
parejasinhijos(X,Y):-  not( padre(X,Z);madre(Y,Z)).
bisabuelo(X,Y):-padre(Z,Y),abuelo(X,Z);madre(Z,Y),abuelo(X,Z).
tiosabuelos(X,Y):-hermanos(X,Z),(abuelo(Z,Y);abuela(Z,Y)).
bisnieto(X,Y):-bisabuelo(Y,X).
primoshermanos(X,Y):-abuela(Z,X),abuela(Z,Y),not(hermanos(X,Y)).
tiopolitico(X,Y):-tia(Z,Y),matr(X,Z);tio(Z,Y),matr(Z,X).
tataraabuelo(X,Y):-padre(X,Z),abuelo(Z,Y).
suegro(X,Y):-(matr(Y,Z),padre(X,Z));(matr(Z,Y),padre(X,Z)).
cuñado(X,Y):-(matr(Y,Z),hermano(X,Z));(matr(Z,Y),hermano(X,Z)).
tioabuelo(X,Y):-hermano(X,Z),abuelo(Z,Y).
hijo(X,Y):-padre(Y,X);madre(Y,X).
primoshermano(X,Y):-tios(Z,Y),hijo(Z,X).
esposa(X,Y):-matri(X,Y).

