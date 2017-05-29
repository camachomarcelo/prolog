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
% 	NOTAS DE ALUMNO.		   %
%					   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% a) promedio(N1, N2, N3, NF): Predicado que encuentra el promedio de las notas 	%
%    N1, N2, N3, en NF.									%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
promedio(N1, N2, N3, NF):- NF is (N1+N2+N3)/3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% b) mejorProm(N1, N2, N3, NF): Predicado que encuentra el promedio de las dos mejores 	%
%    notas de N1, N2, N3 en NF.								%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dosMejoresNotas(N1, N2, N3,N2,N3):- N1=<N2, N1=<N3,!.
dosMejoresNotas(N1, N2, N3,N1,N3):- N2=<N1, N2=<N3,!.
dosMejoresNotas(N1, N2, N3,N1,N2):- N3=<N2, N3=<N1.
mejorProm(N1, N2, N3, NF):- mejoresNotas(N1,N2,N3,A,B),NF is (A+B)/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% c) promModal(N1, N2, N3, NF): Predicado que encuentra la nota final en NF, que es 	%
%    igual a la nota que más veces se repite. Si las tres notas son diferentes NF es la %
%    nota del medio.									%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
promModal(N1, N1, N2, N1):- N1=\=N2,!.
promModal(N1, N2, N1, N1):- N1=\=N2,!.
promModal(N2, N1, N1, N1):- N1=\=N2,!.
promModal(N1, N2, N3, N2):- N1=\=N2, N2=\=N3,!.
promModal(N1, N1, N1, N1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% d) habilitado(N1, N2, N3, N4): Predicado que es true, si la cantidad de notas mayores %
%    o iguales a 60, es mayor que la cantidad de notas menores a 60.			%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
habilitado(N1, N2, N3, N4):- N1>=60, N2>=60, N3>=60, !.
habilitado(N1, N2, N3, N4):- N2>=60, N3>=60, N4>=60, !.
habilitado(N1, N2, N3, N4):- N1>=60, N3>=60, N4>=60, !.
habilitado(N1, N2, N3, N4):- N1>=60, N2>=60, N4>=60.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% e) promProx(N1, N2, N3, NF): Predicado que encuentra el promedio de nota en NF, de 	%
%    las dos notas más próximas uno del otro.						%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
promProx(N1, N2, N3, NF):- D1 is abs(N1-N2), D2 is abs(N2-N3), D1 < D2, NF is (N1+N2)/2,!.
promProx(N1, N2, N3, NF):- D1 is abs(N1-N2), D2 is abs(N2-N3), D1 >= D2, NF is (N3+N2)/2,!.
promProx(N1, N2, N3, NF):- D1 is abs(N1-N3), D2 is abs(N2-N3), D1 < D2, NF is (N1+N3)/2,!.
promProx(N1, N2, N3, NF):- D1 is abs(N1-N2), D2 is abs(N2-N3), D1 >= D2, NF is (N3+N2)/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% f) promedioMedio(N1, N2, N3, N4, NF): Predicado que encuentra la nota final en NF, 	%
%    que consiste el promedio de las notas que se encuentran entre el mayor y el menor.	%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayor(A,B,B):- B>A, !.
mayor(A,B,A).
mayor(A,B,C,My):- mayor(A,B,K),mayor(K,C,My).

menor(A,B,B):- B<A, !.
menor(A,B,A).
menor(A,B,C,Me):- menor(A,B,K), menor(K,C,Me).

promedioMedio(N1, N2, N3, NF):- mayor(N1, N2, N3, A), menor(N1, N2, N3, B), NF is (A+B)/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% g) notaFinal(N1, N2, N3, N4, NF): Predicado que encuentra en NF la nota final de las 	%
%    notas N1, N2, N3, N4. La nota final consiste el promedio de las dos mejores notas. %
%    Ejemplo: 70, 30, 90, 10. El promedio es de 70 a 90.				%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dosMejoresNotas(N1, N2, N3, N4, N1,N2):- N3=<N1, N3=<N2, N4=<N1, N4=<N2,!.
dosMejoresNotas(N1, N2, N3, N4, N1,N3):- N2=<N1, N2=<N3, N4=<N1, N4=<N3,!.
dosMejoresNotas(N1, N2, N3, N4, N1,N4):- N3=<N1, N3=<N4, N2=<N4, N2=<N4,!.
dosMejoresNotas(N1, N2, N3, N4, N2,N3):- N1=<N2, N4=<N2, N1=<N3, N4=<N3,!.
dosMejoresNotas(N1, N2, N3, N4, N2,N4):- N1=<N2, N3=<N2, N1=<N4, N3=<N4,!.
dosMejoresNotas(N1, N2, N3, N4, N4,N3):- N1=<N4, N2=<N4, N1=<N3, N2=<N3.

notaFinal(N1, N2, N3, N4, NF):- dosMejoresNotas(N1, N2, N3, N4, A, B), NF is (A+B)/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%											%
% h) notaFinal(N1, N2, N3, NF): Predicado que encuentra en NF la nota final de las 	%
%    notas N1, N2, N3. La nota final consiste en el promedio de las notas de aprobación.%
%    (Nota de aprobación >=51).Ejemplo: 60, 10, 80. El promedio es de 60 a 80.		%
%											%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aprob(X, 0 ):- X < 51,!.
aprob(X, X ).
notaFinal(N1,N2,N3,NF):-aprob(N1,A),aprob(N2,B),aprob(N3,C),NF is (A+B+C)/3.
