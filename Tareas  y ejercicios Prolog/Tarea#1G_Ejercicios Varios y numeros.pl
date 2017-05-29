 %			 |    TAREA #1. EJERCICIOS VARIOS.    |
 %                       |____________________________________|

 %------------------------------------------------+
 %		TAREA GRUPAL.                     |
 %	Implementar los siguientes predicados:    |
 %------------------------------------------------+

 menor(A,B,Me):-A<B,Me is A.
 menor(A,B,Me):-B=<A,Me is B.

 menor(A,B,C,Me):-menor(A,B,Me1),menor(C,Me1,Me).
 menor(A,B,C,D,Me):-menor(A,B,C,Me1),menor(D,Me1,Me).
 menor(A,B,C,D,E,Me):-menor(A,B,C,D,Me1),menor(E,Me1,Me).

%-------------------------------------------------------------------------------

 mayor(A,B,My):-A>B,My is A.
 mayor(A,B,My):-B>=A,My is B.

 mayor(A,B,C,My):-mayor(A,B,My1),mayor(C,My1,My).
 mayor(A,B,C,D,My):-mayor(A,B,C,My1),mayor(D,My1,My).
 mayor(A,B,C,D,E,My):-mayor(A,B,C,D,My1),mayor(E,My1,My). 


 par(A):-A mod 2=:=0.
 impar(A):-not(par(A)).

 %------------------------------------------------------------------------------

 segundoMayor(A,B,My):-menor(A,B,My).
 segundoMayor(A,B,C,My):-segundoMayor(A,B,M1),segundoMayor(B,C,M2),
			 segundoMayor(A,C,M3),mayor(M1,M2,M3,My).

 segundoMayor(A,B,C,D,My):-segundoMayor(A,B,C,M1),segundoMayor(B,C,D,M2),
			  segundoMayor(A,B,D,M3),mayor(M1,M2,M3,My).

 segundoMayor(A,B,C,D,E,My):-segundoMayor(A,B,C,D,M1),segundoMayor(B,C,D,E,M2),
			    segundoMayor(A,B,C,E,M3),mayor(M1,M2,M3,My).

 %-----------------------------------------------------------------------------

 segundoMenor(A,B,Me):-mayor(A,B,Me).
 segundoMenor(A,B,C,Me):-segundoMenor(A,B,M1),segundoMenor(B,C,M2),
			 segundoMenor(A,C,M3),menor(M1,M2,M3,Me).

 segundoMenor(A,B,C,D,Me):-segundoMenor(A,B,C,M1),segundoMenor(B,C,D,M2),
			   segundoMenor(A,C,D,M3),menor(M1,M2,M3,Me).

 segundoMenor(A,B,C,D,E,Me):-segundoMenor(A,B,C,D,M1),segundoMenor(B,C,D,E,M2),
			     segundoMenor(A,C,D,E,M3),menor(M1,M2,M3,Me).

 %----------------------------------------------------------------------------

 dospares(A,B):-par(A),par(B).

 dospares(A,B,C):-dospares(A,B),impar(C);
		  dospares(A,C),impar(B);
		  dospares(B,C),impar(A).
 
 dospares(A,B,C,D):-dospares(A,B,C),impar(D);dospares(A,B,D),impar(C);
		    dospares(A,C,D),impar(B);dospares(B,C,D),impar(A).

 dospares(A,B,C,D,E):-dospares(A,B,C,D),impar(E);dospares(A,B,C,E),impar(D);
		      dospares(A,B,D,E),impar(C);dospares(A,C,D,E),impar(B);
		      dospares(B,C,D,E),impar(A).
  
 %----------------------------------------------------------------------------

 trespares(A,B,C):-dospares(A,B),par(C).

 trespares(A,B,C,D):-trespares(A,B,C),impar(D);trespares(A,B,D),impar(C);
		     trespares(A,C,D),impar(B);trespares(B,C,D),impar(A).

 trespares(A,B,C,D,E):-trespares(A,B,C,D),impar(E);trespares(A,B,C,E),impar(D);
		       trespares(A,B,D,E),impar(C);trespares(A,C,D,E),impar(B);
		       trespares(B,C,D,E),impar(A).

