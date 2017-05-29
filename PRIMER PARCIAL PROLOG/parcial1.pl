hombre(pedro).
hombre(juan).
hombre(lucas).
hombre(marco).
hombre(tarma).
hombre(mateo).
hombre(paco).

mujer(maria).
mujer(marta).
mujer(carolina).
mujer(eri).
mujer(fio).
mujer(eliza).
mujer(juana).

matri(pedro,maria).
matri(mateo,eliza).
matri(tarma,eri).
matri(juan,marta).
matri(paco,juana).

madre(maria,marco).
madre(maria,tarma).
madre(eliza,eri).
madre(eliza,fio).
madre(marta,carolina).

viudo(tarma).

viuda(eliza).
viuda(maria).

muerto(eri).
muerto(marta).
muerto(mateo).
muerto(pedro).
muerto(juan).

padre(X,Y):- madre(Z,Y), matri(X,Z).

huerfano(X):- madre(Z,X), matri(Y,Z), muerto(Z), muerto(Y).

matrivigente(X,Y):- matri(X,Y), not(muerto(X)), not(muerto(Y)).

nuevomatri(X):- viudo(X); viuda(X).