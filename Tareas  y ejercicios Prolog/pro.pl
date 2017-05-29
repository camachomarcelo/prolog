hombre(brian).
hombre(jose).
hombre(leoncio).

mujer(cecilia).
mujer(francisca).
mujer(ely).
mujer(marta).
mujer(maria).


madre(cecilia,brian).
madre(francisca,cecilia).
madre(ines,jose).
madre(ely,marta).
madre(ely,maria).
madre(ely,francisca).

matr(jose,cecilia).
matr(leoncio,francisca).
matr(pedro,ines).

padre(X,Y):-madre(Z,Y),matr(X,Z).

abuelo(X,Y):-madre(Z,Y),padre(X,Z);padre(Z,Y),padre(X,Z).
abuela(X,Y):-abuelo(Z,Y),matr(X,Z).
hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y).

hermabuela(X,Y):-abuela(Z,Y),hermana(X,Z).



