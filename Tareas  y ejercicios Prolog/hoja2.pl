%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 1:
% Consideremos el siguiente programa con información de parejas inscritas
% en el registro

libro_de_familia(
	esposo(nombre(antonio,garcia,fernandez),
	       profesion(arquitecto),
			 salario(300000)),
	esposa(nombre(ana,ruiz,lopez),
	       profesion(docente),
			 salario(120000)),
	domicilio(sevilla)).

libro_de_familia(
	esposo(nombre(luis,alvarez,garcia),
	       profesion(arquitecto),
			 salario(400000)),
	esposa(nombre(ana,romero,soler),
	       profesion(sus_labores),
			 salario(0)),
	domicilio(sevilla)).

libro_de_familia(
	esposo(nombre(bernardo,bueno,martinez),
	       profesion(docente),
			 salario(120000)),
	esposa(nombre(laura,rodriguez,millan),
	       profesion(medico),
			 salario(250000)),
	domicilio(cuenca)).


libro_de_familia(
	esposo(nombre(miguel,gonzalez,ruiz),
	       profesion(empresario),
			 salario(400000)),
	esposa(nombre(belen,salguero,cuevas),
	       profesion(sus_labores),
			 salario(0)),
	domicilio(dos_hermanas)).

%  (1) Definir el predicado profesion(X) que se verifique si X es una
%      profesión que aparece en el programa 
%  (2) Definir el predicado primer_apellido(X) que se verifique si X es el
%      primer apellido de alguien 
%  (3) Determinar el nombre completo de todas las personas que viven en Sevilla
%  (4) Definir el predicado ingresos_familiares(N), de forma que si N es
%      una cantidad que determina los ingresos totales de una familia.
%  (5) Definir el predicado pareja(Hombre,Mujer) que devuelva los nombres
%      de pila de las parejas existentes.
%  (6) Definir el predicado sueldo(X,Y) que se verifique si el sueldo de
%      la persona de nobre completo X es Y.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

profesion(X):-
	libro_de_familia(esposo(_,profesion(X),_),_,_).
profesion(X):-
	libro_de_familia(_,esposa(_, profesion(X),_),_).
primer_apellido(X):-
	libro_de_familia(esposo(nombre(_,X,_),_,_),_,_).
primer_apellido(X):-
	libro_de_familia(_,esposa(nombre(_,X,_),_,_),_).
sevillano(X):-
	libro_de_familia(esposo(X,_,_),_,domicilio(sevilla)).
sevillano(X):-
	libro_de_familia(_,esposa(X,_,_),domicilio(sevilla)).
ingresos_familiares(X):-
	libro_de_familia(esposo(_,_,salario(N1)),esposa(_,_,salario(N2)),_),
	X is N1+N2.
pareja(X, Y):-
	libro_de_familia(esposo(nombre(X,_,_),_,_),esposa(nombre(Y,_,_),_,_),_).
sueldo(X, Y):-
	libro_de_familia(esposo(X,_,salario(Y)),_,_).
sueldo(X, Y):-
	libro_de_familia(_,esposa(X,_,salario(Y)),_).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 2:
