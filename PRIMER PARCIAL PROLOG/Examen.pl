hombre(pedro).
hombre(juan).
hombre(axel).
hombre(roger).
hombre(luis).
hombre(alberto).
hombre(alex).
hombre(alvaro).
hombre(fredy).
hombre(alfonso).

mujer(juana).
mujer(juliana).
mujer(marta).
mujer(carmen).
mujer(andrea).
mujer(alejandra).
mujer(alessandra).
mujer(estefany).
mujer(paola).
mujer(gabriela).
mujer(claudia).

matr(pedro,juana).
matr(juan,juliana).
matr(axel,marta).
matr(roger,carmen).
matr(luis,andrea).
matr(alberto,alejandra).
matr(alex,alessandra).

viuda(alessandra).
viuda(alejandra).
viuda(andrea).

viudo(roger).
viudo(pedro).
viudo(juan).
viudo(alberto).

madre(alessandra,claudia).
madre(alejandra,gabriela).
madre(alejandra,alfonso).
madre(marta,paola).
madre(juana,estefany).

huerfano(X):-madre(Y,X),viuda(Y),matr(Z,Y),viudo(Z).
matrVigente(X,Y):-matr(X,Y),not(viudo(X)),not(viuda(Y)).
nuevoMatr(X):-viudo(X);viuda(X).