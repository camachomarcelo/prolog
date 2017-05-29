hombre(david).
hombre(alex).
hombre(felix).
hombre(daniel).
hombre(dorian).
hombre(miguel).
hombre(cesar).
hombre(jose).
hombre(jesus).
hombre(juan).

mujer(nelsy).
mujer(lidia).
mujer(doly).
mujer(miriam).
mujer(jael).
mujer(maria).
mujer(daniela).
mujer(maira).
mujer(dayana).
mujer(ana).
mujer(felicidad).

flota(bolivar).
flota(yunguenia).
flota(unificado).
flota(copacabana).
flota(bolivia).
flota(emperador).

ciudad(santacruz).
ciudad(sucre).
ciudad(lapaz).
ciudad(cochabamba).
ciudad(oruro).
ciudad(tarija).
ciudad(trinidad).
ciudad(potosi).
ciudad(cobija).

pasajero(nelsy).
pasajero(lidia).
pasajero(miriam).
pasajero(daniela).
pasajero(david).
pasajero(alex).
pasajero(felix).
pasajero(daniel).
pasajero(dorian).
pasajero(miguel).
pasajero(cesar).
pasajero(jose).
pasajero(felicidad).
pasajero(dayana).
pasajero(doly).
pasajero(jael).
pasajero(ana).



viaja(nelsy,lapaz).
viaja(lidia,cobija).
viaja(miriam,cochabamba).
viaja(daniela,cochabamba).
viaja(david,lapaz).
viaja(alex,oruro).
viaja(felix,tarija).
viaja(daniel,oruro).
viaja(dorian,oruro).
viaja(miguel,potosi).
viaja(cesar,trinidad).
viaja(jose,sucre).

viaja(dayana,trinidad).
viaja(doly,lapaz).
viaja(jael,trinidad).



sale(bolivar,lapaz).
sale(bolivar,cochabamba).
sale(bolivar,oruro).
sale(bolivar,tarija).
sale(bolivar,trinidad).
sale(bolivar,potosi).	
sale(yunguenia,lapaz).
sale(yunguenia,cochabamba).
sale(yunguenia,trinidad).
sale(yunguenia,oruro).
sale(unificado,lapaz).
sale(unificado,lapaz).
sale(unificado,lapaz).
sale(copacabana,cochabamba).
sale(copacabana,lapaz).
sale(bolivia,tarija).
sale(emperador,potosi).
sale(emperador,sucre).
sale(emperador,cochabamba).

noviaja(X,Y):-not(viaja(X,Y)).
%quienviajaa(X,Y):-sale(Z,Y),viaja(X,Y).
%quienesnoviajana(X,Z):-not(viaja(X,Z)).
%quepasajeroslleva(X,Y):-flota(X),viaja(Y,X).
%quienesviajanciertaflotay
%%quienes(X,Y):-viaja(X,Z),sale(Y,H).






		



