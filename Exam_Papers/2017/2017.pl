

lessSome([H|T], [H1|T1]) :- number(H), someCycle(H, [H1|T1]) ; lessSome(T, T1).
someCycle(Num, [H|T]) :- number(H), Num < H ; someCycle(Num , T).


lessAll([], L).
lessAll([H|T], L) :- number(H), allCycle(H, L), lessAll(T, L).
allCycle(_, []).
allCycle(Num, [H|T]) :- number(H), Num < H, allCycle(Num , T).




append1([], List, List).
append1([H|T], List2, [H|List3]) :- append1(T, List2, List3).




sum1([], 0).
sum1([H|T], Sum) :- sum1(T, OldSum), Sum is OldSum + H.



length1(List, N) :- lengthhelper(List, 0, N).
lengthhelper([], N, N).
lengthhelper([H|T], Acc, N) :- NewAcc is Acc + 1, lengthhelper(T, NewAcc, N).



split(X, List, Small, Big) :- 
	member(X, List),
	splithelper(X, List, [], [], Small, Big).

splithelper(_, [], Small, Big, Small, Big).
splithelper(X, [H|T], S, B, Small, Big) :-
	H < X, splithelper(X, T, [H|S], B, Small, Big);
	H > X, splithelper(X, T, S, [H|B], Small, Big);
	H = X, splithelper(X, T, S, B, Small, Big).


median(List, Median) :- 
	length1(List, N), 
	1 is mod(N, 2),
	I is floor(N/2),
	findNum(List, I, Median).

findNum([H|T], 0, H).
findNum([H|T], I, Median) :- findNum(T, II, Median), I is II + 1.



remove(X, List, Rest) :- member(X, List), listBuilder(X, List, [], Rest).

listBuilder(X, [], Rest, Rest).
listBuilder(X, [H|T], Acc, Rest) :-
	X \= H -> listBuilder(X, T, [H|Acc], Rest);
	listBuilder(X, T, Acc, Rest).





nm --> zero(N), one(M), {M is N + N}.

zero(0) --> [].
zero(N) --> [0], zero(NN), {N is NN + 1}.

one(0) --> [].
one(M) --> [1], one(MM), {M is MM + 1}.




















