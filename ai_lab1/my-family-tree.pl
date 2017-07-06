%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         facts                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


male(gwanjae).
male(jinsik).
male(changmin).
male(beongsang).
male(beonggyu).
male(jeehyun).
male(donghyun).

female(geumju).
female(sunhui).
female(gyusoon).
female(yesol).
female(songee).

brother(changmin, sunhui).
brother(beonggyu, beongsang).
%brother(beonggyu, yesol).
brother(donghyun, jeehyun).
%brother(donghyun, songee).

sister(sunhui, changmin).
sister(yesol, beonggyu).
sister(songee, donghyun).

parent_of(gwanjae, changmin).
parent_of(geumju, changmin).
parent_of(jinsik, beonggyu).
parent_of(sunhui, beonggyu).
parent_of(changmin, donghyun).
parent_of(gyusoon, donghyun).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      definitions                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parent_of(X,Y) :- sibling(Z,Y),	parent_of(X,Z).

sibling(X,Y) :- brother(X,Y); sister(Y,X).

father(X,Y) :- parent_of(X,Y), male(X).
mother(X,Y) :- parent_of(X,Y), female(X).

son(X,Y) :- parent_of(Y,X), male(X).
daughter(X,Y) :- parent_of(Y,X), female(X).

grandfather(X,Y) :- parent_of(Z,Y), parent_of(X,Z), male(X).

cousin(X,Y) :- parent_of(Z,X), (sibling(W,Z); sibling(Z,W)), parent_of(W,Y).

aunt(X,Y) :- cousin(Y,W), mother(X,W).
uncle(X,Y) :- cousin(Y,W), father(X,W).

spouse(X,Y) :- parent_of(X,Z), parent_of(Y,Z), X \= Y.




	






