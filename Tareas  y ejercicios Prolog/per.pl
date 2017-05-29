% Author:
% Date: 11/04/2008
comenzar:-write('Ingresar un valor de N = '),
          read(N),perfecto(N).
        %  sumaEnteros(N).


perfecto(N):-perfecto(N,1,0).
perfecto(N,I,Sum):-(I>N\\2),(Sum=:=N),!.
perfecto(N,I,Sum):-(N mod I=:=0),
                    Sum1 is (Sum +I),
                    I1 is (I+1),
                   perfecto(N,I1,Sum1).
perfecto(N,I,Sum):-I1 is (I+1),perfecto(N,I1,Sum).

sumaEnteros(N):-sumaEnteros(N,1,0).
sumaEnteros(N,I,Sum):-I>N, write(Sum),!.
sumaEnteros(N,I,Sum):-Sum1 is Sum +I,
                      I1 is I+1,
                      sumaEnteros(N,I1,Sum1).


                 
