hombre(ernesto).
hombre(lucho).
hombre(benito).
hombre(andres).
hombre(adrian).
hombre(jose).
hombre(juancho).
hombre(ricardo).
hombre(jorge).
hombre(junior).
hombre(dario).
hombre(rodrigo).
hombre(roberto).
hombre(olvis).
hombre(marcelo).
hombre(vladimir).
hombre(josue).

mujer(maritza).
mujer(silvana).
mujer(maria).
mujer(ana).
mujer(angelica).
mujer(juana).
mujer(valeria).
mujer(diana).
mujer(gloria).
mujer(melissa).
mujer(arleth).
mujer(bruna).
mujer(tania).
mujer(mariana).
mujer(sandra).
mujer(jessica).
mujer(lucia).
mujer(laura).
mujer(maricela).
mujer(anabel).


matr(ernesto,bruna).
matr(dario,maritza).
matr(jorge,diana).
matr(roberto,mariana).
matr(vladimir,angelica).
matr(rodrigo,tania).
matr(ricardo,arleth).
matr(adrian,ana).
matr(jose,valeria).

madre(bruna,lucho).
madre(bruna,angelica).
madre(maritza,vladimir).
madre(maritza,junior).
madre(maritza,rodrigo).
madre(diana,tania).
madre(diana,olvis).
madre(diana,gloria).
madre(diana,ricardo).
madre(mariana,arleth).
madre(tania,ana).
madre(tania,juancho).
madre(tania,maria).
madre(tania,juana).
madre(tania,valeria).
madre(arleth,jose).
madre(arleth,adriana).

persona(X):-hombre(X);mujer(X).
casado(X):- matri(X,_).
casada(Y):- matri(_,X).	 
viudo(X):- hombre(X),not(matr(X,_)).
viuda(X):- mujer(Y),not(matr(_,Y)).
huerfano(X):-not padre(Z, X), not madre(Z, X).
matrVigente(X,Y):- casado(X), casado(Y), matr(X,Y).
nuevoMatr(X):-viudo(X),matr(X,Y),not(viuda(Y)),not(viuda(X)),matr(Y,X),not(viudo(Y)).









