% Author:
% Date: 24/06/2008

conc([],L,L).
conc(L,[],L).
conc([X|L],L2,[X|L3]):-conc(L,L2,L3).

%selectionSort()

men([X],X).
men([X|L],Me):- men(L,Me1)
               ,((X<Me1,Me is X)
               ;Me is Me1).
may([X],X).
may([X|L],Ma):-may(L,Ma1)
               ,((X>Ma1,Ma is X)
               ;Ma is Ma1).
               
eliminar(L,X,LE):- conc(L1,[X|L2],L)
                  ,conc(L1,L2,LE).
                  
menorDeL(L,X,LSM):- men(L,X)
                   ,eliminar(L,X,LSM).

%	METODO DE ORDENACION SELECTION SORT                   

selectionSort([X],[X]).
selectionSort(L,LO):- menorDeL(L,Me,LSM)
                     ,selectionSort(LSM,LO1)
                     ,conc([Me],LO1,LO).

menMayLS(L,Me,Ma,LS):- men(L,Me),may(L,Ma)
                       ,eliminar(L,Me,LS1)
                       ,eliminar(LS1,Ma,LS).

%	METODO DE ORDENACION SELECTION SORT MEJORADO

selectionSortM(L,LO):- separador(L,Lme,Lma)
                      ,conc(Lme,Lma,LO).

separador([],[],[]).
separador([X],[X],[]).
separador(L,Lme,Lma):- menMayLS(L,Me,Ma,LS)
                      ,separador(LS,Lme1,Lma1)
                      ,conc([Me],Lme1,Lme)
                      ,conc(Lma1,[Ma],Lma).

%	METODO DE ORDENACION BUBBLE SORT

gt(X,Y):-X>Y.
bubbleSort(L,S):-swap(L,L1),!,
                 bubbleSort(L1,S).
bubbleSort(S,S).

swap([X,Y|R],[Y,X|R]):-gt(X,Y).
swap([Z|R],[Z|R1]):-swap(R,R1).

                      
%	METODO DE ORDENACION INSERTION SORT

insertSort([],[]).
insertSort([X|T],S):-insertSort(T,ST),insert(X,ST,S).
insert(X,[Y|S],[Y|S1]):-gt(X,Y),!,insert(X,S,S1).
insert(X,S,[X|S]).

%	METODO DE ORDENACION quick SORT

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

quicksort([],[]).
quicksort([X|L1],L2):-dividir(X,L1,L3,L4),
			quicksort(L3,L3ord),
			quicksort(L4,L4ord),
			concatenar(L3ord,[X|L4ord],L2).

dividir(X,[],[],[]).
dividir(X,[Y],L3,L4):-( Y>=X , L4 is [Y]) ; (Y<X , L3 is [Y]).
dividir(X,[Y|L],L3,[Y|L4]):-dividir(Y,L3,L4).
