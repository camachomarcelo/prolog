promediodos(N1,N2,NF):-NF is (N1+N2)/2.
promedio(N1,N2,N3,NF):-NF is (N1+N2+N3)/3.

menor(A,B,C,D):-A<B,A<C,D is A,!.
menor(A,B,C,D):-B<A,B<C,D is B,!.
menor(A,B,C,D):- C,!.
mejorpromedio(A,B,C,D):-menor(A,B,C,Me),D is ((A+B+C)-Me)/2.  

repite(A,B,C,D):-A =:= B,B =:= C,D is A,!.
repite(A,B,C,D):-A =:= B,B =:= C,D is A,!.
pmodal(A,B,C,D):-