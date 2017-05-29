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

madre(maria,ely).
madre(maria,luis).
madre(lucia,ana).
madre(lucia,jorge).
madre(ana,gloria).
madre(ana,raul).
madre(carla,jaime).
madre(gloria,julia).

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

cerveza(paceña).
cerveza(ducal).
cerveza(duff).
cerveza(duff2).
cerveza(unknow).
cerveza(alberyt).

bar(tabernamoe).
bar(irlandes).
bar(bufalo).
bar(ozzpub).

bebedor(maria).
bebedor(luis).
bebedor(jorge).
bebedor(jose).

gusta(maria,paceña).
gusta(luis,ducal).
gusta(jorge,duff).
gusta(jose,duff2).
gusta(maria,ducal).
gusta(jose,paceña).

sirve(tabernamoe,duff).
sirve(tabernamoe,paceña).
sirve(irlandes,ducal).
sirve(bufalo,duff2).
sirve(bufalo,ducal).
sirve(tabernamoe,ducal).
sirve(ozzpub,ducal).
sirve(bufalo,paceña).

frec(maria,tabernamoe).
frec(luis,bufalo).
frec(jorge,tabernamoe).
frec(jose,bufalo).




pernofrec(X):-(hombre(X);mujer(X)),not(frec(X,_)).
pernogust(X):-(hombre(X);mujer(X)),not(gusta(X,_)).
bebefrecgust(X):-bebedor(X),gusta(X,Y),cerveza(Y),bar(Z),sirve(Z,Y),frec(X,Z).
cervezanosirvebar(X,Z):-bar(X),cerveza(Z),not(sirve(X,Z)).
barnofrec(Z):- bebedor(X),bar(Z),not(frec(X,Z)).



pernobebedor(X):-(hombre(X);mujer(X)),not(bebedor(X)).
matrbebedor(X,Y):-matr(X,Y),bebedor(X),bebedor(Y).


simpmutuamentecasados(X,Y):-matr(X,Y),hombresimp(X,Y),mujersimp(X,Y).
hombressimpcasadas(X):-hombresimp(X,Y),matr(_,Y).
simpmutuamentenocasados(X,Y):-hombresimp(X,Y),mujersimp(X,Y),not(matr(X,Y)).

hombrenosecaensimpa(X):-not(hombresimp(X,_)).
mujernosecaensimpa(X):-not(mujersimp(X,_)).




padre(X,Y):-  madre(Z,Y) ,  matr(X,Z).

abuela(X,Y):-  madre(X,Z) ,  madre(Z,Y)  ;  madre(X,Z) ,  padre(Z,Y).
abuelo(X,Y):-  padre(X,Z)  ,  madre(Z,Y)  ;  padre(X,Z)  ,  padre(Z,Y).

soltero(X):-  hombre(X)  ,  not(  matr(X,_)  ).
soltera(X):-  mujer(X)  ,  not(  matr(_,X)  ).

persona(X):-  hombre(X)  ;  mujer(X).  

hijo(X,Y):-  (  madre(Y,X)  ;  padre(Y,X)  )  ,  hombre(X).
hija(X,Y):-  (  madre(Y,X)  ;  padre(Y,X)  )  ,  mujer(X).

hermano(X,Y):-  madre(Z,X)  ,  madre(Z,Y)  ,  hombre(X)  ,  X \== Y.
hermana(X,Y):-  madre(Z,X)  ,  madre(Z,Y)  ,  mujer(X)  ,  X \== Y.

primosherm(X,Y):-abuela(Z,X)  ,  abuela(Z,Y)  ,  not(  hermano(X,Y)  ;  hermana(X,Y) ).

hijounico(X):-  (  not( hermano(X,_)  ;  hermana(X,_)  )  )  ,  hombre(X).
hijaunica(X):-  (  not( hermano(X,_)  ;  hermana(X,_)  )  )  ,  mujer(X).

matrsinhijos(X,Y):-  not( padre(X,Z)  ;  madre(Y,Z)  ).

nieto(X,Y):-  (  padre(Z,X)  ;  madre(Z,X)  )  ,  (  hijo(Z,Y)  ;  hija(Z,Y)  )  ,  hombre(X).
nieta(X,Y):-  (  padre(Z,X)  ;  madre(Z,X)  )  ,  (  hijo(Z,Y)  ;  hija(Z,Y)  )  ,  mujer(X).

tio(X,Y):-  abuela(Z,Y)  ,  madre(Z,X)  ,  not(  padre(X,Y)  )  ,  hombre(X).
tia(X,Y):-  abuela(Z,Y)  ,  madre(Z,X)  ,  not(  madre(X,Y)  ) ,  mujer(X).

yerno(X,Y):-  matr(X,Z)  ,  (  padre(Y,Z)  ;  madre(Y,Z)  ).
nuera(X,Y):-  matr(Z,X)  ,  (  padre(Y,Z)  ;  madre(Y,Z)  ).

tioabuelo(X,Y):-  hermano(X,Z)  ,  (  abuelo(Z,Y)  ;  abuela(Z,Y)  ).
tiaabuela(X,Y):-  hermana(X,Z)  ,  (  abuelo(Z,Y)  ;  abuela(Z,Y)  ).

bisabuelo(X,Y):-  padre(X,Z)  ,  (  abuelo(Z,Y)  ;  abuela(Z,Y)  ).
bisabuela(X,Y):-  madre(X,Z)  ,  (  abuelo(Z,Y)  ;  abuela(Z,Y)  ).

bisnieto(X,Y):-  hijo(X,Z)  ,  nieto(Z,Y).
bisnieta(X,Y):-  hijo(X,Z)  ,  nieto(Z,Y).

suegro(X,Y):-  padre(X,Z)  ,  (  matr(Y,Z)  ;  matr(Z,Y)  ).
suegra(X,Y):-  madre(X,Z)  ,  (  matr(Y,Z)  ;  matr(Z,Y)  ).

cunhado(X,Y):-  hermano(X,Z)  ,  (  matr(Y,Z)  ;  matr(Z,Y)  ).
cunhada(X,Y):-  hermana(X,Z)  ,  (  matr(Y,Z)  ;  matr(Z,Y)  ).

sobrino(X,Y):-  (  tio(Y,X)  ;  tia(Y,X)  )  ,  hombre(X).
sobrina(X,Y):-  (  tio(Y,X)  ;  tia(Y,X)  )  ,  mujer(X).

concunhado(X,Y):-  matr(X,W)  ,  (  (  matr(Y,Z)  ,  hermana(W,Z)  )  ;  (  matr(Z,Y)  ,  hermano(Z,W)  )  ).
concunhada(X,Y):-  matr(W,X)  ,  (  (  matr(Y,Z)  ,  hermana(Z,W)  )  ;  (  matr(Z,Y)  ,  hermano(Z,W)  )  ).
