split1(_, [], [], []).
split1(N, [H|T], [H|Small], Big) :- H < N -> split1(N, T, Small, Big).
split1(N, [H|T], Small, [H|Big]) :- H >= N -> split1(N, T, Small, Big).


sumOfPowers(0, SoP, SoP).
sumOfPowers(N, X, SoP) :- power(N, Pow), XX is X+Pow, NN is N-1, sumOfPowers(NN, XX, SoP).
sumOfPowers(N, SoP) :- sumOfPowers(N, 0, SoP).


power(_, 0, 1).
power(N, X, Pow) :- XX is X - 1, power(N, XX, NewPow), Pow is (N * NewPow).

power(N, Pow) :- power(N, N, Pow).
