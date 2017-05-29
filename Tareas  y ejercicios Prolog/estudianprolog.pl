hombre(jose).
hombre(jaime).
hombre(cesar).
hombre(carlos).
hombre(jhon).

mujer(maria).
mujer(ines).
mujer(ely).
mujer(carla).
mujer(ana).
mujer(mayra).

matrimonio(jose,maria).
matrimonio(jaime,ely).
matrimonio(cesar,carla).
matrimonio(carlos,mayra).

madre(maria,jaime).
madre(ely,carlos).
madre(maria,ines).
madre(ely,carla).
madre(carla,ana).
madre(mayra,jhon).

%%HECHOS:	Enunciados que son verdaderos.
%%REGLAS:	Son enunciados que pueden ser verdaderos o falsos.
%%		Las reglas se construyen a base de hechos y/o otras reglas


%%	////////////////////////////////////////////////////
%%	//     ...Palabras reservadas de prolog...	  //					
%%	//						  //
%%	//	hombre(X)	:Quienes son los hombres  //
%%	//                                                //   
%%	//	(_)		:Existe                   //
%%	//                                                //   
%%	//	,		:and                      //
%%	//                                                //   
%%	//	;		:or                       //  
%%	//                                                //   
%%	//	:-		:Si                       //
%%	//                                                //
%%	//                                                //   
%%	////////////////////////////////////////////////////


%%%%padre%%%%%%
padre(X,Y):-madre(Z,Y),matrimonio(X,Z).

%%%%%persona%%%%%
persona(X):-hombre(X);mujer(X).

%%%%%hermano%%%%
hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y),X\==Y.

%%%%%hermana%%%%
hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y),X\==Y.


%%%%hermanos%%%
hermanos(X,Y):-hermano(X,Y);hermana(X,Y).

%%%%hijounico%%
hijounico(X):-not(hermano(X,_)).

%%%%hijaunica%%
hijaunica(X):-not(hermana(X,_)).

%%%matrihijounico%%%%
matrihijounico(X,Y):-matrimonio(X,Y),madre(Y,Z),not(hermanos(Z,_)).

%%%tio%%%
tio(X,Y):-hombre(X),(madre(Z,Y),hermanos(Z,X);
                     padre(Z,Y),hermanos(Z,X)).

%%%tia%%%
tia(X,Y):-mujer(X),(madre(Z,Y),hermanos(Z,X);
                    padre(Z,Y),hermanos(Z,X)).

%%%tios%%%
tios(X,Y):-tio(X,Y),tia(X,Y).

%%%sobrino%%
sobrino(X,Y) :- hombre(X),(tio(Y,X) ; tia(Y,X)).

%%%sobrina%%
sobrina(X,Y) :- mujer(X),(tio(Y,X) ; tia(Y,X)).

%%%yerno%%%
yerno(X,Y):-(suegra(Y,X);suegro(Y,X)),hombre(X).

%%%yerna%%%
yerna(X,Y):-(suegra(Y,X);suegro(Y,X)),mujer(X).

%%%suegra%%%%
suegra(X,Y):-matrimonio(Y,Z),madre(X,Z);
             matrimonio(Z,Y),madre(X,Z).

%%%suegro%%
suegro(X,Y):-suegra(Z,Y),matrimonio(X,Z).

%%%primo%%%
%%primo(X,Y):- hombre(X),tio(Z,Y),padre(Z,X);
          %%   hombre(X),tia(Z,Y),madre(Z,X).
primo(X,Y):-hombre(X),tios(Z,X),(madre(Z,Y);padre(Z,Y)).
%%%prima%%%
prima(X,Y):- mujer(X),tio(Z,Y),padre(Z,X);
             mujer(X),tia(Z,Y),madre(Z,X).

%%%primos%%%
primos(X,Y):-primo(X,Y);prima(X,Y).

%%%primoshermanos%%
primoshermanos(X,Y):-abuela(Z,X),abuela(Z,Y).

%%%primashermanas%%
primashermanas(X,Y):-abuelo(Z,X),abuelo(Z,Y).

%%%abuela%%
abuela(X,Y):-madre(X,Z),(padre(Z,Y);madre(Z,Y)).

%%%abuelo%%
abuelo(X,Y):-padre(X,Z),(padre(Z,Y);madre(Z,Y)).

%%abuelos%%
abuelos:-abuela(X,Y);abuelo(X,Y).

%%%bisabuelo%%
bisabuelo(X,Y) :- padre(X,Z) , (abuelo(Z,Y) ; abuela(Z,Y)).

%%%bisabuela%%
bisabuela(X,Y) :- madre(X,Z) , (abuelo(Z,Y) ; abuela(Z,Y)).

%%%cuñados%%
cuñados(X,Y):-matrimonio(X,Z),hermanos(Y,Z);matrimonio(Z,X),hermanos(Y,Z).
cuñado(X,Y):-cuñados(X,Y),hombre(X).
cuñada(X,Y):-cuñados(X,Y),mujer(X).

%%%tiobuelo%%
tioabuelo(X,Y):- abuela(Z,Y) , ( hermano(X,Z) ; cuñado(X,Z) 
                 ; primoshermanos(X,Z)).

%%%tiabuela%%
tiaabuela(X,Y):- abuela(Z,Y) , ( hermana(X,Z) ; cuñada(X,Z) 
                ; primoshermanos(X,Z)).

%%%nuera%%%
nuera(X,Y):-(suegra(Y,X);suegro(Y,X)),mujer(X).

%%%bisnieto%%%
bisnieto(X,Y) :- hombre(X) , ( bisabuelo(Y,X) ; bisabuela(Y,X) ).

%%%bisnieta%%%
bisnieta(X,Y) :- mujer(X) , ( bisabuelo(Y,X) ; bisabuela(Y,X) ).

%%tiopolitico%%
tiopolitico(X,Y):-matrimonio(X,Z),tia(Z,Y).

%%tiapolitica%%
tiapolitica(X,Y):-matrimonio(Z,X),tio(Z,Y).

%%pariente%
des(X,Y):-madre(Y,X);padre(Y,X).
des(X,Y):-madre(Z,X),des(Z,Y);padre(Z,X),des(Z,Y).

pariente(X,Y):-des(X,Z),des(Y,Z).

%%ajenos%%%






