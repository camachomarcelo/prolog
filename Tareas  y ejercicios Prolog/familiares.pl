
hombre(jorge).
hombre(pedro).
hombre(miguel).
hombre(sebastian).
hombre(marcos).
hombre(ruben).
hombre(ronald).
hombre(jose).
hombre(ruben).
hombre(percy).

mujer(juana).
mujer(jeni).
mujer(susi).
mujer(marta).
mujer(julia).
mujer(estela).
mujer(jimena).
mujer(maria).
mujer(eli).
mujer(carla).
mujer(sofia).
mujer(tatiana).
mujer(carolina).

matri(ruben,sandra).
matri(tito,jimena).
matri(roberto,maria).
matri(carlos,jeni).
matri(sebastian,julia).
matri(estevan,angelica).
matri(marcos,ester).
matri(ruben,carla).
matri(percy,tatiana).

madre(juana,tito).
madre(juana,carlos).
madre(jeni,susi).
madre(marta,julia).
madre(ana,sandra).
madre(ana,jimena).
madre(ana,pedro).
madre(sandra,roberto).
madre(maria,eli).
madre(maria,estevan).
madre(sofia,carla).
madre(sofia,tatiana).
madre(carla,pedro).
madre(tatiana,carolina).



% EJERCICIOS EN CLASE %


padre(X,Y):- madre(Z,Y), matri(X,Z).
abuela(X,Y):- madre(Z,Y), madre(X,Z);
            padre(Z,Y), madre(X,Z).
abuelo(X,Y):- abuela(Z,Y), matri(X,Z).
soltera(X):-mujer(X), not(matri(_,X)).
sinHijos(X,Y):-matri(X,Y), not(madre(Y,_)).
sinMadre(X):-not(madre(_,X)).
persona(X):-hombre(X); mujer(X).
hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y).
hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y).
primosHermanos(X,Y):-madre(Z,X),madre(W,Y),hermana(Z,W);
				     padre(Z,X),padre(W,Y),hermano(Z,W);
					 padre(Z,X),madre(W,Y),hermana(W,Z);
					 madre(Z,X),padre(W,Y),hermana(Z,W).

% RECURSIVOS %
					 
desc(X,Y):-madre(Y,X);padre(Y,X).
desc(X,Y):-madre(Z,X),desc(Z,Y);
           padre(Z,X),desc(Z,Y).
pariente(X,Y):-

ajenos(X,Y).
