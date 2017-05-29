%		       	_____________________		
%		       	| CICLOS ITERATIVOS |
%                      	|___________________|



%  +-------------------------+    
%  | PROBLEMA DE PITAGORAS   | 
%  +-------------------------+


% 	    +------------------------------+
%-----------| 1º Solucion : "Ineficiente"  |----------------*
% 	    +------------------------------+

 comenzar:- read(N),
	    cicloA(1,N).

 cicloA(A,N):- A>N,!.
 cicloA(A,N):- cicloB(A,1,N),
	       A1 is A+1,
	       cicloA(A1,N).

 cicloB(_,B,N):- B>N,!.
 cicloB(A,B,N):- cicloC(A,B,1,N),
		 B1 is B+1,
		 cicloB(A,B1,N).

 cicloC(_,_,C,N):- C>N,!.
 cicloC(A,B,C,N):- A*A+B*B=:=C*C,
		   mostrar(A,B,C),
		   C1 is C+1,
		   cicloC(A,B,C1,N),!.

 cicloC(A,B,C,N):- C1 is C+1,
		   cicloC(A,B,C1,N).

 mostrar(A,B,C):- write(A),write('__'),write(B),write('__'),write(C),nl.	



% 	    +--------------------------+
%-----------| 2º Solucion : "Mejorado" |-------------*
% 	    +--------------------------+

 comenzar1:- read(N),
	     cicloA1(1,N).

 cicloA1(A,N):- A>N,!.
 cicloA1(A,N):- cicloB1(A,A,N),
	        A1 is A+1,
	        cicloA1(A1,N).

 cicloB1(_,B,N):-B>N,!.
 cicloB1(A,B,N):- C is B,
		  cicloC1(A,B,B),
		  A*A+B*B-C*C=:=0,
		  mostrar(A,B,C),
		  B1 is B+1,
		  cicloB1(A,B1,N),!.

 cicloB1(A,B,N):- B1 is B+1,
                  cicloB1(A,B1,N).

 cicloC1(A,B,C):- (A*A+B*B-C*C)=<0,!.
 cicloC1(A,B,C):- C1 is C+1,
	          cicloC(A,B,C1).




%     __     __     __     __     __     __     __     __     __     __     __     __     
%____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____
%    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    



%                       ___________________________________       			
%			|  CICLOS ITERATIVOS CON DIGITOS  |
%                       |_________________________________|



%    +---------------------------------------+
%    | 	Tratamiento de Digitos de Enteros    |
%    +---------------------------------------+


%------- Cantidad de Digitos -----------*
 
 cantdig(N,1):- N<10,!.
 cantdig(N,Q):- N1 is N//10,
		cantdig(N1,Q1),
		Q is Q1+1.


%------- Suma de Digitos ---------------*

 sumdig(N,N):- N<10,!.
 sumdig(N,Sum):- N1 is N//10,
		 sumdig(N1,Sum1),
		 Sum is Sum1+N mod 10.


%------- Ultimo Digito   ---------------*

 ultdig(N,Dig):- Dig is N mod 10.



%------- Primer Digito   ---------------*

 primerdig(N,N):- N<10,!.
 primerdig(N,Dig):- N1 is N//10,
		    primerdig(N1,Dig).





%     __     __     __     __     __     __     __     __     __     __     __     __     
%____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____
%    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    





%			+-----------------------------------+
%			|  EJERCICIOS. PROPUESTOS EN CLASE  |
%			+-----------------------------------+



% #1) frecuencia(N,Dig,Q): ----------------------------------------------------+
% Predicado que encuentra en Q, la cantidad de veces que aparece el dig en N   |
% -----------------------------------------------------------------------------+


 frecuencia(N,Dig,0):- N<10,N=\=Dig,!.
 frecuencia(N,Dig,1):- N<10,N=:=Dig,!.

 frecuencia(N,Dig,Q):- N1 is N//10, 
		       frecuencia(N1,Dig,Q1),
		       N mod 10=:=Dig,	
		       Q is Q1+1.
 
 frecuencia(N,Dig,Q):-N1 is N//10, 
		     frecuencia(N1,Dig,Q).	



% #2) iguales(N): --------------------------------------------------------+
% Predicado que es true, si el entero N,tiene todos sus digitos iguales   |
% ------------------------------------------------------------------------+


 iguales(N):- N<10,!.
 iguales(N):- N1 is N//10,
	      iguales(N1),
	      N mod 10=:=(N//10) mod 10.			



% #3) diferentes(N): -------------------------------------------------------+
% Predicado que es true, si todos los digitos del entero N son diferentes   |
% --------------------------------------------------------------------------+


 diferentes(N):- N<10,!.
 diferentes(N):- N1 is N//10,
	         diferentes(N1),
       	         D is N mod 10,
	         frecuencia(N,D,1).



% #4) puropares(N): -----------------------------------------+
% Predicado que es true, si todos los digitos son pares      |
% -----------------------------------------------------------+
 

 puropares(N):- N<10,N mod 2=:=0,!.
 puropares(N):- N1 is N//10,
	        puropares(N1),
	    	N mod 2=:=0.



% #5) paresImp(N): -------------------------------------------------+
% Predicado que es true, si existe en N al menos un digito par      |
% y existe al menos un digito impar                                 |
% ------------------------------------------------------------------+


 puroimpares(N):- N<10,N mod 2=\=0,!.
 puroimpares(N):- N1 is N//10,
	    	  puroimpares(N1),
	    	  N mod 2=\=0.

 paresImp(N):-not(puropares(N)),not(puroimpares(N)).





% *---------------------- FIN EJERCICIOS PROPUESTOS ----------------------*