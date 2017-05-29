 cerveza(pace�a).
 cerveza(ducal).
 cerveza(bock).
 cerveza(pilsener).
 cerveza(corona).
 cerveza(taqui�a). 

 bar(aqua).
 bar(buffalo).
 bar(mad).
 bar(josecuervo).
 bar(tacuarembo).
 bar(baradero).
 bar(juancho).

 sirve(josecuervo,pace�a).
 sirve(josecuervo,bock).
 sirve(baradero,ducal).
 sirve(baradero,corona).
 sirve(mad,pace�a).
 sirve(buffalo,pilsener).

 barnosirve(X,Y):-bar(X),cerveza(Y),not(sirve(X,Y)).

 