 hombre(cesar).
 hombre(luis).
 hombre(jorge).
 hombre(jose).
 hombre(raul).
 hombre(julio).
 hombre(jaime).
 hombre(pedro).
 hombre(pepe).

 mujer(maria).
 mujer(ely).
 mujer(lucia).
 mujer(ana).
 mujer(gloria).
 mujer(carla).
 mujer(julia).

 matr(cesar,maria).
 matr(luis,lucia).
 matr(jose,ana).
 matr(julio,carla).
 matr(jaime,gloria).
 matr(pedro,ely).

 madre(maria,ely).
 madre(maria,luis).
 madre(lucia,ana).
 madre(lucia,jorge).
 madre(ana,gloria).
 madre(ana,raul).
 madre(carla,jaime).
 madre(gloria,julia).
 madre(ely,pepe).

 persona(X):-hombre(X);mujer(X).

 hermano(X,Y):- hombre(X),madre(Z,X),madre(Z,Y),not(X=Y).
 hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y).
 hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y).
 hermana(X,Y):- mujer(X),madre(Z,X),madre(Z,Y),not(X=Y).

 padre(X,Y):-madre(Z,Y),matr(X,Z).

 abuela(X,Y):-(madre(Z,Y),madre(X,Z));(padre(Z,Y),madre(X,Z)).
 abuelo(X,Y):-abuela(Z,Y),matr(X,Z).

 hermanos(X,Y):-madre(Z,X),madre(Z,Y).

 desc(X,Y):-madre(Y,X);padre(Y,X).
 desc(X,Y):-madre(Z,X),desc(Z,Y);padre(Z,X),desc(Z,Y).

 persona(X):-hombre(X);mujer(X).

 hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y).
 hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y).

 padre(X,Y):-madre(Z,Y),matr(X,Z).

 abuela(X,Y):- abuelo(Z,Y),matri(Z,X). 
 abuela(X,Y):-(madre(Z,Y),madre(X,Z));(padre(Z,Y),madre(X,Z)).
 abuelo(X,Y):-abuela(Z,Y),matr(X,Z).
 abuelo(X,Y):-madre(Z,Y),padre(X,Z);padre(Z,Y),padre(X,Z).

 hermanos(X,Y):-madre(Z,X),madre(Z,Y).

 desc(X,Y):-madre(Y,X);padre(Y,X).
 desc(X,Y):-madre(Z,X),desc(Z,Y);padre(Z,X),desc(Z,Y).

 soltera(X):-mujer(X),not(matri(_,X)).
 soltero(X):-hombre(X),not(matri(X,_)).    

 sinHijos(X):-mujer(X),matri(_,X),not(madre(X,_)).

 bisAbuelo(X,Y):-madre(Z,Y),abuelo(X,Z);
                padre(Z,Y),abuelo(X,Z).
 bisAbuela(X,Y):-madre(Z,Y),abuela(X,Z);
                padre(Z,Y),abuela(X,Z).

 tataraAbuelo(X,Y):- abuelo(Z,Y),abuelo(X,Z);
                    abuela(Z,Y),abuelo(X,Z).
 tataraAbuela(X,Y):- abuelo(Z,Y),abuela(X,Z);
                    abuela(Z,Y),abuela(X,Z).

 hijo(X,Y):-hombre(X),madre(Y,X);
           hombre(X),padre(Y,X).
 hija(X,Y):-mujer(X),madre(Y,X);
           mujer(X),padre(Y,X).

 hijoUnico(X):- not(hermano(X,_)).
 hijaUnica(X):- not(hermana(X,_)).