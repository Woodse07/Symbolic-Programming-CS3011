q(a).
q(X) :- X=b,!.
q(c).


bird(penguin).
fly(bird) :- bird \= penguin.


pos(succ(0)).
pos(succ(X)) :- pos(X).

neg(pred(0)).
neg(succ(X)) :- neg(X).

pure(0).
pure(X) :- pos(X), neg(X).

mixed(0).
mixed(succ(X)) :- mixed(X).
mixed(pred(X)) :- mixed(X).




member1(X, [H|T]) :- X == H ; member1(X, T).


nonmember1(_, []).
nonmember1(X, [H|T]) :- X \= H, nonmember1(X, T).


diff1(X, List1, List2) :- member1(X, List1), nonmember1(X, List2).



subL(List, B, E, SubL) :-
	dropTail(List, E, EL),
	dropHead(EL, B, SubL).

dropTail([H|T], 0, [H]).
dropTail([H|T], N, NewL) :-
	NewN is N -1,
	dropTail(T, NewN, NewH),
	NewL = [H|NewH].

dropHead(List, 0, List).
dropHead([H|T], N, Ret) :-
	NewN is N - 1,
	dropHead(T, NewN, Ret).



harmonic(N, H) :- harmonichelper(N, 1, 0, H).

harmonichelper(N, AccNum, AccTotal, H) :-
	AccNum =< N,
	NewAccTotal is AccTotal + (1/AccNum),
	NewAccNum is AccNum + 1,
	harmonichelper(N, NewAccNum, NewAccTotal, H).

harmonichelper(N, AccNum, H, H) :-
	AccNum =:= (N+1).




