cantidad([],0).
cantidad([_|L1],Q):-cantidad(L1,Q1),
 		    Q is Q1+1.

ultimo([X],X).
ultimo([_|L1],X):-ultimo(L1,X).

mayor2(X, Y, X) :- X > Y.
mayor2(X, Y, Y) :- Y > X.

mayor([X],X).
mayor([X|L1],My):-mayor(L1,My1),
		  mayor2(My1,X,My).

igual(X,X).
iguales([X,Y]):-igual(X,Y),!.
iguales([X|L1]):-iguales(L1).
        
                
                
		   
                   