% En este ejercicio vamos a caracterizar los movimientos de las piezas del
% ajedrez. Se pide definir el predicado 
%          movimiento(Pieza,Casilla_origen,Casilla_llegada)
% donde las piezas son torre, caballo, alfil, rey, dama y peón y las
% casillas las denominamos por el término e(X,Y) con X e Y entre 1 y 8.
% (Consideraremos siempre que la casilla de origen es una casilla legal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

movimiento(X,Y,Z):-
	pieza1(X),
	correcto(Y),
	movimiento_torre(Y,Z),
	correcto(Z).
movimiento(X,Y,Z):-
	pieza2(X),
	correcto(Y),
	movimiento_caballo(Y,Z),
	correcto(Z).
movimiento(X,Y,Z):-
	pieza3(X),
	correcto(Y),
	movimiento_alfil(Y,Z),
	correcto(Z).
movimiento(X,Y,Z):-
	pieza4(X),
	correcto(Y),
	movimiento_rey(Y,Z),
	correcto(Z).
movimiento(X,Y,Z):-
	pieza5(X),
	correcto(Y),
	movimiento_dama(Y,Z),
	correcto(Z).
movimiento(X,Y,Z):-
	pieza6(X),
	correcto(Y),
	movimiento_peon(Y,Z),
	correcto(Z).
pieza1(torre).
pieza2(caballo).
pieza3(alfil).
pieza4(rey).
pieza5(dama).
pieza6(peon).
correcto((X,Y)):-
	between(1,8,X),
	between(1,8,Y).
ok(X,_):-
	X =\= 0.
ok(_,X):-
	X =\= 0.
movimiento_torre((X1,Y1),(X2,Y2)):-
	between(-7,7,Z),
	ok(Z,0),
	X2 is X1+Z,
	Y2 is Y1.
movimiento_torre((X1,Y1),(X2,Y2)):-
	between(-7,7,Z),
	ok(0,Z),
	X2 is X1,
	Y2 is Y1+Z.
movimiento_caballo((X1,Y1),(X2,Y2)):-
	X2 is X1+1,Y2 is Y1+2;
	X2 is X1+1,Y2 is Y1-2;
	X2 is X1-1,Y2 is Y1+2;
	X2 is X1-1,Y2 is Y1-2;
	X2 is X1+2,Y2 is Y1+1;
	X2 is X1+2,Y2 is Y1-1;
	X2 is X1-2,Y2 is Y1+1;
	X2 is X1-2,Y2 is Y1-1.
movimiento_alfil((X1,Y1),(X2,Y2)):-
	between(-7,7,Z),
	ok(Z,0),
	X2 is X1+Z,
	Y2 is Y1+Z.
movimiento_rey((X1,Y1),(X2,Y2)):-
	between(-1,1,Z),
	between(-1,1,T),
	ok(Z,T),
	X2 is X1+Z,
	Y2 is Y1+T.
movimiento_dama(X,Y):-
	movimiento_torre(X,Y).
movimiento_dama(X,Y):-
	movimiento_alfil(X,Y).	
movimiento_peon((X1,Y1),(X2,Y2)):-
	X2 is X1,
	Y2 is Y1+1.
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 3: [Ex. Feb 2001]
% Usaremos la siguiente notación para representar los números enteros
%   (a) 0 es un número entero
%   (b) Si X es un número entero entonces s(X) es un número entero. 
%       (s(X) representará el sucesor de X).
%   (c) Si X es un número entero entonces p(X) es un número entero. 
%       (s(X) representará el predecesor de X).
% De esta manera s(s(0)) representará al 2 y p(p(p(0))) representará al -3.
% Pero p(s(s(p(0)))) también represeanta al 0 y s(s(p(s(0)))) también
% representa al 2. Diremos que una representación es minimal si en ella no
% ocurren los símbolos "p" y "s" simultáneamente.
% Definir el predicado 
%                     simplifica(Rep,Rep_minimal)
% que tome como dato de entrada un número entero con la representación Rep
% y devuelva el mismo número entero con su representación minimal.
%    Ejemplo:
%
%   ?- simplifica(s(s(p(s(s(s(p(0))))))),M).
%      M = s(s(s(0))) ;
%      No
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

entero(0).
entero(s(X)):-
	entero(X).
entero(p(X)):-
	entero(X).
simplifica(X,Y):-
	numero_sp(X,S,P),
	S > P,
	TS is S-P,
	simplifica_a_s(Y,TS).
simplifica(X,Y):-
	numero_sp(X,S,P),
	S < P,
	TP is P-S,
	simplifica_a_p(Y,TP).
simplifica(X,Y):-
	numero_sp(X,S,P),
	S =:= P,
	Y is 0.
numero_sp(0,0,0).
numero_sp(s(X),S,P):-
	numero_sp(X,S1,P),
	S is S1+1.
numero_sp(p(X),S,P):-
	numero_sp(X,S,P1),
	P is P1+1.
simplifica_a_s(0,0).
simplifica_a_s(X,S):-
	S > 0,
	S1 is S-1,
	simplifica_a_s(Y,S1),
	X=s(Y).
simplifica_a_p(0,0).
simplifica_a_p(X,P):-
	P > 0,
	P1 is P-1,
	simplifica_a_p(Y,P1),
	X=p(Y).
	








