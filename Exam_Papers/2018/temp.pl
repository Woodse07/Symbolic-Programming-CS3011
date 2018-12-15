harmonic(N, H) :- helper(N, 0, H).

helper(0, H, H).
helper(N, Acc, H) :- NewAcc is Acc + (1/N),
					 NN is N - 1,
					 helper(NN, NewAcc, H).
