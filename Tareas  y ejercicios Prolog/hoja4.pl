%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 1:
% Definir la relación
%       elementos_pares(L1,L2)
% de forma que si L1 es una lista de números, entonces L2 es la lista
% de los elementos pares de L1. Por ejemplo,
%    ?- elementos_pares([1,2,4,3,5],L).
%       L = [2,4] ;
%       No
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elementos_pares([],[]).
elementos_pares([X|L1],[X|L2]):-
	0 =:= X mod 2,
	elementos_pares(L1,L2),!.
elementos_pares([_|L1],L2):-
	elementos_pares(L1,L2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 2:
% Definir el predicado suma_hasta(N,S) que tome como entrada un n\'umero
% natural mayor o igual que uno y devuelva la suma de todos los n\'umeros
% naturales de 1 a N. Ejemplo de uso:
%
%   ?- suma_hasta(4,S).
%      S = 6 ;
%      No
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

suma_hasta(1,1).
suma_hasta(N,S):-
	N > 1,
	N1 is N-1,
	suma_hasta(N1,S1),
	S is S1+N.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 3: [Bratko-86, p.162] Definir el predicado simplifica(+E1,-E2)
% donde E2 es la expresión obtenida simplificando las sumas de los números que 
% aparecen en E1  (que es una suma de números y átomos). Por ejemplo,
%     ?- simplifica(1+a+2.5,X).
%     X = a+3.5
%     Yes
%     
%     ?- simplifica(1+a+4+2+b+c,X).
%     X = a+b+c+7 
%     Yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

simplifica(E1,E2):-
	Numeros is 0,
	Atomos is 0,
	separa(E1,Atomos,Numeros),
	junta(E2, Atomos,Numeros).


separa(X,X,0):-
	atom(X),!.
separa(X,0,X):-
	number(X),!.
separa(X+E,X+A,N):-
	atom(X),
	separa(E,A,N),!.
separa(X+E,A,N):-
	number(X),
	separa(E,A,N1),
	N is X+N1,!.

junta(A,A,0):-!.
junta(N,0,N):-!.
junta(A+N,A,N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ejercicio 4: Definir un predicado 
%     n_derecha(+L,+N,?X)
% que se verifique si X es el elemento situado en la N-ésima posición,
% empezando a contar por la derecha, de la lista L. Por ejemplo, 
%     ?- n_derecha([a,b,c,d,e],4,X).
%     X = b ;
%     No
%     ?- n_derecha([a,b,c,d,e],15,X).
%     No
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_derecha(L,N,X):-
	append(_,[X|L2],L),
	length([X|L2],N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Un \'arbol binario es vac\'io o consta de tres partes:                    
%  * Una raiz                                                           
%  * Un sub\'arbol izquierdo (que debe ser un \'arbol binario)              
%  * Un sub\'arbol derecho (que debe ser un \'arbol binario)                
%                                                                       
% Consideraremos la siguiente representaci\'on                            
% * nil representa el \'arbol vac\'io                                       
% * Si el \'arbol no es vac\'io, entonces tendr\'a la forma t(I,R,D) donde    
%   R es la raiz, I el sub\'arbol izquierdo y D el sub\'arbol derecho.      
%                                                                       
%  EJEMPLO: El \'arbol                                                    
%                                   a                                   
%                                /    \                                 
%                               b      c                                
%                                     /                                 
%                                    d                                  
%                                                                       
% Lo representamos como t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil))         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Ejercicio 5: Definir el predicado                                     
%      arbolbinario(A)                                
% que se verifique ni A es un \'arbol binario. Por ejemplo,
%      ?- arbolbinario(nil).                                                
%      Yes                                                                  
%      ?- arbolbinario(t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil))).            
%      Yes                                                                  
%      ?- arbolbinario(t(t(nil,b,nil),a,t(t(nil,d,e),c,nil))).              
%      No                                                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

arbolbinario(nil).
arbolbinario(t(I,R,D)):-
	atom(R),
	arbolbinario(I),
	arbolbinario(D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Ejercicio 6: Definir el predicado
%      en(Nodo,Arbol)
% que se verifique si Nodo es un nodo del \'arbol binario Arbol. Por 
% ejemplo                                                            
%      ?- en(Nodo,t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil))).                
%          Nodo = a ;                                                       
%          Nodo = b ;                                                       
%          Nodo = c ;                                                       
%          Nodo = d ;                                                       
%          No                                                               
%      ?- en(b,t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil))).                   
%          Yes                                                              
%      ?- en(f,t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil))).                   
%          No                                                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

en(Nodo,t(I,Nodo,D)):-
	arbolbinario(I),
	arbolbinario(D).
en(Nodo,t(I,_,_)):-
	en(Nodo,I).
en(Nodo,t(_,_,D)):-
	en(Nodo,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Ejercicio 7: Definir el predicado                                     
%      profundidad(Arbol,Prof)                           
% que se verifique si Prof es la profundidad nodo del \'arbol binario       
% Arbol. Consideraremos que la profundidad del \'arbol vacio es 0 y la    
% del \'arbol con un \'unico nodo es 1. Por ejemplo,
%      ?- prof(nil,Prof).                                                  
%          Prof = 0 ;                                                       
%          No                                                               
%      ?- prof(t(nil,a,nil),Prof).                                         
%          Prof = 1 ;                                                       
%          No                                                               
%      ?- prof(t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil)),Prof).              
%          Prof = 3 ;                                                       
%          No                                                               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

prof(nil,0).
prof(t(I,_,D),N):-
	prof(I,N1),
	prof(D,N2),
	maximo(N1,N2,M),
	N is M+1.

maximo(N1,N2,N1):-
	N1 > N2, !.
maximo(_,N2,N2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Ejercicio 8: Definir el predicado
%      alinea(Arbol,Lista)
% que se verifique si Lista es la lista de los nodos del Arbol. Por 
% ejemplo,             
%      ?- alinea(nil,L).                                                   
%          L = [] ;                                                         
%          No                                                               
%      ?- alinea(t(nil,a,nil),L).                                          
%          L = [a] ;                                                        
%          No                                                               
%      ?- alinea(t(t(nil,b,nil),a,t(t(nil,d,nil),c,nil)),L).               
%          L = [b, a, d, c] ;                                               
%          No                                                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

alinea(A,L):-
	bagof(_Nodo,en(_Nodo,A),L).

















