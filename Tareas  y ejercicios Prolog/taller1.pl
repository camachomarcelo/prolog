hombre(jose).

hombre(jorge).

hombre(jaime).

hombre(pepe).

hombre(raul).

hombre(cesar).

hombre(luis).

hombre(marco).

hombre(kanito).



mujer(ana).

mujer(lucia).

mujer(ely).

mujer(gloria).

mujer(carla).

mujer(elodia).

mujer(lorena).



matri(jose,ana).

matri(jorge,lucia).

matri(jaime,ely).

matri(pepe,gloria).




hombresimp(jose,ana).

hombresimp(jorge,lucia).

hombresimp(jaime,ely).


hombresimp(raul,lorena).

hombresimp(cesar,carla).

hombresimp(luis,elodia).

hombresimp(marco,lucia).

hombresimp(kanito,gloria).



mujersimp(ana,jose).

mujersimp(lucia,jorge).

mujersimp(ely,jaime).



mujersimp(gloria,kanito).

mujersimp(lucia,marco).


mujersimp(elodia,marco).






%consultas%



matrimutuamentesimp(X,Y):-hombresimp(X,Y),mujersimp(Y,X),matri(X,Y).



%Consulta 2%
%


hombresimpcasada(X,Y):-hombresimp(X,Y),matri(_,Y).
hombresimpcasada1(X,Y):-hombresimp(X,Y),matri(_,Y),soltero(X).



%consulta3%

msnocasado(X,Y):-hombresimp(X,Y),mujersimp(Y,X),not(matri(X,Y)).



%consulta 4%


soltero(X):-hombre(X),not(matri(X,_)).

soltera(X):-mujer(X),not(matri(_,X)).












