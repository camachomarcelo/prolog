p(a).
p(b).
p(c).

q(1).
q(2).
q(3).

r(x).
r(y).
r(z).


%EJECUTANDO

t(X,Y,Z):-p(X),q(Y),r(Z).
t(X,Y,Z):-p(Z),q(Y),r(Z).
t(X,Y,Z):-r(Z),q(Y),p(Z).
t(X,Y,Z):-p(X),q(Y),!,r(Z).
t(X,Y,Z):-r(X),q(r),p(Z).
