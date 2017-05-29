%-----------------------------%

ejeX(X,Y):-Y =:= 0,(X>=0;X=<0).

ejeY(X,Y):-X =:= 0,(Y=<0;Y>=0).

lugar(X,Y,Q):-(X=:=0,Y=:=0),Q is  0;
	      (X>0,Y>0),Q is  1;
	      (X<0,Y>0),Q is  2;
	      (X<0,Y<0),Q is  3;
	      (X>0,Y<0),Q is  4;
	      ejeX(X,Y),Q is 5;
	      ejeY(X,Y),Q is 6.	

horizontal(X1,Y1,X2,Y2)


%------------4 OTROS EJERCICIOS-----------------%	      	
expresion(X,Y,Z):-between(1,9,X),between(1,9,Z),(Y=:='*';Y=:='/';Y=:='+';Y=:='-').

departamento(comercial).
departamento(rrhh).
departamento(diseño).
departamento(relaciones).

persona(juan).
persona(ariel).
persona(pedro).
persona(raul).

trabaja(juan,comercial).
trabaja(ariel,rrhh).
trabaja(pedro,diseño).

jefe()
