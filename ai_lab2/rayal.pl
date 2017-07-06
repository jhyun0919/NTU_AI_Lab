queen(elizabeth).
prince(charles).
prince(andrew).
prince(edward).
princess(ann).

son(charles, elizabeth, 1).
daughter(ann, elizabeth, 2).
son(andrew, elizabeth, 3).
son(edward, elizabeth, 4).

old_succession(X):-
	queen(X);
	queen(Y), 
	(son(X, Y, Z); daughter(X, Y, Z)),
	((Z=1);(Z=2);(Z=3);(Z=4)).

new_succesion(X):-
	queen(X);
	queen(Y),
	((Z=1);(Z=2);(Z=3);(Z=4)),
	(son(X, Y, Z); daughter(X, Y, Z)).

