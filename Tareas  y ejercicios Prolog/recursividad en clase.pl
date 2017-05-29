suma(N,Sum):-sumaR(N,1,Sum).
sumaR(N,I,0):-I>N,!.
sumaR(N,I,Sum):-I1 is I+1,
                sumaR(N,I1,Sum1),
                Sum is Sum1 + I.


sumaDiv(N,Sum):-suDivR(N,1,Sum).

suDivR(N,I,0):-I>N,!.

suDivR(N,I,Sum):-N mod I =:= 0,
                 I1 is I+1,
                 suDivR(N,I1,Sum1),
                 Sum is Sum1 + I,!.

suDivR(N,I,Sum):-I1 is I+1,
                 suDivR(N,I1,Sum).

                 