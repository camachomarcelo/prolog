% Author: Marines Lopez Soliz
% Date: 06/06/2008
concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

seEncuentra(L1,X):-concatenar(_,[X|_],L1).
insertarUlt(L1,X,L2):-concatenar(L1,[X],L2).

eliminarUlt(L1,L2):-concatenar(L2,[_],L1).

extremosIguales(L1):-concatenar([X|_],[X],L1).


