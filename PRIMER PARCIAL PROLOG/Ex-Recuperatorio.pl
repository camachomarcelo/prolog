hombre(juan).
hombre(fran).
hombre(fernando).
hombre(ronel).
hombre(diego).
hombre(walter).
hombre(marco).
hombre(roger).
hombre(fredy).
hombre(carlos).

mujer(maria).
mujer(linda).
mujer(lucia).
mujer(martha).
mujer(flor).
mujer(carla).
mujer(fabiola).
mujer(ana).

matri(juan,maria).
matri(diego,lucia).
matri(diego,fabiola).
matri(marco,martha).
matri(fran,linda).
matri(roger,linda).
matri(walter,carla).
matri(carlos,flor).

madre(maria,fran).
madre(maria,lucia).
madre(maria,martha).
madre(lucia,walter).
madre(linda,ronel).
madre(linda,fernando).
madre(martha,flor).
madre(martha,fredy).
madre(fabiola,ana).

viuda(linda).
viuda(martha).

viudo(diego).
viudo(marco).


padre(X,Y):-madre(Z,Y),matri(X,Z).
hijo(A,B) :-padre(B,A).
persona(X):-hombre(X);mujer(X).

huerfano(H):- persona(H),padre(P,H),madre(M,H),matri(P,M),(viudo(P),viuda(M)).
fallecido(X):-viuda(M),matri(X,M).
fallecida(X):-viudo(H),matri(H,X).