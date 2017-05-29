hombre(pepe).
hombre(juan).
hombre(jose).
hombre(arnold).
hombre(pedro).
hombre(raul).
hombre(mario).
hombre(ronald).
hombre(jorge).
hombre(pablo).

mujer(lucia).
mujer(ana).
mujer(maria).
mujer(jessica).
mujer(susy).
mujer(angelica).
mujer(tania).
mujer(alejandra).
mujer(fabiana).
mujer(renata).

cerveza(paceña).
cerveza(ducal).
cerveza(duff).
cerveza(taquiña).
cerveza(huari).
cerveza(wisky).
cerveza(corona).

bar(mou).
bar(caballito).
bar(nave).
bar(pescadito).
bar(quijote).
bar(flow).
bar(american).

bebedor(pepe).
bebedor(juan).
bebedor(jose).
bebedor(arnold).
bebedor(pedro).
bebedor(mario).
bebedor(ana).
bebedor(lucia).
bebedor(susy).
bebedor(angelica).
bebedor(alejandra).
bebedor(fabiana).

gusta(pepe,paceña).
gusta(juan,ducal).
gusta(jose,duff).
gusta(arnold,taquiña).
gusta(pedro,duff).
gusta(mario,huari).
gusta(ana,wisky).
gusta(lucia,corona).
gusta(susy,huari).
gusta(angelica,corona).
gusta(alejandra,ducal).
gusta(fabiana,paceña).

sirve(mou,duff).
sirve(mou,paceña).
sirve(caballito,paceña).
sirve(caballito,ducal).
sirve(nave,paceña).
sirve(nave,taquiña).
sirve(pescadito,huari).
sirve(pescadito,wisky).
sirve(quijote,taquiña).
sirve(quijote,paceña).
sirve(flow,paceña).
sirve(flow,huari).
sirve(american,wisky).
sirve(american,corona).

frec(pepe,mou).
frec(pepe,caballito).
frec(juan,caballito).
frec(jose,nave).
frec(arnold,pescadito).
frec(pedro,quijote).
frec(mario,flow).
frec(ana,american).
frec(lucia,flow).
frec(susy,mou).
frec(angelica,quijote).
frec(alejandra,nave).
frec(fabiana,mou).

persona(X):- hombre(X) ; mujer(X).

hombrenofrecuentabar(X):- hombre(X), not(frec(X,Z)).

personanobebedora(X):- persona(X), not(gusta(X,Y)).

bebedorfrecuentabar(X,Y):- persona(X), bar(Y), 
				frec(X,Y), sirve(Y,Z), gusta(X,Z).

cervezanosirvebar(X,Y):- bar(X), cerveza(Y), not(sirve(X,Y)).

nofrec(X,Y):- bebedor(X), bar(Y), not(frec(X,Y)).

barsirvecervezagusta(X,Z):- bebedor(X), bar(Z), 
				gusta(X,Y), sirve(Z,Y).

frecsirvesucerveza(X,Z):- bebedor(X), cerveza(Z) 
		            ,frec(X,Y), sirve(Y,Z).

