tabla(N):-tablai(N,1).
tablai(N,I):-I>N,!.
tablai(N,I):-tablaj(N,I,1),I1 is I+1, tablai(N,I1).
tablaj(N,_,J):-J>N,!.
tablaj(N,I,J):-mostrar(I,J),J1 is J+1, tablaj(N,I,J1).
mostrar(I,J):-write(I),write('*'),write(J),write('='),P is I*J,write(P),nl.
