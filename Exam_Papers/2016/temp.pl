moreThan(List, N) :- mth(List, 0, N).

mth([], Acc, N) :- Acc > N.
mth([H|T], Acc, N) :-
	not(member(H,T)) -> NewAcc is Acc + 1, mth(T, NewAcc, N) ;
						mth(T, Acc, N).



fib(0,0).
fib(1,1).
fib(N,Fibo) :- fib(NNN, Fibo1), N is NNN + 2,
			   fib(NN, Fibo2), N is NN + 1,
			   Fibo is Fibo1 + Fibo2.
