%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         facts                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


male(gwanjae).
male(changmoon).
male(jinsik).
male(changmin).
male(sunghyun).
male(beongsang).
male(beonggyu).
male(jeehyun).
male(donghyun).

female(geumju).
female(choi).
female(sunhui).
female(gyusoon).
female(seol).
female(seon).
female(yesol).
female(songee).


%%%%%%%%%
%family1_parent
%%%%%%%%%

%parent_of(gwanjae, changmoon).
%parent_of(geumju, changmoon).
%parent_of(gwanjae, sunhui).
%parent_of(geumju, sunhui).
parent_of(gwanjae, changmin).
parent_of(geumju, changmin).

%%%%%%%%%
%family2_parent
%%%%%%%%%

%parent_of(changmoon, seol).
%parent_of(choi, seol).
parent_of(changmoon, seon).
parent_of(choi, seon).
%parent_of(changmoon, sunghyun).
%parent_of(choi, sunghyun).

%%%%%%%%%
%family3_parent
%%%%%%%%%

%parent_of(jinsik, beongsang).
%parent_of(sunhui, beongsang).
%parent_of(jinsik, yesol).
%parent_of(sunhui, yesol).
parent_of(jinsik, beonggyu).
parent_of(sunhui, beonggyu).

%%%%%%%%%
%family4_parent
%%%%%%%%%

%parent_of(changmin, jeehyun).
%parent_of(gyusoon, jeehyun).
parent_of(changmin, donghyun).
parent_of(gyusoon, donghyun).
%parent_of(changmin, songee).
%parent_of(gyusoon, songee).



%%%%%%%%%
%family1_brother
%%%%%%%%%

%brother(changmoon, sunhui).
%brother(changmoon, changmin).
brother(changmin, changmoon).
brother(changmin, sunhui).

%%%%%%%%%
%family2_brother
%%%%%%%%%

%brother(sunghyun, seol).
brother(sunghyun, seon).

%%%%%%%%%
%family3_brother
%%%%%%%%%

%brother(beongsang, yesol).
%brother(beongsang, beonggyu).
brother(beonggyu, beongsang).
brother(beonggyu, yesol).

%%%%%%%%%
%family4_brother
%%%%%%%%%

%brother(jeehyun, donghyun).
%brother(jeehyun, songee).
brother(donghyun, jeehyun).
brother(donghyun, songee).



%%%%%%%%%
%family1_sister
%%%%%%%%%

%sister(sunhui, changmoon).
sister(sunhui, changmin).

%%%%%%%%%
%family2_sister
%%%%%%%%%

%sister(seol, seon).
%sister(seol, sunghyun).
sister(seon, seol).
sister(seon, sunghyun).

%%%%%%%%%
%family3_sister
%%%%%%%%%

%sister(yesol, beongsang).
sister(yesol, beonggyu).

%%%%%%%%%
%family4_sister
%%%%%%%%%

%sister(songee, jeehyun).
sister(songee, donghyun).





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      definitions                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parent_of(X, Y):-
	sibling(Z, Y), 
	parent_of(X, Z).



sibling_1(X,Y):-
	brother(X,Y);
	brother(Y,X);
	sister(X,Y);
	sister(Y,X).

sibling_2(X, Y):-
	(parent_of(Z, X), parent_of(Z, Y), (X\=Y));
	(parent_of(Z, X), parent_of(W, Y), (X\=Y), spouse(W,Z)).

sibling(X, Y) :- 
	sibling_1(X,Y);
	sibling_2(X,Y);
	(sibling_1(Z,Y), sibling_2(Z,X), (X\=Y));
	(sibling_1(Z,Y), sibling_1(W,X), sibling_2(Z,W), (Y\=W), (Y\=X)).



father(X, Y) :- 
	parent_of(X, Y),
	male(X).
	
mother(X, Y) :- 
	parent_of(X, Y),
	female(X).



son(X, Y) :- 
	parent_of(Y, X),
	male(X).

daughter(X, Y) :- 
	parent_of(Y, X),
	female(X).



grandfather(X, Y) :- 
	parent_of(Z,Y),
	parent_of(X,Z),
	male(X).

grandmother(X, Y) :- 
	parent_of(Z,Y),
	parent_of(X,Z),
	female(X).



spouse(X, Y) :-
	parent_of(X,Z),
	parent_of(Y,Z),
	(X \= Y).



aunt(X, Y) :- 
	((sibling(Z,X),  parent_of(Z,Y));
	(spouse(W,X), sibling(Z,W), (parent_of(Z,Y)))),
	female(X).

uncle(X, Y) :- 
	((sibling(Z,X),  parent_of(Z,Y));
	(spouse(W,X), sibling(Z,W), (parent_of(Z,Y)))),
	male(X).



cousin(X, Y) :- 
	parent_of(Z,X), 
	(aunt(Z,Y); uncle(Z,Y)).




	