%-------------------------------------------------------------------------------

 cuatropares(A,B,C,D):-trespares(A,B,C),par(D).

 cuatropares(A,B,C,D,E):-cuatropares(A,B,C,D),impar(E);cuatropares(A,B,C,E),impar(D);
			 cuatropares(A,B,D,E),impar(C);cuatropares(A,C,D,E),impar(B);
			 cuatropares(B,C,D,E),impar(A).

 
 
 %-----------------   REGLAS AUXILIARES   --------------------------------
 
 tresimpares(A,B,C):-impar(A),impar(B),impar(C).
 cuatroimpares(A,B,C,D):-tresimpares(A,B,C),impar(D).
 cincopares(A,B,C,D,E):-cuatropares(A,B,C,D),par(E).
 cincoimpares(A,B,C,D,E):-cuatroimpares(A,B,C,D),impar(E).
 
 %--------------------- Fin  R Aux --------------------------------------
 
 %-------------------------------------------------------------------------------

 parimpar(A,B):-par(A),impar(B);par(B),impar(A).
 parimpar(A,B,C):-not(trespares(A,B,C)),not(tresimpares(A,B,C)).
 parimpar(A,B,C,D):-not(cuatropares(A,B,C,D)),not(cuatroimpares(A,B,C,D)).
 parimpar(A,B,C,D,E):-not(cincopares(A,B,C,D,E)),not(cincoimpares(A,B,C,D,E)).

 %------------------------------------------------------------------------------
 
 iguales(A,B):-A=:=B.
 iguales(A,B,C):-iguales(A,B),iguales(B,C).
 iguales(A,B,C,D):-iguales(A,B,C),iguales(C,D).
 iguales(A,B,C,D,E):-iguales(A,B,C,D),iguales(D,E).

 %-------------------------------------------------------------------------------

 diferentes(A,B):-not(iguales(A,B)).
 diferentes(A,B,C):-diferentes(A,B),diferentes(A,C),diferentes(B,C).
 diferentes(A,B,C,D):-diferentes(A,B,C),diferentes(A,D),diferentes(B,D),diferentes(C,D).
 diferentes(A,B,C,D,E):-diferentes(A,B,C,D),diferentes(A,E),diferentes(B,E),
			diferentes(C,E),diferentes(D,E).

 %--------------------------------------------------------------------------------

 dosiguales(A,B):-iguales(A,B).

 dosiguales(A,B,C):-dosiguales(A,B),diferentes(B,C);
		    dosiguales(A,C),diferentes(A,B);
		    dosiguales(B,C),diferentes(A,B).

 dosiguales(A,B,C,D):-dosiguales(A,B,C),diferentes(A,D),diferentes(B,D);
		      dosiguales(A,D,B),diferentes(A,C),diferentes(B,C);
		      dosiguales(A,C,D),diferentes(A,B),diferentes(C,B);
 		      dosiguales(B,C,D),diferentes(B,A),diferentes(C,A).
	
 dosiguales(A,B,C,D,E):-dosiguales(A,B,C,D),diferentes(A,E),diferentes(B,E);
			dosiguales(A,B,C,E),diferentes(A,D),diferentes(B,D);
			dosiguales(A,B,D,E),diferentes(A,C),diferentes(B,C);
			dosiguales(A,C,D,E),diferentes(A,B),diferentes(C,B);
			dosiguales(B,C,D,E),diferentes(B,A),diferentes(C,A).

 %------------------------------------------------------------------------------- 
 
 tresiguales(A,B,C):-dosiguales(A,B),iguales(B,C).

 tresiguales(A,B,C,D):-tresiguales(A,B,C),diferentes(A,D);
			tresiguales(A,B,D),diferentes(A,C);
			tresiguales(A,C,D),diferentes(A,B);
			tresiguales(B,C,D),diferentes(A,D).


 tresiguales(A,B,C,D,E):-tresiguales(A,B,C),diferentes(A,D),diferentes(A,E);
			 tresiguales(A,B,D),diferentes(A,C);diferentes(A,E);
			 tresiguales(A,B,E),diferentes(A,D);diferentes(A,C);
			 tresiguales(A,C,E),diferentes(A,D);diferentes(A,B);
			 tresiguales(A,D,E),diferentes(A,C);diferentes(A,B);
			 tresiguales(B,C,D),diferentes(A,B);diferentes(B,E);
			 tresiguales(B,C,E),diferentes(B,A);diferentes(B,D);
			 tresiguales(C,D,E),diferentes(A,C);diferentes(B,C).
  
 %------------------------------------------------------------------------------

 congruente(A,B):-iguales(A,B).

 congruente(A,B,C):-A is B+C; B is A+C; C is A+B.

 congruente(A,B,C,D):-A is (B+C+D);B is(A+C+D);C is (A+B+D);D is (B+C+D).

 congruente(A,B,C,D,E):-A is (B+C+D+E);B is (A+C+D+E);C is (A+B+D+E);
			D is (A+B+C+E);E is (A+B+C+D).

 %------------------------------------------------------------------------------

 dif(A,B,R):-R is A-B.

 menorDiferencia(A,B,Me):-dif(A,B,M1),dif(B,A,M2),menor(M1,M2,Me).

 menorDiferencia(A,B,C,Me):-menorDiferencia(A,B,M1),menorDiferencia(A,C,M2),
			    menorDiferencia(B,C,M3),menor(M1,M2,M3,Me).

 menorDiferencia(A,B,C,D,Me):-menorDiferencia(A,B,C,M1),menorDiferencia(A,B,D,M2),
			      menorDiferencia(A,C,D,M3),menor(M1,M2,M3,Me).

 menorDiferencia(A,B,C,D,E,Me):-menorDiferencia(A,B,C,D,M1),menorDiferencia(A,B,C,E,M2),
				menorDiferencia(A,C,D,E,M3),menor(M1,M2,M3,Me).

 %-------------------------------------------------------------------------------

 escalera(A,B):-mayor(A,B,My),menor(A,B,Me),My=:=Me+1.

 escalera(A,B,C):-mayor(A,B,C,My),menor(A,B,C,Me),segundoMayor(A,B,C,M2),
		  My=:=M2+1,M2=:=Me+1.

 escalera(A,B,C,D):-mayor(A,B,C,D,My),menor(A,B,C,D,Me),segundoMayor(A,B,C,D,M2),
		    segundoMenor(A,B,C,D,M1),My=:=M2+1,M2=:=M1+1,M1=:=Me+1.

 /*escalera(A,B,C,D,E):-mayor(A,B,C,D,E,My),menor(A,B,C,D,E,Me),segundoMayor(A,B,C,D,M3),
		      segundoMenor(A,B,C,D,M1),tercerMayor(A,B,C,D,E,M2),
		      My=:=M3+1,M3=:=M2+1,M1=:=M2+1,M1=:=Me+1. */

	
 %-------------------------------------------------------------------------------

 poker(A,B):-diferentes(A,B).
 poker(A,B,C):-dosiguales(A,B,C).
 poker(A,B,C,D):-tresiguales(A,B,C,D).

 cuatroiguales(A,B,C,D):-tresiguales(A,B,C),iguales(C,D).
 
 poker(A,B,C,D,E):-cuatroiguales(A,B,C,D),diferentes(A,E);
 			cuatroiguales(A,B,C,E),diferentes(A,D);
			cuatroiguales(A,B,D,E),diferentes(A,C);
			cuatroiguales(A,C,D,E),diferentes(A,B);
			cuatroiguales(B,C,D,E),diferentes(B,A).

 %-------------------------------------------------------------------------------

 sum(A,B,R):-R is A+B. 
 
 mochila(P1,Max,Peso):-P1=<Max,Peso is P1.	
 
 mochila(P1,P2,Max,Peso):-sum(P1,P2,R1),mochila(R1,Max,Peso);
			  mayor(P1,P2,My),mochila(My,Max,Peso);
			  menor(P1,P2,Me),mochila(Me,Max,Peso).

 mochila(P1,P2,P3,Max,Peso):-sum(P1,P2,R0),sum(R0,P3,R),mochila(R,Max,Peso);
			mochila(P1,P2,Max,R1),mochila(P1,P3,Max,R2),mochila(P2,P3,Max,R3),
			     mayor(R1,R2,R3,My),mochila(My,Max,Peso);
			     segundoMayor(R1,R2,R3,M2),mochila(M2,Max,Peso);
			     menor(R1,R2,R3,Me),mochila(Me,Max,Peso);
			mayor(P1,P2,P3,My),mochila(My,Max,Peso);
			     segundoMayor(P1,P2,P3,M2),mochila(M2,Max,Peso);
			     menor(P1,P2,P3,Me),mochila(Me,Max,Peso).



 %-------------------------------  FIN TAREA #1 Grupo 15---------------------------------