%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						%
%  GRUPO # 17:					%
%	Garcia Rodriguez alejandro              %
%	Cruz Serrudo Wilma	                %
%	Lopez Terrazas Vehimar	                %
%			                        %
%						%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%					   			%
% LOGICA SOBRE LAS PERSONAS SIMPATICA Y BEBEDORES.  		%
%					   			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Sea el siguiente conjunto de Hechos:				%
%									%
%	hombre(X)	  : Persona hombre.				%
%	mujer(X)	  : Persona mujer.				%
%	matri(X,Y)	  : El hombre X esta casado con la mujer Y.	%
%	hombreSimp(X, Y)  : El hombre X le cae simpatico a la muer Y.	%
%	mujerSimp(X, Y)   : La mujer Y le cae simpatico al hombre X.	%
%									%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hombre(jorge).
hombre(ruben).
hombre(pedro).
hombre(roberto).
hombre(luis).
hombre(tito).
hombre(carlos).
hombre(estevan).
hombre(miguel).
hombre(sebastian).
hombre(marcos).
hombre(ruben).
hombre(ronald).
hombre(jose).

mujer(ana).
mujer(sandra).
mujer(jimena).
mujer(maria).
mujer(eli).
mujer(juana).
mujer(jeni).
mujer(susi).
mujer(marta).
mujer(julia).
mujer(estela).
mujer(angelica).
mujer(ester).


matri(miguel,marta).
matri(jorge,ana).
matri(luis,juana).
matri(ruben,sandra).
matri(tito,jimena).
matri(roberto,maria).
matri(carlos,jeni).
matri(sebastian,julia).
matri(estevan,angelica).
matri(marcos,ester).

hombreSimp(miguel,marta).
hombreSimp(jorge,ana).
mujerSimp(miguel,marta).
mujerSimp(jorge,ana).

hombreSimp(luis,ana).
hombreSimp(sebastian,sandra).
hombreSimp(pedro,marta).
hombreSimp(pedro,eli).
mujerSimp(luis,ana).
mujerSimp(sebastian,sandra).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definir reglas para las siguientes consultas:		%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encontrar las parejas de matrimonios que se caen simpatico mutuamente.	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pareSimpMutu(X,Y):-matri(X,Y),hombreSimp(X,Y),mujerSimp(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrar hombres que caen simpatico solo a mujeres casadas.			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
simpCasadas(X):-matri(_,Z),hombreSimp(X,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrar hombres y mujeres que caen simpatico mutuamente y que no sean casados%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
simpNoCasados(X,Y):-not( pareSimpMutu(X,Y) ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definir otras reglas y/o consultas culesquieras.				%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noSimp(X,Y):-not(hombreSimp(X,Y)),not(mujerSimp(X,Y)).

simp2M(X,Y,Z):-hombreSimp(X,Y),hombreSimp(X,Z).

simp3(X,Y,Z):matri(X,Y),preSimpMutu(X,Y),hombreSimp(X,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Sea el siguiente conjunto de hechos:				%
%	hombre(X)   : X es persona hombre.				%
%	mujer (X)   : Y es persona mujer.				%
%	cerveza(X)  : X es una cerveza.					%
%	bar(X)	    : X es un bar.					%
%	bebedor(X)  : X es una persona hombre o mujer bebedor.		%
%	gusta(X,Y)  : La persona X le gusta la cerveza Y.		%
%	sirve(X,Y)  : El bar X sirve la cerveza Y.			%
%	frec(X,Y)   : El bebedor X frecuenta al bar Y.			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cerveza(paceña).
cerveza(ducal).
bar(lito).
bar(aruba).
bebedor(marcos).
bebedor(estevan).
gusta(marcos,paceña).
gusta(estevan,ducal).
sirve(lito,ducal).
sirve(aruba,paceña).
frec(marcos,lito).
frec(estevan,aruba).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definir reglas para las siguientes consultas:		%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Personas hombres que no frecuentan ningun a ningun bar.	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nobar(X):-hombre(X),not(frec(_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Personas hombres o mujeres que no gustan de ninguna cerveza.	%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nocerv(X):-not(gusta(X,_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bebedores que frecuentan a un bar donde sirven una cerveza que a ellos les gusta. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
befrecbar(X):-bebedor(X),frec(X,W),gusta(Z,X),sirve(W,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cerveza que no sirve un bar.				%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nosirvebar(X):-not(sirve(_,X)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bares donde no frecuenta un bebedor.			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nofrecbar(X):-not(frec(X,_)).


