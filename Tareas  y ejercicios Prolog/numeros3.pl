menor(A, B, Me):-A<B,Me is A,!.

menor(A,B,B).

menor(A, B, C, Me):-menor(A,B,T1),
		    menor(T1,C,Me).

menor(A, B, C, D, Me):-menor(A,B,C,T1),
		      menor(T1,D,Me).

menor(A, B, C, D, E, Me):-menor(A,B,C,D,T1),
			 menor(T1,E,Me).



mayor(A, B, My):- A>B, My is A,!.
mayor(A, B, B).

mayor(A, B, C, My):- mayor(A , B, T1),
		     mayor(T1, C, My).

mayor(A, B, C, D, My):- mayor(A , B, C, T1),
		        mayor(T1, D, My).

mayor(A, B, C, D, E, My):-mayor(A , B, C, D, T1),
		          mayor(T1, E, My).









segMayor(A, B, C, ME) :- mayor(A, B, C, A), mayor(B, C, ME).


segMayor(A, B, C, ME) :- mayor(A, B, C, B), mayor(A, C, ME).

segMayor(_, _, C, C).































segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, A), mayor(B, C, D, ME).
segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, B), mayor(A, C, D, ME).
segMayor(A, B, C, D, ME) :- mayor(A, B, C, D, C), mayor(A, B, D, ME).
segMayor(_, _, _, D, D).

segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, A), mayor(B, C, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, B), mayor(A, C, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, C), mayor(A, B, D, E, ME).
segMayor(A, B, C, D, E, ME) :- mayor(A, B, C, D, E, D), mayor(A, B, C, E, ME).
segMayor(_, _, _, _, E, E).























segMenor(A, B, C, ME) :- segMayor(A, B, C, ME).

segMenor(A, B, C, D, ME) :- menor(A, B, C, D, A), menor(B, C, D, ME).
segMenor(A, B, C, D, ME) :- menor(A, B, C, D, B), menor(A, C, D, ME).
segMenor(A, B, C, D, ME) :- menor(A, B, C, D, C), menor(A, B, D, ME).
segMenor(_, _, _, D, D).

segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, A), menor(B, C, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, B), menor(A, C, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, C), menor(A, B, D, E, ME).
segMenor(A, B, C, D, E, ME) :- menor(A, B, C, D, E, D), menor(A, B, C, E, ME).
segMenor(_, _, _, _, E, E).