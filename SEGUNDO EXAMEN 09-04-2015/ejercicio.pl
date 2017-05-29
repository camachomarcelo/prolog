igual(X,X).
diferente(X,X).

   ejercicio(X1,Y1, X2,Y2,X3,Y3):- igual(Y1,Y2); igual(Y1,Y3); igual(Y2,Y3),
                                   diferente(X1,X2), diferente(X1,X3), diferente(X2,X3).
   
%valores correctos
%X1 Y1 X2  Y2  X3 Y3
%=====================
%3  2  4   2   5   8 
%3  1  4   2   5   2 
%3  1  4   2   5   1

%valores errados
%=====================
%3  2  4   1   5   8 
%4  2  4   2   5   8    
   
   
   
   
   
   
   
   
   
   
   
   
   
	