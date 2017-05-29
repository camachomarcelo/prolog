hombre(cesar).
hombre(jorge).
hombre(jose).
hombre(luis).
hombre(jaime).
hombre(tonny).

mujer(ely).
mujer(mery).
mujer(lucia).
mujer(ana).
mujer(carla).

matrimonio(cesar,lucia).
matrimonio(jorge,ana).
matrimonio(jose,mery).

madre(lucia,ana).
madre(lucia,jose).
madre(ana,ely).
madre(mery,luis).
madre(mery,jaime).

padre(X,Y):-matrimonio(X,Z),madre(Z,Y).
abuela(X,Y):-madre(X,Z),madre(Z,Y);madre(X,Z),padre(Z,Y).
abuelo(X,Y):-matrimonio(X,Z),abuela(Z,Y).
abuelos(X,Y):-abuela(X,Y);abuelo(X,Y).


hijos(X,Y):-madre(Y,X);padre(Y,X).
hijo(X,Y):-hijos(X,Y),hombre(X).
hija(X,Y):-hijos(X,Y),mujer(X).
sinhijos(X,Y):-matrimonio(X,Y),not(madre(Y,_)). 
soltero(X):-hombre(X),not(matrimonio(X,_)).
soltera(X):-mujer(X),not(matrimonio(_,X)).
hermanos(X,Y):-madre(Z,X),madre(Z,Y), X\=Y.
hermano(X,Y):-hermanos(X,Y),hombre(X).
hermana(X,Y):-hermanos(X,Y),mujer(X).
primos(X,Y):-abuela(Z,X),abuela(Z,Y),not(hermanos(X,Y)), X\=Y.
primo(X,Y):-primos(X,Y),hombre(X).
prima(X,Y):-primos(X,Y),mujer(X).
tio(X,Y):-madre(Z,Y),hermano(X,Z);padre(Z,Y),hermano(X,Z).
tia(X,Y):-madre(Z,Y),hermana(X,Z);padre(Z,Y),hermana(X,Z).
tiopolitico(X,Y):-matrimonio(X,Z),tia(Z,Y).
tiapolitica(X,Y):-matrimonio(Z,X),tio(Z,Y).
cuñados(X,Y):-matrimonio(X,Z),hermanos(Y,Z);matrimonio(Z,X),hermanos(Y,Z).
cuñado(X,Y):-cuñados(X,Y),hombre(X).
cuñada(X,Y):-cuñados(X,Y),mujer(X).
sobrinos(X,Y):-hijos(X,Z),hermanos(Z,Y);hijos(X,Z),cuñados(Y,Z).
sobrino(X,Y):-sobrinos(X,Y),hombre(X).
sobrina(X,Y):-sobrinos(X,Y),mujer(X).
suegra(X,Y):-matrimonio(Y,Z),madre(X,Z);matrimonio(Z,Y),madre(X,Z).
suegro(X,Y):-suegra(Z,Y),matrimonio(X,Z).
yerno(X,Y):-(suegra(Y,X);suegro(Y,X)),hombre(X).
nuera(X,Y):-(suegra(Y,X);suegro(Y,X)),mujer(X).
nieto(X,Y):-hombre(X),abuelos(Y,X).
nieta(X,Y):-mujer(X),abuelos(Y,X).
bisabuela(X,Y):-madre(X,Z),abuelos(Z,Y).
bisabuelo(X,Y):-padre(X,Z),abuelos(Z,Y).

%tarea

desc(X,Y):-madre(Y,X);padre(Y,X).
desc(X,Y):-madre(Z,X),desc(Z,Y);
           padre(Z,X),desc(Z,Y).
		   
asc(X,Y):-madre(X,Y);padre(X,Y).
asc(X,Y):-madre(X,Z),asc(Z,Y);
          padre(X,Z),asc(Z,Y).

		   

