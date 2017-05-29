%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Tarea #1. El Problema de las Familias %							       %
% 																	       %
% Representar una Base de Conocimientos sobre sus propias familias         %
% considerar a lo más 4 generaciones y al menos 30 personas                % 
%                                                                          %
% hombre(X),                                                               %
% mujer(X),																   %	
% matr(X, Y),                                                              %
% madre(X, Y),															   %
%																	       %
% Completar la base de conocimiento con al menos 25 reglas de inferencia   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



hombre(simon).
hombre(jaime).
hombre(marcelo).
hombre(pepe).
hombre(edwin).
hombre(carlos).
hombre(ramiro).
hombre(dody).
hombre(lucho).
hombre(choco).
hombre(jorgito).
hombre(wilson).
hombre(ruben).
hombre(meco).
hombre(josesito).
hombre(amilcar).
hombre(eduardo).
hombre(darko).
hombre(freddy).
hombre(tino).
hombre(luchin).
hombre(victor).



mujer(zenobia).
mujer(alcira).
mujer(ana).
mujer(lola).
mujer(rosario).
mujer(blanca).
mujer(jeni).
mujer(carmen).
mujer(melva).
mujer(mariana).
mujer(lolita).
mujer(brianela).
mujer(patricia).
mujer(marta).
mujer(elin).
mujer(sandra).
mujer(negrin).
mujer(eda).
mujer(nelva).
mujer(petrona).
mujer(adriana).
mujer(zulema).
mujer(brenda).
mujer(evelin).
mujer(petrona).
mujer(elenise).
mujer(daniela).



matri(simon,zenobia).
matri(ramiro,lola).
matri(jaime,rosario).
matri(wilson,melva).
matri(eduardo,patricia).
matri(roberto,alcira).
matri(dody,elin).
matri(meco,sandra).
matri(freddy,zulema).
matri(luchin,elenise).


madre(zenobia,alcira).
madre(alcira,ana).
madre(ana,brenda).
madre(lola,rosario).
madre(rosario,marcelo).
madre(rosario,evelin).
madre(zulema,darko).
madre(lola,melva).
madre(melva,nelva).
madre(nelva,brianela).
madre(sandra,adriana).
madre(jeni,patricia).
madre(patricia,jorgito).
madre(elin,meco).
madre(petrona,lola).


persona(X):- mujer(X);hombre(X).

abuelo(X,Y):-madre(Z,Y),padre(X,Z);padre(Z,Y),padre(X,Z).

abuela(X,Y):- abuelo(Z,Y),matri(Z,X).

nieto(Y,X):-abuelo(X,Y);abuela(X,Y).

padre(X,Y):-madre(Z,Y),matri(X,Z).

hermano(X,Y):- hombre(X),madre(Z,X),madre(Z,Y),not(X=Y).

hermana(X,Y):- mujer(X),madre(Z,X),madre(Z,Y),not(X=Y).

hermanastro(X,Y):-padre(Z,Y),matri(Z,P),not(madre(P,Y)), hijos(Z,P,X).

sobrino(X,Y):- hombre(X),tio(Y,X);hombre(X),tia(Y,X).

sobrina(X,Y):-mujer(X),tio(Y,X);mujer(X),tia(Y,X).

primosHermanos(X,Y):-madre(Z,X),padre(W,Y),hermano(W,Z);
                     padre(Z,X),madre(W,Y),hermana(W,Z);
                     madre(Z,X),madre(W,Y),hermana(W,Z);
		     padre(Z,X),padre(W,Y),hermano(W,Z).

sinHijos(X,Y):-matri(X,Y),not(madre(Y,_)).	

primo(X,Y):- hombre(X),tio(Z,Y),padre(Z,X);
             hombre(X),tia(Z,Y),madre(Z,X).

prima(X,Y):- mujer(X),tio(Z,Y),padre(Z,X);
             mujer(X),tia(Z,Y),madre(Z,X).

