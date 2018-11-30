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


