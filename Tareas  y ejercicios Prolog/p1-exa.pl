comenzarA:-write('introducir el peso maximo de la mochila:'),
           read(Max),
           nl,
           write('peso del objeto1 = '),
           read(P1),
           nl,
           write('peso del objeto2 = '),
           read(P2),
           nl,
           write('peso del objeto3 = '),
           read(P3),
           nl,
           transportar(Max,P1,P2,P3).

transportar(Max,P1,P2,P3):-P1=<Max,write(P1),nl,
                           P2=<Max,write(P2),nl,
                           P3=<Max,write(P3),nl,transportar1(Max,P1,P2,P3);!.

transportar1(Max,P1,P2,P3):-(P1+P2)=<Max,write(P1),write(','),write(P2),nl,
                           (P1+P3)=<Max,write(P1),write(','),write(P3),nl,
                           (P2+P3)=<Max,write(P2),write(','),write(P3),nl,transportar2(Max,P1,P2,P3);!.
transportar2(Max,P1,P2,P3):-(P1+P2+P3)=<Max,
                            write(P1),write(','),write(P2),write(P3),nl;!.
                            
comenzarB:-write('introducir el peso maximo de la mochila:'),
           read(Max),
           nl,
           write('peso del objeto1 = '),
           read(P1),
           nl,
           write('peso del objeto2 = '),
           read(P2),
           nl,
           write('peso del objeto3 = '),
           read(P3),
           nl,
           transportar(Max,P1,P2,P3),
		write('mejor peso'), nl,
	   mejorPeso(Max,P1,P2,P3,Mp).



mejorPeso(Max,P1,P2,P3,Mp):- (P1+P2+P3)=<Max,
                              Mp is P1+P2+P3,write('mejor peso = '),write(Mp),!.
mejorPeso(Max,P1,P2,P3,Mp):- S1 is P1+P2,
                             S2 is P2+P3,
                             S3 is P1+P3,
                             ((S1=<Max,mayor(S1,S2,S3,S1),Mp is S1);
                              (S2=<Max,mayor(S1,S2,S3,S2),Mp is S2);
                              (S3=<Max,mayor(S1,S2,S3,S3),Mp is S3)),write('mejor peso = '),write(Mp),!.
mejorPeso(Max,P1,P2,P3,Mp):- mayor(S1,S2,S3,Mp),Mp=<Max,write('mejor peso = '),write(Mp),!.


%auxiliares
sum(A,B,C,S)e s   L o p e z   S o l i z  M a r i n e s   L o p e z   S o l i z                                                                                                                                                                                                                                                                                                  