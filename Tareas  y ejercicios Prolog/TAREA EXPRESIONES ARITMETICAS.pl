% Autor: MARCELO CAMACHO MORENO

% Tarea #3. Ejercicios de Logica con Expresiones Aritmeticas

% Implementar los siguientes predicados:

%------------------------------------------------------------------------------

menor(A, B, Me) :- A < B, Me is A, !; Me is B, !.
menor(A, B, C, Me) :- menor(A, B, Me1), menor(C, Me1, Me), !.
menor(A, B, C, D, Me) :- menor(A, B, C, Me1), menor(D, Me1, Me), !.
menor(A, B, C, D, E, Me) :- menor(A, B, C, D, Me1), menor(E, Me1, Me).

%------------------------------------------------------------------------------

mayor(A, B, Ma) :- A > B, Ma is A, !; Ma is B, !.
mayor(A, B, C, Ma) :- mayor(A, B, Ma1), mayor(C, Ma1, Ma), !.
mayor(A, B, C, D, Ma) :- mayor(A, B, C, Ma1), mayor(D, Ma1, Ma), !.
mayor(A, B, C, D, E, Ma) :- mayor(A, B, C, D, Ma1), mayor(E, Ma1, Ma).

%------------------------------------------------------------------------------

segMenor(A, B, C, Me) :- menor(A, B, C, Me1), iguales(A, Me1), menor(B, C, Me), !;
                         menor(A, B, C, Me1), iguales(B, Me1), menor(A, C, Me), !;
                         menor(A, B, C, Me1), iguales(C, Me1), menor(A, B, Me).
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, Me1), iguales(A, Me1), menor(B, C, D, Me), !;
                            menor(A, B, C, D, Me1), iguales(B, Me1), menor(A, C, D, Me), !;
                            menor(A, B, C, D, Me1), iguales(C, Me1), menor(A, B, D, Me), !;
                            menor(A, B, C, D, Me1), iguales(D, Me1), menor(A, B, C, Me).
segMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, Me1), iguales(A, Me1), menor(B, C, D, E, Me);
                               menor(A, B, C, D, E, Me1), iguales(B, Me1), menor(A, C, D, E, Me);
                               menor(A, B, C, D, E, Me1), iguales(C, Me1), menor(A, B, D, E, Me);
                               menor(A, B, C, D, E, Me1), iguales(D, Me1), menor(A, B, C, E, Me);
                               menor(A, B, C, D, E, Me1), iguales(E, Me1), menor(A, B, C, D, Me).

%------------------------------------------------------------------------------						   

segundoMayor(A,B,My):-menor(A,B,My).
segundoMayor(A,B,C,My):-segundoMayor(A,B,M1),segundoMayor(B,C,M2),
			 segundoMayor(A,C,M3),mayor(M1,M2,M3,My).

segundoMayor(A,B,C,D,My):-segundoMayor(A,B,C,M1),segundoMayor(B,C,D,M2),
			  segundoMayor(A,B,D,M3),mayor(M1,M2,M3,My).

segundoMayor(A,B,C,D,E,My):-segundoMayor(A,B,C,D,M1),segundoMayor(B,C,D,E,M2),
			    segundoMayor(A,B,C,E,M3),mayor(M1,M2,M3,My).

%------------------------------------------------------------------------------

tercerMenor(A,B,C,Me):- menor(A,B,C,M1),A=:=M1,segMenor(B,C,Me);
                     menor(A,B,C,M1),B=:=M1,segMenor(A,C,Me);
                     segMenor(A,B,Me).

tercerMenor(A,B,C,D,Me):- menor(A,B,C,D,M1),A=:=M1,segMenor(B,C,D,Me);
                       menor(A,B,C,D,M1),B=:=M1,segMenor(A,C,D,Me);
					   menor(A,B,C,D,M1),C=:=M1,segMenor(A,B,D,Me);
					   segMenor(A,B,C,Me).

tercerMenor(A,B,C,D,E,Me):- menor(A,B,C,D,E,M1),A=:=M1,segMenor(B,C,D,E,Me);
                         menor(A,B,C,D,E,M1),B=:=M1,segMenor(A,C,D,E,Me);
					     menor(A,B,C,D,E,M1),C=:=M1,segMenor(A,B,D,E,Me);
						 menor(A,B,C,D,E,M1),D=:=M1,segMenor(A,B,C,E,Me);
					     segMenor(A,B,C,D,Me).

%----------------------------------------------------------------------------

tercerMayor(A,B,C,My):- mayor(A,B,C,M1),A=:=M1,segMayor(B,C,My);
                     mayor(A,B,C,M1),B=:=M1,segMayor(A,C,My);
                     segMayor(A,B,My).

tercerMayor(A,B,C,D,My):- mayor(A,B,C,D,M1),A=:=M1,segMayor(B,C,D,My);
                       mayor(A,B,C,D,M1),B=:=M1,segMayor(A,C,D,My);
					   mayor(A,B,C,D,M1),C=:=M1,segMayor(A,B,D,My);
                       segMayor(A,B,C,My).

