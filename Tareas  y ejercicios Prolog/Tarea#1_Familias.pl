 %                       |TAREA #1. EL PROBLEMA DE LAS FAMILIAS. | 
 %                       |_______________________________________|
 
 % ---------------------------------------------+
 %       TODO LO SIGUIENTE SON HECHOS           |
 % ---------------------------------------------+

 hombre(cesar).
 hombre(luis).
 hombre(jorge).
 hombre(jose).
 hombre(raul).
 hombre(julio).
 hombre(jaime).
 hombre(pedro).
 hombre(pepe).

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
 matr(pedro,ely).

 madre(maria,ely).
 madre(maria,luis).
 madre(lucia,ana).
 madre(lucia,jorge).
 madre(ana,gloria).
 madre(ana,raul).
 madre(carla,jaime).
 madre(gloria,julia).
 madre(ely,pepe).

 % ----------------------------------------------------------+
 %       TODO LO SIGUIENTE SON REGLAS DE INFERENCIA  	     |	
 % ----------------------------------------------------------+

 persona(X):-hombre(X);mujer(X).

 hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y).
 hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y).

 padre(X,Y):-madre(Z,Y),matr(X,Z).

 abuela(X,Y):-(madre(Z,Y),madre(X,Z));(padre(Z,Y),madre(X,Z)).
 abuelo(X,Y):-abuela(Z,Y),matr(X,Z).

 hermanos(X,Y):-madre(Z,X),madre(Z,Y).

 desc(X,Y):-madre(Y,X);padre(Y,X).
 desc(X,Y):-madre(Z,X),desc(Z,Y);padre(Z,X),desc(Z,Y).



 %--------------------------------------------------------------------------------------+
 % 			TAREA #1. EL PROBLEMA DE LAS FAMILIAS.                          |
 %                                                                                      |   
 %Sobre el Problema de las FAMILIAS, enviar al menos 15 reglas adicionales interesantes.|
 %--------------------------------------------------------------------------------------+

 hijo(X,Y):-hombre(X),madre(Y,X);padre(Y,X).
 hija(X,Y):-mujer(X),madre(Y,X);padre(Y,X).

 tio(X,Y):-hermano(X,Z),madre(Z,Y).
 tia(X,Y):-hermana(X,Z),padre(Z,Y).

 primo(X,Y):-hombre(X),tio(Z,X),padre(Z,Y);tia(Z,X),madre(Z,Y).
 prima(X,Y):-mujer(X),tio(Z,X),padre(Z,Y);tia(Z,X),madre(Z,Y).

 sobrino(X,Y):-hombre(X),tio(Y,X);tia(Y,X).
 sobrina(X,Y):-mujer(X),tio(Y,X);tia(Y,X).

 nieto(X,Y):-hombre(X),abuelo(Y,X);abuela(Y,X).
 nieta(X,Y):-mujer(X),abuelo(Y,X);abuela(Y,X).

 bisabuela(X,Y):-abuela(X,Z),madre(Z,Y);padre(Z,Y).
 bisabuelo(X,Y):-abuelo(X,Z),madre(Z,Y);padre(Z,Y).

 bisnieto(X,Y):-bisabuelo(Y,X);bisabuela(Y,X).
 bisnieta(X,Y):-bisabuelo(Y,X);bisabuela(Y,X).

 suegro(X,Y):-(hombre(Y),matr(Y,Z),padre(X,Z));(mujer(Y),matr(Z,Y),padre(X,Z)).
 suegra(X,Y):-(hombre(Y),matr(Y,Z),madre(X,Z));(mujer(Y),matr(Z,Y),madre(X,Z)).

 yerno(X,Y):-hombre(X),matr(X,Z),madre(Y,Z);padre(Y,Z).
 nuera(X,Y):-mujer(X),matr(Z,X),madre(Y,Z);padre(Y,Z).

 cuñado(X,Y):-matr(X,Z),hermanos(Z,Y);hermanos(X,Z),matr(Y,Z).
 cuñada(X,Y):-hermanos(X,Z),matr(Z,Y);matr(X,Z),hermanos(Z,Y).


 %-------------------------------  FIN TAREA #1 -------------------------------------------