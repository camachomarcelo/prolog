hombre(jose).
hombre(jaime).
hombre(cesar).
hombre(carlos).

mujer(maria).
mujer(ines).
mujer(ely).
mujer(carla).
mujer(ana).

matr(jose,maria).
matr(jaime,ely).
matr(cesar,carla).
matr(josue,ines).
matr(juan,ana).
matr(jellal,wendy).
matr(gray,lucy).
matr(natsu,lisana).

madre(maria,ines).
madre(maria,jaime).
madre(ely,carla).
madre(ely,carlos).
madre(ely,lion).
madre(carla,ana).
madre(ines,wendy).
madre(ines,loky).
madre(ana,levy).
madre(wendy,natsu).
madre(wendy,lucy).
madre(lucy,juvia).

padre(X,Y):-madre(Z,Y), matr(X,Z).

abuela(X,Y):-madre(Z,Y), madre(X,Z); padre(Z,Y), madre(X,Z).

abuelo(X,Y):-abuela(Z,Y), matr(X,Z).

hermanos(X,Y):-madre(Z,X),madre(Z,Y).

persona(X):-hombre(X); mujer(X).



primos(X,Y):-padre(Z,Y), padre(W,Y), hermanos(Z,W); madre(Z,X), madre(W,Y), hermanos(Z,W); padre(Z,X), madre(W,Y), hermanos(Z,W); madre(Z,X), padre(W,Y), hermanos(Z,W).

hijo(X,Y):-madre(X,Y); padre(X,Y).

hija(X,Y):-madre(X,Y); padre(X,Y).

tatarabuela(X,Y):- bisabuela(Z,Y), madre(X,Z).

tatarabuelo(X,Y):- tatarabuela(Z,Y), matr(X,Z).

cuñado(X,Y):- hermanos(Z,X), matr(Y,Z).

cuñada(X,Y):- hermanos(Z,X), matr(Z,Y).

yerno(X,Y):- matr(Y,Z), hija(X,Z).

yerna(X,Y):- matr(Z,Y), hijo(X,Z).

tiaabuela(X,Y):- abuela(Z,Y), hermanos(W,X), matr(W,Z).

tioabuelo(X,Y):- hermanos(X,Z), abuela(Z,Y).

primosHerm(X,Y):- padre(Z,X), padre(W,Y), hermanos(Z,W); madre(Z,X), madre(W,Y), hermanos(Z,W); padre(Z,X), madre(W,Y), hermanos(Z,W); madre(Z,X), padre(W,Y), hermanos(Z,W).

soltera(X):- mujer(X), not(matr(_,X)).

sinHijos(X,Y):- matr(X,Y), not(madre(Y,_)).

desc(X,Y):- madre(Y,X); padre(Y,X).

desc(X,Y):- madre(Z,X), desc(Z,Y); padre(Z,X), desc(Z,Y).

parientes(X,Y):- madre(Z,X), madre(Z,Y); padre(Z,X), padre(Z, Y); primos(X,Y); abuela(Z,X), abuela(Z,Y); abuelo(Z,X), abuelo(Z,Y); tio(X,Y); tio(Y,X).

tioSegundo(X,Y):- madre(Z,Y), (primos(X,Z); primos(X,Z)).

tioTercero(X,Y):- abuela(Z,Y), primos(X,Z).

nieto(X,Y):- abuelo(X,Y); abuela(X,Y).

primoSegundo(X,Y):- padre(Z,X), padre(W,Y), primos(Z,W); madre(Z,X), madre(W,Y), primos(Z,W); padre(Z,X), madre(W,Y), primos(Z,W); madre(Z,X), padre(W,Y), primos(Z,W).

sobrino(X,Y):- tio(X,Y); tia(X,Y).

sobrinoSegundo(X,Y):- padre(X,Y), primos(Z,X); madre(W,Y), primos(W,X).

nuera(X,Y):- madre(X,Z), matr(Z,Y).

hermano(X,Y):- hombre(X),madre(Z,X),madre(Z,Y).

hermana(X,Y):- mujer(X),madre(Z,X),madre(Z,Y).

hijounico(X):- not hermanos(X,_)

matrhijounico(X,Y):- hijounico(X),hijounico(Y),matr(X,Y).

tia(X,Y):-madre(Z,Y),hermana(X,Z);padre(W,X),hermana(X,W).

tio(X,Y):-madre(Z,Y),hermano(X,Z);padre(W,X),hermano(X,W).

sobrino(X,Y):- hombre(X),tia(Y,x);tio(Y,X).

sobrina(X,Y):- mujer(X),tia(Y,x);tio(Y,X).

yerno(X,Y):- matr(X,Z),padre(Y,Z);madre(Y,Z).
 		  
nuera(X,Y):- matr(Z,X),padre(Y,Z);madre(Y,Z).

suegro(X,Y):-yerno(Y,X);yerna(Y,X),hombre(X).

suegra(X,Y):-yerno(Y,X);yerna(Y,X),mujer(X).

primo(X,Y):- hombre(X),

prima(X,Y):- mujer(X),

abuela(X,Y):-madre(Z,Y), madre(X,Z); padre(Z,Y), madre(X,Z).

abuelo(X,Y):-abuela(Z,Y), matr(X,Z).
		
bisabuela(X,Y):-abuela(Z,Y), madre(X,Z);abuelo(W,Y),madre(X,W).

bisabuelo(X,Y):-abuelo(Z,Y); padre(W,X).

bisnieto(X,Y):- bisabuelo(Y,X);bisabuela(Y,X),hombre(X).