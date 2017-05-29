seencuentra(N,Dig):-N<10,!,N=:=Dig.
seencuentra(N,Dig):-(N mod 10)=:=Dig,!.
seencuentra(N,Dig):-seencuentra(N//10,Dig).

seEncuentra([X|_],Dig):-X=:=Dig,!.
seEncuentra([_|L],Dig):-seEncuentra(L,Dig).

iguales([X|L]):-iguales(L,X).
iguales([X|_],Y):-X=:=Y,!.
iguales([_|L],Y):-iguales(L,Y).

existePar([X|_]):-X mod 2=:=0,!.
existePar([_|L]):-existePar(L).


secuenciaParImpar([X,Y|_]):-X mod 2 =:= 0, Y mod 2 =\=0,!.
secuenciaParImpar([_|[_|L]]):-write(L),nl, secuenciaParImpar(L).

ordenadoAsc([_]):-!.
ordenadoAsc([X,Y|L]):- X =< Y,ordenadoAsc([Y|L]).
ordenadoDes([_]):-!.
ordenadoDes([X,Y|L]):-X>=Y,ordenadoDes([Y|L]).
ordenado([Y|L]):-ordenadoDes([Y|L]),!;ordenadoAsc([Y|L]),!.

insertarPrimero([],X,[X]):-!.
insertarPrimero([Y|L1],X,[X,Y|L1]):-!.

insertarUltimo([],X,[X]):-!.
insertarUltimo([Y|L1],X,[Y|L2]):-insertarUltimo(L1,X,L2).

insertarLugar([],X,[X]):-!.
insertarLugar([Y|L1],X,[X,Y|L1]):-X<Y,!.
insertarLugar([Y|L1],X,[Y|L2]):-insertarLugar(L1,X,L2).


