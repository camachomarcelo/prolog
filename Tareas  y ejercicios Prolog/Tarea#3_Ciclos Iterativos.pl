
%     		+---------------------------------+
%     		| PROGRAMAS ITERATIVOS EN PROLOG  |
%     		+---------------------------------+


% #1)--------------------------------------------------------------+
% Hacer un programa que muestre la suma de los N primeros numeros  | 
%------------------------------------------------------------------+

 comenzar:-read(N),
	   sumar(1,N,Sum),
	   write('Suma ='),write(Sum).

 sumar(I,N,0):-I>N,!.
 sumar(I,N,Sum):-I1 is I+1,
		sumar(I1,N,Sum1),
		Sum is Sum1+I.

%------------------------------------------------------------------+
% #2) Hacer un programa para mostrar los divisores de un entero N  | 
%------------------------------------------------------------------+

 comenzar1:-read(N),	  
	  write('Divisores :'),nl,		
	  divisores(1,N).	

 divisores(I,N):-I>N,!.

 divisores(I,N):-N mod I =:=0,
		  write(I),nl,       	% predicado nl=V y salta de linea 	
		  I1 is I+1,
		  divisores(I1,N),!.

 divisores(I,N):-I1 is I+1,		% se sigue hasta finalizar el ciclo
		divisores(I1,N).

%--------------------------------------------------------------------------+
% #3) Hacer un programa para vereficar si un entero es un numero perfecto  | 
%--------------------------------------------------------------------------+

 perfecto(N):-perfecto(1,N,P),N is P-N.

 perfecto(I,N,0):-I>N,!.

 perfecto(I,N,P):-N mod I =:=0,		         	 	
		  I1 is I+1,
		  perfecto(I1,N,P1),
		  P is P1+I,!. 	

 perfecto(I,N,P):-I1 is I+1,		
		perfecto(I1,N,P).




%     __     __     __     __     __     __     __     __     __     __     __     __     
%____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____/ /____
%    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    \_\    





%     		+-----------------------------------+
%     		| EJERCICIOS.	CICLOS EN PROLOG    |
%     		+-----------------------------------+


%--------------------------------------------------------------------------------+
%  Desarrollar los sgtes predicados que manipulen sumatorias y ciclos diversos   |
%--------------------------------------------------------------------------------+


% #1)----------------------------------------------+
%  Encuentra la suma de los primeros n numeros     | 
%--------------------------------------------------+


 sumaEnteros(N,Sum):-suma(1,N,S),Sum is S.
 
 suma(I,N,0):-I>N,!.
 suma(I,N,S):-I1 is I+1,
		suma(I1,N,S1),
		S is S1+I.	


% #2)-------------------------------------------------+
% Encuentra la suma de los primeros n numeros pares   | 
%-----------------------------------------------------+


 sumaPares(N,Sum):-sumapar(1,N,S),Sum is S.
 
 sumapar(I,N,0):-I>N,!.
 sumapar(I,N,S):-I1 is I+1,
		sumapar(I1,N,S1),
		S is S1+(2*I).


% #3)--------------------------------------------------+
% Encuentra la suma de los primeros n numeros impares  | 
%------------------------------------------------------+


 sumaImpares(N,Sum):-sumaimpar(1,N,S),Sum is S.
 
 sumaimpar(I,N,0):-I>N,!.
 sumaimpar(I,N,S):-I1 is I+1,
		sumaimpar(I1,N,S1),
		S is S1+((2*I)-1).


% #4)--------------------------------------+
% Encuentra  el factorial de un numero n   |		
%------------------------------------------+


 factorial(N,F):-fact(1,N,Fa),F is Fa.
  
 fact(I,N,1):-I>N,!.
 fact(I,N,Fa):-I1 is I+1,
		fact(I1,N,F1),
		Fa is F1*I.


% #5)-----------------------------------------------+
% Encuntra el numero combinatorio de N elementos    |
%---------------------------------------------------+


 combi(N,R,NR):-factorial(N,F1),Fn is F1,
		factorial(R,F2),Fr is F2,
		X is N-R,
		factorial(X,F3),Fnr is F3,
		NR is (Fn/(Fr*Fnr)). 


% #6)-----------------------------------------------+
% Encuentra la suma de los coeficientes binomiales  |
%---------------------------------------------------+


 sumacoef(N,Sum):-sumcoef(N,0,S),Sum is S.

 sumcoef(N,R,0):-R>N,!.
 
 sumcoef(N,R,S):-R1 is R+1,
		 sumcoef(N,R1,S1),
		 combi(N,R,C),
		 S is S1+C. 


% #7)-------------------------------------+
% Encuentra la potencia de X a la N       |
%-----------------------------------------+

 potencia(X,N,P):-pot(1,X,N,Po),P is Po.

 pot(I,_,N,1):-I>N,!.
 pot(I,X,N,P):-I1 is I+1,
		pot(I1,X,N,P1),
		P is P1*X.


% #8)------------------------------------+
% Encuentra la suma de las potencias     |
%----------------------------------------+


 sumapot(X,N,Sum):-sumpot(X,N,0,S),Sum is S.

 sumpot(_,N,I,0):-I>N,!.
 
 sumpot(X,N,I,S):-I1 is I+1,
		  sumpot(X,N,I1,S1),
		  potencia(X,I,P),
		  S is S1+P. 


% #9)-----------------------------------------+
% Muestra la tabla de multiplicar de 1 a N    |
%---------------------------------------------+


 mostrartabla(N):-mostrartab(N,1).

 mostrartab(N,I):-I>N,!.
 
 mostrartab(N,I):-mostrartab2(N,1,I),
		  I1 is I+1,	
		  mostrartab(N,I1).

 mostrartab2(N,J,_):-J>N,!.
 
 mostrartab2(N,J,I):-M is J*I,
		     write(I),write('x'),write(J),write('='),
		     write(M),nl,
		     J1 is J+1,	
		     mostrartab2(N,J1,I).


% #10)---------------------------------------------------------+
% Muestra pares de factores que multiplicados sean igual a N   |
%--------------------------------------------------------------+	
	
 mostrarfactores(N):-mostrarfact(N,1).

 mostrarfact(N,I):-I>N,!.
 
 mostrarfact(N,I):-mostrarfact2(N,1,I),
		  I1 is I+1,	
		  mostrarfact(N,I1).

 mostrarfact2(N,J,_):-J>N,!.
 
 mostrarfact2(N,J,I):-N=:=J*I,
		     write(I),write('x'),write(J),write('='),
		     write(N),nl,
		     J1 is J+1,	
		     mostrarfact2(N,J1,I),!.

 mostrarfact2(N,J,I):-J1 is J+1,	
		      mostrarfact2(N,J1,I),!.




%---------------------------------- F I N -----------------------.
