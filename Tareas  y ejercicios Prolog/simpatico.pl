hombre(jorge).
hombre(ruben).
hombre(pedro).
hombre(roberto).
hombre(luis).
hombre(tito).
hombre(carlos).
hombre(estevan).
hombre(miguel).
hombre(sebastian).
hombre(marcos).
hombre(ruben).
hombre(ronald).
hombre(jose).

mujer(ana).
mujer(sandra).
mujer(jimena).
mujer(maria).
mujer(eli).
mujer(juana).
mujer(jeni).
mujer(susi).
mujer(marta).
mujer(julia).
mujer(estela).
mujer(angelica).
mujer(ester).


matri(miguel,marta).
matri(jorge,ana).
matri(luis,juana).
matri(ruben,sandra).
matri(tito,jimena).
matri(roberto,maria).
matri(carlos,jeni).
matri(sebastian,julia).
matri(estevan,angelica).
matri(marcos,ester).

hombreSimp(miguel,marta).
hombreSimp(jorge,ana).
mujerSimp(miguel,marta).
mujerSimp(jorge,ana).

hombreSimp(luis,ana).
hombreSimp(sebastian,sandra).
hombreSimp(pedro,marta).
hombreSimp(pedro,eli).
mujerSimp(luis,ana).
mujerSimp(sebastian,sandra).


pareSimpMutu(X,Y):-matri(X,Y),hombreSimp(X,Y),mujerSimp(X,Y).

simpCasadas(X):-matri(_,Z),hombreSimp(X,Z).

simpNoCasados(X,Y):-not( pareSimpMutu(X,Y) ).

noSimp(X,Y):-not(hombreSimp(X,Y)),not(mujerSimp(X,Y)).

simp2M(X,Y,Z):-hombreSimp(X,Y),hombreSimp(X,Z).

simp3(X,Y,Z):matri(X,Y),preSimpMutu(X,Y),hombreSimp(X,Z).



cerveza(paceña).
 cerveza(ducal).
bar(lito).
bar(aruba).
bebedor(marcos).
bebedor(estevan).
gusta(marcos,paceña).
gusta(estevan,ducal).
sirve(lito,ducal).
sirve(aruba,paceña).
frec(marcos,lito).
frec(estevan,aruba).

nobar(X):-hombre(X),not(frec(_)).

nocerv(X):-not(gusta(X,_)).

befrecbar(X):-bebedor(X),frec(X,W),gusta(Z,X),sirve(W,Z).

nosirvebar(X):-not(sirve(_,X)).

nofrecbar(X):-not(frec(X,_)).
