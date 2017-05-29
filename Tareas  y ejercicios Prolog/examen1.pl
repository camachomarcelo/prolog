%hechos

hombre(pedro).
hombre(sandro).
hombre(david).
hombre(lucho).
hombre(lino).

mujer(maria).
mujer(diana).
mujer(nely).
mujer(virginia).
mujer(sandra).
mujer(lucia).
mujer(karla).
mujer(carmen).
mujer(dionicia).


matri(pedro,maria).
matri(sandro,diana).
matri(david,karla).


hombreSimp(david,sandra).
hombreSimp(david,lucia).
hombreSimp(david,karla).

hombreSimp(sandro,virginia).
hombreSimp(lino,dionicia).
hombreSimp(lucho,carmen).

mujerSimp(virginia,sandro).
mujerSimp(sandra,david).
mujerSimp(karla,david).
mujerSimp(lucia,david).
mujerSimp(carmen,lucho).
mujerSimp(dionicia,lino).

%reglas

matriSimpaticoMutuo(X,Y):-matri(X,Y), hombreSimp(X,Y), mujerSimp(Y,X).
hSimpaticoMcasada(X,Y):-matri(Z, Y), hombreSimp(X,Y).
HMsimpaticoMutuoNoCasado(X,Y):-hombreSimp(X,Y),mujerSimp(Y,X),not(matri(X,Y)).

