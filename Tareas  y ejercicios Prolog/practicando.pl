frecuencia([],_,0):-!.
frecuencia([Y|L],X,Sum):-X=:=Y, frecuencia(L,X,Sum1),Sum is Sum1+1,!.
frecuencia([_|L],X,Sum):-frecuencia(L,X,Sum),!.

diferentes([]).
diferentes([X|L]):-frecuencia(L,X,A),A=:=0,diferentes(L).