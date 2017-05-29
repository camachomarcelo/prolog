hombre(cesar).
hombre(jose).
hombre(luis).
hombre(jaime).
hombre(jorge).
hombre(edwin).

mujer(ely).
mujer(mery).
mujer(lucia).
mujer(ana).

madre(lucia,ana).
madre(lucia,jose).
madre(ana,ely).
madre(mery,luis).
madre(mery,jaime).

matri(cesar,lucia).
matri(jorge,ana).
matri(jose,mery).

matri(juan,josefina).
madre(josefina,mery)

padre(X,Y):-madre(Z,Y),matri(X,Z).

hija(X,Y):-madre(Y,X),mujer(X).
hijo(X,Y):-madre(Y,X),hombre(X).

abuela(X,Y):-madre(X,Z),(padre(Z,Y);madre(Z,Y)).
abuelo(X,Y):-padre(X,Z),(padre(Z,Y);madre(Z,Y)).


nieto(X,Y):- hombre(X),(abuela(Y,X);abuelo(Y,X)).
nieta(X,Y):- mujer(X),(abuela(Y,X);abuelo(Y,X)).	

suegro(X,Y):-matri(X,Z),madre(Z,P),( matri(P,Y);matri(Y,P)).
suegra(X,Y):-madre(X,P),( matri(P,Y);matri(Y,P)).





