
hombre(homero).
hombre(bart).
hombre(abraham).

mujer(marge).
mujer(lisa).
mujer(mona).

madre(marge,lisa).
madre(marge,bart).
madre(mona,homero).

padre(homero,bart).
padre(homero,lisa).
padre(abraham,homero).


abuela(X,Y):- madre(Z,Y), madre(X,Z); 
		padre(Z,Y), madre(X,Z).

descS(X,Y):-madre(Y,X); padre(Y,X),not(abuela(X,_)).

sinHijos(X):-mujer(X),not(madre(X,_)).
