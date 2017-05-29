
					
%*********************** CONCATENAR **********************************
concatenar([],L2,L2).

concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

menor(L,Me):- concatenar(_,[X|_],L2), 
				concatenar(L2,[Me|_],L3),
				 concatenar(L3,[Y|_],L), 
					not(X<Me),
						not(Y<Me).
						
menor(L,Me):- concatenar([Me|_],[Y|_],L),
				 	not(Y<Me).

diferentes([X]).

diferentes([X|L]):- not(concatenar(_,[X|L2],L)), diferentes(L).

insertarUlt(L,X,L2):- concatenar(L,[X],L2).

eliminarUlt(L,L2):- concatenar(L2,[_],L).

seEncuentra(L,X):- concatenar(_,[X|_],L).

porLoMenosDosIguales(L):- concatenar(_,[X|_],L2), concatenar(L2,[X|_],L).

%ayor(L,My):- ((concatenar(_,[X|_],L), concatenar(_,[My|_],L));
%				(concatenar(_,[My|_],L), concatenar(_,[X|_],L))), 
%					My > X, !.
					
mayor(L,My):- concatenar(_,[X|_],L), concatenar(_,[My|_],L), 
					My > X, !.
					
% enor(L,Me):- (concatenar(_,[X|_],L2), concatenar(L2,[Me|_],L),not(X < Me),!);
% 				(concatenar(_,[Me|_],L3), concatenar(L3,[X|_],L),not(X < Me),!).


					
porLoMenosUnPar(L):- concatenar(_,[X|_],L), 
					X mod 2 =:= 0, !.
					
concatenar2(L1,L2,L3,L4):- concatenar(L1,L2,L5), concatenar(L5,L3,L4).

primo(X):- primo(X,2).

primo(X,I):- I > X//2,!.

primo(X,I):- X mod I =\= 0,
					I2 is I+1,
					primo(X,I2),!.

existePrimo(L):- concatenar(_,[X|_],L),
					primo(X).
					
tresIguales(L):- concatenar(_,[X|_],L2),
					concatenar(L2,[X|_],L3),
						concatenar(L3,[X|_],L).
						
existeParImpar(L):- concatenar(_,[X|_],L),
						concatenar(_,[Y|_],L),
						X mod 2=:=0,Y mod 2 =:= 1.
						
subListaPrinOFinal(L,L1):- (concatenar(_,L,L1),!);
							concatenar(L,_,L1).