tercerMayor(A,B,C,D,E,My):- mayor(A,B,C,D,E,M1),A=:=M1,segMayor(B,C,D,E,My);
                         mayor(A,B,C,D,E,M1),B=:=M1,segMayor(A,C,D,E,My);
					     mayor(A,B,C,D,E,M1),C=:=M1,segMayor(A,B,D,E,My);
						 mayor(A,B,C,D,E,M1),D=:=M1,segMayor(A,B,C,E,My);
                         segMayor(A,B,C,D,My).

%----------------------------------------------------------------------------
 
% Predicado que encuentra en Me, la menor diferencia de entre parejas de argumentos.


dif(A,B,R):-R is A-B.

 menorDiferencia(A,B,Me):-dif(A,B,M1),dif(B,A,M2),menor(M1,M2,Me).

 menorDiferencia(A,B,C,Me):-menorDiferencia(A,B,M1),menorDiferencia(A,C,M2),
			    menorDiferencia(B,C,M3),menor(M1,M2,M3,Me).

 menorDiferencia(A,B,C,D,Me):-menorDiferencia(A,B,C,M1),menorDiferencia(A,B,D,M2),
			      menorDiferencia(A,C,D,M3),menor(M1,M2,M3,Me).

 menorDiferencia(A,B,C,D,E,Me):-menorDiferencia(A,B,C,D,M1),menorDiferencia(A,B,C,E,M2),
				menorDiferencia(A,C,D,E,M3),menor(M1,M2,M3,Me).

%----------------------------------------------------------------------------

% Predicado que encuentra en My, la menor diferencia de entre parejas de argumentos.

mayorDif(A, B, My):- A>B, My is A-B,!.
mayorDif(A, B, My):- My is B-A.

mayorDif(A, B, C, My):- mayor(A,B,C,D1), menor(A,B,C,D2), mayorDif(D1, D2, My).

mayorDif(A, B, C, D, My):- mayor(A, B, C, D, D1), menor(A, B, C, D, D2), mayorDif(D1, D2, My).

mayorDif(A, B, C, D, E, My):-  mayor(A, B, C, D, E, D1), menor(A, B, C, D, E, D2), mayorDif(D1, D2, My).

%---------------------------------------------------------------------------- 

% IGUALES : Predicado que es True, si todos los argumentos son iguales.

iguales(A, B) :- A =:= B, !.
iguales(A, B, C) :- A =:= B, A =:= C,
                    B =:= C, !.
iguales(A, B, C, D) :- A =:= B, A =:= C, A =:= D,
                       B =:= C, B =:= D,
                       C =:= D, !.
iguales(A, B, C, D, E) :- A =:= B, A =:= C, A =:= D, A =:= E,
                          B =:= C, B =:= D, B =:= E,
                          C =:= D, C =:= E,
                          D =:= E.

%----------------------------------------------------------------------------

% DIFERENTES : Predicado que es True, si todos los argumentos son diferentes.

diferentes(A, B) :- A =\= B, !.
diferentes(A, B, C) :- A =\= B, A =\= C,
                       B =\= C, !.
diferentes(A, B, C, D) :- A =\= B, A =\= C, A =\= D,
                          B =\= C, B =\= D,
                          C =\= D, !.
diferentes(A, B, C, D, E) :- A =\= B, A =\= C, A =\= D, A =\= E,
                             B =\= C, B =\= D, B =\= E,
                             C =\= D, C =\= E,
                             D =\= E.

%----------------------------------------------------------------------------

% DOS IGUALES : Predicado que es True, si solo 2 argumentos son iguales.

dosIguales(A, B) :- A =:= B, !.
dosIguales(A, B, C) :- dosIguales(A, B), !; dosIguales(A, C), !; dosIguales(B, C), !.
dosIguales(A, B, C, D) :- dosIguales(A, B, C), !; dosIguales(A, B, D), !; dosIguales(A, C, D), !;
                          dosIguales(B, C, D), !.
dosIguales(A, B, C, D, E) :- dosIguales(A, B, C, D); dosIguales(A, B, C, E); dosIguales(A, B, D, E);
                             dosIguales(A, C, D, E); dosIguales(B, C, D, E).

%----------------------------------------------------------------------------

% TRES IGUALES : Predicado que es True, si solo 3 argumentos son iguales.

tresIguales(A, B, C) :- A =:= B, A =:= C, B =:= C, !.
tresIguales(A, B, C, D) :- tresIguales(A, B, C), !; tresIguales(A, B, D), !; tresIguales(A, C, D), !;
                           tresIguales(B, C, D), !.
tresIguales(A, B, C, D, E) :- tresIguales(A, B, C, D); tresIguales(A, B, C, E); tresIguales(A, B, D, E);
                              tresIguales(A, C, D, E); tresIguales(B, C, D, E).

