%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%						%
%  GRUPO # 14:					%
%						%
%	FERNANDO MENDOZA CHÁVEZ.		%
%	LIGIA BARRERA COPA.			%
%	EUSTAQUIO FERNANDEZ ABALOS.		%
%						%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%					   %
% OTROS EJERCICIOS INTERESANTES DE LOGICA. %
%					   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%													%
% Ejercicio #1:												%
%													%
%	expresion( X, Y, Z): Predicado que es true si la secuencia X, Y y Z forman aritmética válida.	%
%	Dónde los operadores X y Y pueden ser solo digitos entre cero y nueve y el operador puede ser:	%
%	*, /, +, -.											%
%													%
%	?expresion(1,+,3).										%
%	true												%
%													%
%	?expresion(X,+,Y).										%
%													%
%	X=0	X=0	X=0	X=0									%
%	Y=+	Y=+	Y=+	Y=+									%
%	Z=0	Z=1	Z=2	Z=3									%
%				y asi sucesivamente...							%
%													%
%	resultado(X, Y, Z, T): Predicado que encuentra el resultado de la espresion en T.		%
%													%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

e(0).
e(1).
e(2).
e(3).
e(4).
e(5).
e(6).
e(7).
e(8).
e(9).
o(+).
o(-).
o(*).
o(/).
o1(+,1).
o1(-,2).
o1(*,3).
o1(/,4).

expresiones(X,Y,Z):-e(X),o(Y),e(Z).                                                   

resultado(X,Y,Z,T):-o1(Y,W),W=:=1,T is X+Z;
			o1(Y,W),W=:=2,T is X-Z;
	 		o1(Y,W),W=:=3,T is X*Z;
			o1(Y,W),W=:=4,T is X/Z.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  %													%       
% Ejercicio #2:												%
%													%
%	Sea la siguiente base de hechos:								%
%													%
%	departemento(X): X es un departamento de la empresa.						%
%	personal(X): X es una persona que trabaja en la empresa.					%
%	trabaja(X, Y): La persona X trabaja en el departamento Y. 					%
%	jefe(X, Y): La personaz es jefe de la persona Y.						%
%													%
%	Hacer predicados para:										%
%													%
%	maximo(X): X es una persona que no tiene jefe.							%
%	minimo(X): X es uan persona que no es jefe de nadie.						%
%	mismoDep(X, Y): La persona X es jefe de la persona Y y trabajan en el mismo departeamento.	%
%	ordenar(X, Y): La persona X puede dar ordenes a la persona Y.					%
%													%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


departamento(contabilidad).
departamento(administracion).
departamento(gerencia).
departamento(recursosH).
departamento(produccion).
departamento(ventas).

persona(andres).
persona(patricia).
persona(arturo).
persona(anni).
persona(miguel).
persona(estela).
persona(juan).
persona(marco).
persona(sandra).
persona(pedro).
persona(antonio).
persona(willy).
persona(jose).

trabaja(andres,contabilidad).
trabaja(patricia,contabilidad).
trabaja(arturo,contabilidad).
trabaja(anni,administracion).
trabaja(miguel,administracion).
trabaja(estela,gerencia).
trabaja(juan,gerencia).
trabaja(marco,recursosH).
trabaja(sandra,recursosH).
trabaja(pedro,produccion).
trabaja(antonio,produccion).
trabaja(jose,ventas).
trabaja(willy,ventas).

jefe(andres,contabilidad).
jefe(anni,administracion).
jefe(estela,gerencia).
jefe(marco,recursosH).
jefe(pedro,produccion).
jefe(pedro,ventas).

maximo(X):-jefe(X,_).

minimo(X):-not(jefe(X,_)).

mismoDep(X,Y):-jefe(X,Z),trabaja(Y,Z).

ordenar(X,Y):-mismoDep(X,Y).