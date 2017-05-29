% Author:
% Date: 03/06/2008
insertarUlt([],X,[X]).
insertarUlt([Y|L1],X,[Y|L2]):-insertarUlt(L1,X,L2).

insertarLugar([],X,[X]).
insertarLugar([Y|L1],X,[X,Y|L1]):-X<=Y,!.
insertarLugar([Y|L1],X,[Y|L2]):-insertarLugar(L1,X,L2).

intercalar(L1,[],L1).
intercalar([],L1,L1).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

insertarIesimo(L1,X,P,[X|L1]):-(P-1)=:=0.
insertarIesimo([Y|L1],X,P,[Y|L2]):-insertarIesimo(L1,X,P-1,L2).

eliminarIesimo([X|L1],P,L1):-(P-1)=:=0.
eliminarIesimo([X|L1],P,[X|L2]):-eliminarIesimo(L1,P-1,L2).








