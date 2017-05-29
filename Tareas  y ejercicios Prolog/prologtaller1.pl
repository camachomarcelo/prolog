hombre(cesar).
hombre(luis).
hombre(jorge).
hombre(jose).
hombre(raul).
hombre(julio).
hombre(jaime).

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



hombresimp(cesar,maria).
hombresimp(luis,lucia).
hombresimp(jose,ana).
hombresimp(julio,carla).
hombresimp(cesar,lucia).


mujersimp(cesar,maria).
mujersimp(luis,lucia).
mujersimp(jose,ana).
mujersimp(jaime,gloria).
mujersimp(cesar,lucia).


%pregunta 1

casmutsim(X,Y):-matr(X,Y),hombresimp(X,Y),mujersimp(X,Y).





%pregunta 2

hombressimpcasadas(X):-hombresimp(X,Y),matr(_,Y).



%pregunta 3

simpmutuamentenocasados(X,Y):-hombresimp(X,Y),mujersimp(X,Y),not(matr(X,Y)).


%pregunta 4





padre(X,Y):- madre(Z,Y),matr(X,Z).

abuela(X,Y):-madre(X,Z),madre(Z,Y);madre(X,Z),padre(Z,Y).

abuelo(X,Y):-padre(X,Z),madre(Z,Y);padre(X,Z),padre(Z,Y).

soltero(X):-hombre(X),not(matr(X,_)).

soltera(X):-mujer(X),not(matr(_,X)).

persona(X):-hombre(X);mujer(X).  

hijo(X,Y):-  (madre(Y,X);padre(Y,X)),hombre(X).

hija(X,Y):-  (madre(Y,X);padre(Y,X)),mujer(X).

hermano(X,Y):-  madre(Z,X),madre(Z,Y),hombre(X),X\== Y.

hermana(X,Y):-  madre(Z,X),madre(Z,Y),mujer(X),X\== Y.



matrsinhijos(X,Y):-not(padre(X,Z);madre(Y,Z)).











%%%%%%%%%%%%%

cerveza(paceña).
cerveza(ducal).
cerveza(duff).
cerveza(burn).
cerveza(maltin).
cerveza(inca).

bar(lito).
bar(mandarin).
bar(7calles).
bar(encuentro).

bebedor(maria).
bebedor(luis).
bebedor(jorge).
bebedor(jose).

gusta(maria,paceña).
gusta(luis,ducal).
gusta(jorge,duff).
gusta(jose,burn).
gusta(maria,ducal).
gusta(jose,paceña).

sirve(lito,duff).
sirve(lito,paceña).
sirve(mandarin,ducal).
sirve(7calles,burn).
sirve(7calles,ducal).
sirve(lito,ducal).
sirve(encuentro,ducal).
sirve(7calles,paceña).

frec(maria,lito).
frec(luis,7calles).
frec(jorge,lito).
frec(jose,7calles).










%pregunta 5

pernofrec(X):-hombre(X),not(frec(X,_)).

%pregunta 6


pernogust(X):-(hombre(X);mujer(X)),not(gusta(X,_)).


%pregunta 7


bebefrecgust(X):-bebedor(X),gusta(X,Y),cerveza(Y),bar(Z),sirve(Z,Y),frec(X,Z).

%pregunta 8

cervezanosirvebar(X,Z):-bar(X),cerveza(Z),not(sirve(X,Z)).



%pregunta 9

barnofrec(Z):- bebedor(X),bar(Z),not(frec(X,Z)).



%pregunta 10

mujernobebedora(X):-mujer(X),not(bebedor(X)).


pernobebedor(X):-(hombre(X);mujer(X)),not(bebedor(X)).


























