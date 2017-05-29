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
 bar(juancho).

 sirve(josecuervo,paceña).
 sirve(josecuervo,bock).
 sirve(baradero,ducal).
 sirve(baradero,corona).
 sirve(mad,paceña).
 sirve(buffalo,pilsener).

 barnosirve(X,Y):-bar(X),cerveza(Y),not(sirve(X,Y)).

 