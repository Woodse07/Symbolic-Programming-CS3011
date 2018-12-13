% X = 1+1.
% X = 2.
% false.
% true.
% X = Y, Y = [].
% L = [X].
% L = [X] where X = f(X).
% true.
% false.
% Not sufficiently instantiated

q(a).
q(X) :- X=b,!.
q(c).

% X=a; X=b; no.
% X=Y, Y=a; X=a, Y=b; X=b, Y=a; X=Y, Y=b; no.
% X=Y, Y=a; X=a, Y=b; no.
% true.

fly(X) :- bird(X), not(penguin(X)).




member(X, [H|T]) :- X is H ; member(X, T).

nonmember(_, []).
nonmember(X, [H|T]) :- X \= H, nonmember(X, T).

diff(X, L1, L2) :- member(X, L1), nonmember(X, L2).



sublist(L, Begin, End, Subl) :- 
	Begin > 0, 
	End > 0, 
	droptail(L, End, L1),
	drophead(L1, Begin, Subl).

droptail([H|T], 0, [H]).
droptail([H|T], N, [H|Sub]) :-
	droptail(T, NN, Sub),
	N is NN + 1.

drophead(List, 0, List).
drophead([H|T], N, Sub]) :-
	drophead(T, NN, Sub),
	N is NN + 1.
