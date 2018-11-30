split1(_, [], [], []).
split1(N, [H|T], [H|Small], Big) :- H < N -> split1(N, T, Small, Big).
split1(N, [H|T], Small, [H|Big]) :- H >= N -> split1(N, T, Small, Big).


sumOfPowers(0, SoP, SoP).
sumOfPowers(N, X, SoP) :- power(N, Pow), XX is X+Pow, NN is N-1, sumOfPowers(NN, XX, SoP).
sumOfPowers(N, SoP) :- sumOfPowers(N, 0, SoP).

power(_, 0, 1).
power(N, X, Pow) :- XX is X - 1, power(N, XX, NewPow), Pow is (N * NewPow).

power(N, Pow) :- power(N, N, Pow).







member1(X, [H|T]) :- X == H; member1(X, T).


last1(X, [X|[]]).
last1(X, [_|T]) :- last1(X, T).


multiple(X, [_|T]) :- multiple(X, T).
multiple(X, [X|T]) :- foundOnce(X, T).
foundOnce(X, [_|T]) :- foundOnce(X, T).
foundOnce(X, [X|_]).


next1(A, [H|_]) :- A is H.
next1(A, B, [H|T]) :- A is H, next1(B, T); next1(A, B, T).






u2v --> u(Count), [2], v(Count).

u(0) --> [].
u(succ(Count)) --> [1], u(Count).
u(Count) --> [0], u(Count).

v(0) --> [].
v(Count) --> [1], v(Count).
v(succ(succ(Count))) --> [0], v(Count).


mkList(1, [1]).
mkList(N, [N|T]) :- NN is N - 1, mkList(NN, T).

sum_list([], 0).
sum_list([H|T], Sum) :- sum_list(T, OldSum), Sum is OldSum + H.


half(Half) --> {Half >= 1, Full is Half*2, mkList(Full, L)}, genList(L, Full).

genList(L, Full) --> {Full >= 0, member(X, L), Rest is Full-X}, [X], genList(L, Rest).
genList(_, 0) --> [].

