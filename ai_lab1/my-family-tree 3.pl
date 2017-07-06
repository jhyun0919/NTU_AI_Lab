%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         facts                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

brother(peter, warren).
brother(jerry,kather).
brother(jerry,stuart).

male(stuart).
male(peter).
male(warren).
male(jerry).

female(kather).
female(ann).
female(maryalice).

sister(kather,jerry).
sister(ann, maryalice).

parent_of(maryalice,jerry).
parent_of(warren,jerry).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      definitions                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parent_of(X,Y) :- 
	sibling(Z,Y), 
	parent_of(X,Z).


sibling(X,Y) :- 
	brother(X,Y); 
	sister(Y,X).


father(X,Y) :- 
	parent_of(X,Y), 
	male(X).
mother(X,Y) :- 
	parent_of(X,Y), 
	female(X).


son(X,Y) :- 
	parent_of(Y,X), 
	male(X).
daughter(X,Y) :- 
	parent_of(Y,X), 
	female(X).


grandfather(X,Y) :- 
	parent_of(Z,Y), 
	parent_of(X,Z), 
	male(X).


cousin(X,Y) :- 
	parent_of(Z,X), 
	(sibling(W,Z); sibling(Z,W)), 
	(son(Y,W); daughter(Y,W)).


aunt(X,Y) :- 
	parent_of(Z,Y), 
	(sibling(Z,X); (sibling(Z,W), spouse(W,X))), 
	female(X).
uncle(X,Y) :- 
	parent_of(Z,Y), 
	(sibling(Z,X); (sibling(Z,W), spouse(W,X))), 
	male(X).


spouse(X,Y) :- 
	parent_of(X,Z), 
	parent_of(Y,Z), 
	X \= Y.




	






