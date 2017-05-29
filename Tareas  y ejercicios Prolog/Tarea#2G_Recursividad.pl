 %			  ____________________________________ 	
 %			 |    TAREA #2. RECURSIVIDAD.	      |
 %                       |____________________________________|


 %----------------------------------------------------------------+
 %		TAREA GRUPAL.                                     |
 %	Implementar al menos 6 problemas con naturaleza recursiva |
 %----------------------------------------------------------------+



 % #1)-------------------------------------------------+  
 %  cuadrado(N,R) : Devuelve el cuadrado de un numero  |
 % ----------------------------------------------------+ 
 
 cuadrado(1,1).
 
 cuadrado(N,C):-N1 is N-1,
		cuadrado(N1,C1),
		C is C1+2*N1+1.



 % #2)-------------------------------------------+
 % invertir(N,R) : Devuelve el numero invertido  |
 % ----------------------------------------------+
 
 invertir(N,R):-N<10,R is N.

 invertir(N,R):-D is N mod 10,
		N1 is N//10,
		invertir(N1,R1), 
		candig(R1,C),
		R is (10**C)*D+R1.


	
 % #3)----------------------------------------------------------+
 % candig(N,R) : Devuelve la cantidad de digitos de un numero   |
 % -------------------------------------------------------------+

 candig(N,R):-N<10,R is 1.
 
 candig(N,R):-N1 is N//10,
		candig(N1,R1),
		R is R1+1.	



 % #4)----------------------------------------------------+
 % suma(N,R) : Devuelve la suma de  0 a N numeros dados   |
 % -------------------------------------------------------+

 suma(0,0).
 
 suma(N,R):-N1 is N-1,
		suma(N1,R1),
		R is R1+N.	



 % #5)-------------------------------------------------------+
 % sumapar(N,R) : Devuelve la suma de  0 a N numeros pares   |
 % ----------------------------------------------------------+

 sumapar(0,0).
 
 sumapar(N,S):-	N mod 2 =:= 0,
		N1 is N - 1,
		sumapar(N1,S1),
		S is S1 + N.

 sumapar(N,S):- N1 is N - 1,sumapar(N1,S).



 % #6)-----------------------------------------------------+
 % frecuencia(N,D,R): Devuelve frecunecia de un digito     |
 % --------------------------------------------------------+

 frecuencia(N,D,F):-N<10, N=:=D, F is 1.
 frecuencia(N,D,F):-N<10, N=\=D, F is 0.

 frecuencia(N,D,F):-D1 is N mod 10, D1=:=D,
			N1 is N//10,
			frecuencia(N1,D,F1),
			F is F1+1.

 frecuencia(N,D,F):-N1 is N//10,  frecuencia(N1,D,F).



 % #7)--------------------------------------------------+
 % eliminar(N,D,R) : Elimina un digito de un numero     |
 % -----------------------------------------------------+

 eliminar(0,_,0).
 eliminar(N,D,R):-D1 is N mod 10,
		N1 is N // 10,
		D =\= D1,
		eliminar(N1,D,R1),
		R is R1*10+D1.

  eliminar(N,D,R1):-N1 is N // 10,eliminar(N1,D,R1).



 % #8)----------------------------------------------------------+ 
 % sumdig(N,R) : Devuelve la suma de los digitos de un numero   |
 % -------------------------------------------------------------+
 
 sumadig(N,R):-N<10,R is N.

 sumadig(N,R):-D is N mod 10,
		N1 is N//10,
		sumadig(N1,R1),
		R is R1+D.



 % #9)------------------------------------------------------------------+
 % sumdigpar(N,R): Devuelve al suma de los digitos pares de un numero   | 
 % ---------------------------------------------------------------------+
 sumdigpar(0,0).

 sumdigpar(N,R):-D is N mod 10,
		N1 is N//10,
		D mod 2=:=0, 
		sumdigpar(N1,R1),
		R is R1+D.

 sumdigpar(N,R):-N1 is N//10, sumdigpar(N1,R).



 % #10)----------------------------------------------------+
 % multlip(A,B,R): Devuelve la multiplicion de 2 numeros   |
 %---------------------------------------------------------+

 multip(_,0,0).
 multip(0,_,0).
 multip(A,1,A).
 multip(1,B,B).

 multip(A,B,R):-B1 is B-1,
		multip(A,B1,R1),
		R is R1+A.
 


 % #11)---------------------------------------------------------+
 % mcd(A,B,C) : Devuelve el maximo comun divisor de 2 numeros   |
 % -------------------------------------------------------------+

 mcd(A,B,R):-A mod B=:=0, R is B.

 mcd(A,B,R):-B1 is A mod B,
		mcd(B,B1,R).
		


 % #12)-----------------------------------------------------+
 % decabin(A,[]) : Convierte un numero decimal a binario    |
 % ---------------------------------------------------------+

 decabin(N,[]):-N<2, C is N+48, put(C).

 decabin(N,[]):-M is (N mod 2)+48, 
		N1 is N//2,
		decabin(N1,[]),
		put(M).		








%-------------------------- FIN TAREA #2 RECURSIVIDAD ----------------------*