%----------------------------------------------------------------------------

% PAR

par(N) :- N mod 2 =:= 0.

% IMPAR

impar(N) :- not(par(N)).

%----------------------------------------------------------------------------

% Predicado que es True, si solo 2 argumentos son pares.

dosPares(A, B) :- par(A), par(B), !.
dosPares(A, B, C) :- dosPares(A, B), !; dosPares(A, C), !; dosPares(B, C), !.
dosPares(A, B, C, D) :- dosPares(A, B, C), !; dosPares(A, B, D), !; dosPares(A, C, D), !;
                        dosPares(B, C, D), !.
dosPares(A, B, C, D, E) :- dosPares(A, B, C, D); dosPares(A, B, C, E); dosPares(A, B, D, E);
                           dosPares(A, C, D, E); dosPares(B, C, D, E).
 
%----------------------------------------------------------------------------

% Predicado que es True, si solo 3 argumentos son pares.

 trespares(A,B,C):-dospares(A,B),par(C).

 trespares(A,B,C,D):-trespares(A,B,C),impar(D);trespares(A,B,D),impar(C);
		     trespares(A,C,D),impar(B);trespares(B,C,D),impar(A).

 trespares(A,B,C,D,E):-trespares(A,B,C,D),impar(E);trespares(A,B,C,E),impar(D);
		       trespares(A,B,D,E),impar(C);trespares(A,C,D,E),impar(B);
		       trespares(B,C,D,E),impar(A).

%-------------------------------------------------------------------------------

% Predicado que es True, si todos los argumentos son pares.

todosPares(A, B):- dosPares(A,B).
todosPares(A, B, C):- dosPares(A, B), par(C).
todosPares(A, B, C, D):- dosPares(A, B), dosPares(C, D).
todosPares(A, B, C, D, E):- todosPares(A, B, C, D), par(E).

%-------------------------------------------------------------------------------

% Predicado que es True, si entre todos los argumentos existe al menos un par y al menos un impar.

parImpar(A, B) :- par(A), impar(B), !.
parImpar(A, B, C) :- parImpar(A, B), !; parImpar(A, C), !; parImpar(B, C), !.
parImpar(A, B, C, D) :- parImpar(A, B, C), !; parImpar(A, B, D), !; parImpar(A, C, D), !;
                        parImpar(B, C, D), !.
parImpar(A, B, C, D, E) :- parImpar(A, B, C, D); parImpar(A, B, C, E); parImpar(A, B, D, E);
                           parImpar(A, C, D, E); parImpar(B, C, D, E).

%-------------------------------------------------------------------------------

% SUMANDOS : Predicado que es True, si 1 argumento es igual a la suma de los otros argumentos.

sumandos(A, B) :- A =:= B, !.
sumandos(A, B, C) :- A =:= (B + C), !; B =:= (A + C), !; C =:= (A + B), !.
sumandos(A, B, C, D) :- A =:= (B + C + D), !; B =:= (A + C + D), !; C =:= (A + B + D), !;
                        D =:= (A + B + C), !.
sumandos(A, B, C, D, E) :- A =:= (B + C + D + E); B =:= (A + C + D + E); C =:= (A + B + D + E);
                           D =:= (A + B + C + E); E =:= (A + B + C + D).
%-------------------------------------------------------------------------------

% DIVISION ENTERA : Predicado que es True, si existe un argumento igual a la división entera de otros dos argumentos.

divEntera(A, B, C) :- A =:= (B // C), !; A =:= (C // B), !; B =:= (A // C), !;
                      B =:= (C // A), !; C =:= (A // B), !; C =:= (B // A), !.
divEntera(A, B, C, D) :- divEntera(A, B, C), !; divEntera(A, B, D), !; divEntera(A, C, D), !;
                         divEntera(B, C, D); !.
divEntera(A, B, C, D, E) :- divEntera(A, B, C, D); divEntera(A, B, C, E); divEntera(A, B, D, E);
                            divEntera(A, C, D, E); divEntera(B, C, D, E).
%-------------------------------------------------------------------------------

% DIVISION RESIDUO : Predicado que es True, si existe un argumento igual al residuo de la división entera de otros dos argumentos.

residuo(A, B, C) :- A =:= (B mod C), !; A =:= (C mod B), !; B =:= (A mod C), !;
                    B =:= (C mod A), !; C =:= (A mod B), !; C =:= (B mod A), !.
residuo(A, B, C, D) :- residuo(A, B, C), !; residuo(A, B, D), !; residuo(A, C, D), !;
                       residuo(B, C, D), !.
residuo(A, B, C, D, E) :- residuo(A, B, C, D); residuo(A, B, C, E); residuo(A, B, D, E);
                          residuo(A, C, D, E); residuo(B, C, D, E).

%-------------------------------------------------------------------------------

