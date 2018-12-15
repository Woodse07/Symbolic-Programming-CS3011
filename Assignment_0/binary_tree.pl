memberOfTree(X, tree(X, Left, Right)).

memberOfTree(X, tree(_, Left, Right)) :-
	memberOfTree(X, Left) ; memberOfTree(X, Right).

