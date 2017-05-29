hombre(jose).
hombre(segundo).
hombre(cuper).
hombre(ricardo).
hombre(richard).
hombre(yeril).

mujer(ana).
mujer(eva).
mujer(beatriz).
mujer(judith).
mujer(mery).
mujer(jany).
mujer(ely).
mujer(magdalena).

matr(jose,ana).
matr(segundo,eva).
matr(cuper,beatriz).
matr(ricardo,judith).

madre(ana,segundo).
madre(eva,cuper).
madre(eva,ricardo).
madre(beatriz,mery).
madre(beatriz,jany).
madre(judith,yeril).
madre(judith,richard).
madre(magdalena,beatriz).
madre(magdalena,ely).


padre(X,Y):-madre(Z,Y),matr(X,Z).

hijo(X,Y):-hombre(X),(madre(Y,X);padre(Y,X)).
hija(X,Y):-mujer(X),(madre(Y,X);padre(Y,X)).

hermano(X,Y):-hombre(X),hijo(X,Z),(hijo(Y,Z);hija(Y,Z)),X\==Y.
%hermana(X,Y):-madre(Z,X),madre(Z,Y),mujer(X),X\==Y,!.
hermana(X,Y):-mujer(X),hija(X,Z),(hijo(Y,Z);hija(Y,Z)),X\==Y.

abuelo(X,Y):-hombre(X),(hijo(Y,Z);hija(Y,Z)),(hija(Z,X);hijo(Z,X)).

primo(X,Y):-(hijo(Y,Z);hija(Y,Z)),hijo(X,Z1),(hermano(Z,Z1);hermana(Z,Z1)).

%tio(X,Y):-hija(Y,Z),hermano(X,Z);hijo(Y,Z),hermano(X,Z).
tio(X,Y):-madre(Z,Y),hermano(X,Z);padre(Z,Y),hermano(Z,X).
tia(X,Y):-madre(Z,Y),hermana(X,Z);padre(Z,Y),hermana(X,Z).

sobrino(X,Y):-hombre(X),tio(Y,X);tia(Y,X).

cunado(X,Y):-matr(Z,Y),hermano(X,Z).
%;matr(Y,Z),hermana(Z,X).
cunada(X,Y):-hermana(X,Z),matr(Y,Z).





