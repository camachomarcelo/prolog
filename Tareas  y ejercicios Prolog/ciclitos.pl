vocales(1):-write('A').
vocales(N):-N<0,!.
vocales(N):-N mod 2 =:=0,
			write('A'),
			N1 is N-1,
			vocales(N1).
vocales(N):-N mod 2 =:=1,
			write('B'),
			N1 is N-1,
			vocales(N1).
			
			
pares(1):-write('0').
pares(N):-N<0,!.
pares(N):-N mod 2=:=0,
			write(N),
			N1 is N-1,
			pares(N1).
pares(N):-N mod 2=:=1,
			N1 is N-1,
			pares(N1).
concatenar(A,B):-write(A),write(B).
imprimir(A,B,D):-D is concatenar(A,B).


sumapares(1,0,I):-!.
sumapares(N,S,I):-N<0,!.
sumapares(N,S,I):-	
					I mod 2 =:=0,
					I1 is I +1,
					N1 is N-1,
					sumapares(N1,S1,I1),
					S is S1+I.
				
sumapares(N,S,I):-	I2 is I+1,
					sumapares(N,S,I2).
					
sumaenteros(0,0).
sumaenteros(N,SUM):-N<0,!.
sumaenteros(N,SUM):-N1 is N-1,
					sumaenteros(N1,SUM1),
					SUM is SUM1+N.
sumaimpares(0,0,I):-!.
sumaimpares(N,SUM,I):-N<0,!.
sumaimpares(N,SUM,I):-N1 is N-1,
					I mod 2 =:=1,
					I1 is I+1,
					sumaimpares(N1,SUM1,I1),
					SUM is SUM1+I.
sumaimpares(N,SUM,I):-I1 is I+1,
						sumaimpares(N,SUM,I1).

potencia(X,1,X).
potencia(X,N,POT):-N<0,!.
potencia(X,N,POT):-N1 is N-1,
					potencia(X,N1,POT1),
					POT is POT1*X.
sumapotencia(X,1,SUM):-SUM is X.
sumapotencia(X,N,SUM):-N<0,!.
sumapotencia(X,N,SUM):-N1 is N-1,
					   sumapotencia(X,N1,SUM1),
					   potencia(X,N,POTENCIA),
						SUM is SUM1+POTENCIA.
mostrarfactores(1):-write('1').



						
						
						

					
					





