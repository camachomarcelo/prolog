escalera(A,B,C,D,E):-Sum is (A+B+C+D+E)/5,menor(A,B,C,D,E,Me),Sum is Me+2.
menor(A,B,Me):-A<B,Me is A,!.
menor(A,B,Me):-Me is B.

menor(A,B,C,Me):-menor(A,B,Me1),menor(Me1,C,Me).
menor(A,B,C,D,Me):-menor(A,B,C,Me1),menor(Me1,D,Me).
menor(A,B,C,D,E,Me):-menor(A,B,C,D,Me1),menor(Me1,E,Me).