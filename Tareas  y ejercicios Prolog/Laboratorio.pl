%%
%%	Declaraciones de HECHOS
%%
%  Hombre(X):  Persona hombre.
hombre(jose).
hombre(jorge).
hombre(jaime).
hombre(raul).
hombre(cesar).
hombre(ruben).

%  Mujer(X):  Persona mujer.
mujer(maria).
mujer(soledad).
mujer(ana).
mujer(ely).
mujer(gloria).
mujer(lucia).

%  Matri:  El hombre X esta casado con la mujer Y.
matr(jose,maria).
matr(jorge,soledad).
matr(jaime,ana).

%  HombreSimp(X,Y):  El hombre X cae simpatico a la mujer Y.
hombresimp(jose,maria).
hombresimp(jorge,soledad).
hombresimp(jaime,ana).
hombresimp(ruben,lucia).
hombresimp(cesar,ana).
hombresimp(cesar,soledad).
hombresimp(cesar,ely).
hombresimp(cesar,gloria).

%  MujerSimp(X,Y):   La mujer Y cae simpatica al hombre X.
mujersimp(jose,maria).
mujersimp(raul,maria).
mujersimp(jaime,ana).
mujersimp(cesar,soledad).
mujersimp(cesar,ely).


%%
%%	Declaraciones de REGLAS(PREDICADOS)
%%

%  Soltera(X):	La mujer X es soltera, no esta casada.
soltera(X):-mujer(X),not(matr(_,X)).

%  Soltero(X):	La hombre X es soltero, no esta casado.
soltero(X):-hombre(X),not(matr(X,_)).

%  MatrSimp(X,Y):   El matrimonmio X, Y se caen simpaticos mutuamente.
matrisimp(X,Y):-hombresimp(X,Y),mujersimp(X,Y),matr(X,Y).

%  HombreSimpCasadas(X):   El hombre X que le cae simpatico a mujeres casadas.
hombresimpcasadas(X):-hombresimp(X,Y),matr(_,Y).