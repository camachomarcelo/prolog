hombre(gerardo).
hombre(teofilo).
hombre(orlando).
hombre(lalo).
hombre(kevin).
hombre(grover).
hombre(tito).
hombre(robert).
hombre(beto).
hombre(jaime).
hombre(yhony).
hombre(paul).
hombre(fernando).
hombre(lucas).
hombre(diego).
hombre(braian).
hombre(alvaro).
hombre(ariel).
hombre(buby).
hombre(andres).
hombre(macgiber).

mujer(kintina).
mujer(angela).
mujer(marlene).
mujer(consuelo).
mujer(aide).
mujer(natalia).
mujer(yola).
mujer(mirian).
mujer(alejandra).
mujer(kity).
mujer(araceli).
mujer(adriana).
mujer(daniela).
mujer(valeria).
mujer(camila).
mujer(mariela).
mujer(marioly).
mujer(mariajose).
mujer(alison).
mujer(carlita).
mujer(tiburcia).
mujer(brijida).


cerveza(bock).
cerveza(paceña).
cerveza(ducal).
cerveza(huari).
cerveza(corona).

bart(moe).
bart(elnomo).
bart(mosquito).
bart(ovejanegra).
bart(jj).

bebedor(kintina).
bebedor(angela).
bebedor(marlene).
bebedor(consuelo).
bebedor(fernando).
bebedor(lucas).
bebedor(diego).
bebedor(braian).

gusta(kity,paceña).
gusta(araceli,paceña).
gusta(angela,corona).
gusta(lucas,huari).
gusta(diego,ducal).
gusta(teofilo,bock).

sirve(moe,paceña).
sirve(jj,bock).
sirve(mosquito,corona).
sirve(elnomo,ducal).
sirve(ovejanegra,huari).

frec(angel,moe).
frec(diego,elnomo).
frec(lucas,jj).

hombnobebe(X):-hombre(X),not(Frec(X)).
nogusta(X):-(hombre(X);mujer(X)),not(gusta(X,Y));