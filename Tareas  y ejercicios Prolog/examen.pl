hombre(juan).
hombre(alberto).
hombre(jose).


mujer(juana).
mujer(nelly).
mujer(clara).

matr(juan,juana).
matr(alberto,nelly).
matr(jose,clara).
matr(miguel,fabiola).

madre(fabiola,alberto).
madre(juana,alberto).
madre(nelly,jose).
madre(clara,matias).
madre(clara,maria).


padre(X,Y):- madre(Z,Y),matr(X,Z).

abuela(X,Y):- madre(Z,Y),madre(X,Z);padre(W,Y),madre(X,W).

abuelapapa(X,Y):-padre(Z,Y),abuela(X,Z).