tio(X,Y):- madre(Z,Y),hermano(X,Z);padre(Z,Y),hermano(X,Z).

tia(X,Y):- madre(Z,Y),hermana(X,Z);padre(Z,Y),hermana(X,Z).

hermanos(X,Y):-madre(Z,X),madre(Z,Y),not(X=Y).

hijo(X,Y):-hombre(X),madre(Y,X);
           hombre(X),padre(Y,X).

hija(X,Y):-mujer(X),madre(Y,X);
           mujer(X),padre(Y,X).

hijaUnica(X):- not(hermana(X,_)).

soltero(X):-hombre(X),not(matri(X,_)).      

soltera(X):-mujer(X),not(matri(_,X)).        

bisAbuelo(X,Y):-madre(Z,Y),abuelo(X,Z);
                padre(Z,Y),abuelo(X,Z).  

bisAbuela(X,Y):-madre(Z,Y),abuela(X,Z);
                padre(Z,Y),abuela(X,Z).

suegro(X,Y):- hombre(X),yerno(Y,X);
              hombre(X),nuera(Y,X).

suegroo(X,Y):- hombre(Y),matri(Y,Z),padre(X,Z);
               mujer(Y),matri(Z,Y),padre(X,Z).           

suegra(X,Y):- mujer(X),yerno(Y,X);
              mujer(X),nuera(Y,X).   

tataraAbuelo(X,Y):- abuelo(Z,Y),abuelo(X,Z);
                    abuela(Z,Y),abuelo(X,Z).

primos(X,Y):- tio(Z,Y),padre(Z,X);
              tia(Z,Y),madre(Z,X).

casado(X):- matri(X,_).

casada(X):- matri(_,X).	     
 
sinN(X):- hombre(X),not(abuelo(X,_));
              mujer(X),not(abuela(X,_)).

cunado(X,Y):-matri(Y,Z),hermano(X,Z);
	     matri(Z,Y),hermano(X,Z);
	     hermana(Z,Y),matri(X,Z).

tataraAbuela(X,Y):- abuelo(Z,Y),abuela(X,Z);
                    abuela(Z,Y),abuela(X,Z).

nuera(X,Y):- matri(Z,X),madre(Y,Z);
             matri(Z,X),padre(Y,Z).

tioBisabuelo(X,Y):-bisAbuelo(Z,Y),hermano(X,Z);
		   bisAbuela(Z,Y),hermano(X,Z).

tioPolitico(X,Y):-mujer(Y),matri(Z,Y),tio(X,Z);
		  hombre(Y),matri(Y,Z),tio(X,Z).

consuegro(X,Y):-padre(X,Z),hombre(Z),padre(Y,W),mujer(W),matri(Z,W);
		padre(X,Z),mujer(Z),padre(Y,W),hombre(W),matri(W,Z).

bisnieta(X,Y):-mujer(X),bisAbuela(Y,X);mujer(X),bisAbuelo(Y,X).

sinNietos(X):- not(abuelo(X,_)), 
                     not(abuela(X,_)).

primosLejanos(X,Y):-padre(Z,X),padre(W,Y),primo(Z,W);
		    padre(Z,X),madre(W,Y),primo(Z,W);
		    madre(Z,X),padre(W,Y),prima(Z,W);
		    madre(Z,X),madre(W,Y),prima(Z,W).

tioSegundo(X,Y):-tio(Z,Y),tio(X,Z);
		 tia(Z,Y),tio(X,Z).


yerno(X,Y):- matri(X,Z),madre(Y,Z);
             	matri(X,Z),padre(Y,Z).

hijoUnico(X):- not(hermano(X,_)).

concunado(X,Y):-hermano(X,Z),hombre(Z),hermano(Y,W),mujer(W),matri(Z,W);
		hermano(X,Z),mujer(Z),hermano(Y,W),hombre(W),matri(W,Z).

hijoPolitico(X,Y):-yerno(X,Y).
