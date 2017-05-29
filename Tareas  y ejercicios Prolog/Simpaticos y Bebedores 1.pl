 %                    | TAREA #2. EJERCICIOS DIVERSOS CON PREDICADOS. |
 %                    |_______________________________________________| 


 %--------------------------------------------------------------+
 %         TAREA #2. EJERCICIOS DIVERSOS CON PREDICADOS.        |
 %        Sobre el Problema de los BEBEDORES y SIMPATICOS.      |
 %--------------------------------------------------------------+

 % ----------------------------------------------------+
 %       TODO LO SIGUIENTE SON HECHOS DEL EJ. Nº1      |
 % ----------------------------------------------------+

 hombre(cesar).
 hombre(luis).
 hombre(jorge).
 hombre(jose).
 hombre(raul).
 hombre(julio).
 hombre(jaime). 

 mujer(maria).
 mujer(ely).
 mujer(lucia).
 mujer(ana).
 mujer(gloria).
 mujer(carla).
 mujer(julia).

 matr(cesar,maria).
 matr(luis,lucia).
 matr(jose,ana).
 matr(julio,carla).
 matr(jaime,gloria).

 hombresimp(cesar,maria).
 hombresimp(luis,lucia).
 hombresimp(jose,ana).
 hombresimp(jorge,carla).
 hombresimp(julio,ana).
 hombresimp(raul,julia).

 mujersimp(cesar,maria).
 mujersimp(luis,lucia).
 mujersimp(jose,ana).
 mujersimp(jorge,carla).
 mujersimp(julio,ana).
 mujersimp(raul,julia).


 % ----------------------------------------------------+
 %       TODO LO SIGUIENTE SON HECHOS DEL EJ. Nº2      |
 % ----------------------------------------------------+
 
 cerveza(paceña).
 cerveza(ducal).
 cerveza(bock).
 cerveza(pilsener).
 cerveza(corona).
 cerveza(taquiña). 

 bar(aqua).
 bar(buffalo).
 bar(mad).
 bar(josecuervo).
 bar(tacuarembo).
 bar(baradero).

 bebedor(cesar).
 bebedor(luis).
 bebedor(jorge).
 bebedor(maria).
 bebedor(ely).
 bebedor(lucia). 

 gusta(cesar,paceña).
 gusta(luis,ducal).
 gusta(jorge,bock).
 gusta(maria,corona).
 gusta(ely,taquiña).
 gusta(lucia,pilsener).

 sirve(josecuervo,paceña).
 sirve(josecuervo,bock).
 sirve(baradero,ducal).
 sirve(baradero,corona).
 sirve(mad,paceña).
 sirve(buffalo,pilsener). 

 frec(cesar,josecuervo).
 frec(luis,baradero).
 frec(jorge,aqua).
 frec(maria,mad).
 frec(ely,tacuarembo).
 frec(lucia,buffalo). 


 % -------------------------------------------------------------------+
 %       TODO LO SIGUIENTE SON REGLAS DE INFERENCIA DEL EJ. Nº1       |
 % -------------------------------------------------------------------+ 

 matrsimp(X,Y):-matr(X,Y),hombresimp(X,Y),mujersimp(X,Y).                       % Pareja de matrimonio que se caen simpaticos mutuamnete

 homsimpmujcas(X,Y):-hombresimp(X,Y),matr(_,Y).                                 % Hombres que caen simpaticos solo a mujeres casadas

 simpnocas(X,Y):-hombresimp(X,Y),mujersimp(X,Y),not(matr(_,Y)),not(matr(X,_)).  % Hombres y Mujeres que se caen simpaticos mutanente y no esten casados 


 %--------------------------- OTRAS REGLAS ----------------------------  

 mujsimphomcas(X,Y):-mujersimp(X,Y),matr(X,_).                                  % Hombres que caen simpaticos solo a mujeres casadas
 
 homnosim(X,Y):-hombre(X),not(hombresimp(X,Y)).                                 % Hombres que no le caen simpaticos a una mujer

 mujnosim(X,Y):-mujer(X),not(mujersimp(Y,X)).                                   % Mujeres que no le caen simpaticas a un hombre

 homsolo(X):-hombre(X),not(hombresimp(X,_)).                                    % Hombres que no caen simpaticos a nadie

 mujsola(Y):-mujer(Y),not(mujersimp(_,Y)).                                      % Mujeres que no caen simpaticas a nadie 




 % -------------------------------------------------------------------+
 %       TODO LO SIGUIENTE SON REGLAS DE INFERENCIA DEL EJ. Nº2       |
 % -------------------------------------------------------------------+ 

 homsinbar(X):-hombre(X),not(frec(X,_)).                                        % Hombres que no frecuentan ningun bar 

 nobebe(X):-(hombre(X);mujer(X)),not(gusta(X,_)),not(bebedor(X)). 		% Personas que no gustan de ninguna cerveza

 borrachos(X):-bebedor(X),frec(X,Z),sirve(Z,Y),gusta(X,Y).			% Bebedores que frecuentan un bar donde sirven la cerveza que les gusta 

 nosirvecerveza(X,Y):-cerveza(X),not(sirve(Y,X)). 				% Cervezas que no sirve un bar

 barnofrec(X):-bar(X),bebedor(Y),not(frec(Y,X)).				% Bares donde no frecuenta un bebedor



 %--------------------------- OTRAS REGLAS ----------------------------  
 
 mujsinbar(X):-mujer(X),not(frec(X,_)).                                        % Mujeres que no frecuentan ningun bar
 
 cervnograta(X,Y):-cerveza(X),bebedor(Y),not(gusta(Y,X)).                      % Cerveza que no le agrada a un bebedor
 
 barfrec(X):-bar(X),bebedor(Y),frec(Y,X).         		               % Bares frecuentados por bebedores

 bebesinbar(X):-bebedor(X),not(frec(X,_)).				       % Bebedor que no frecuenta ningun bar

 noSirve(X,Y):-bar(X),cerveza(Y),not(sirve(X,Y)).                              % Bares que no sirven cerveza Y
 
 






