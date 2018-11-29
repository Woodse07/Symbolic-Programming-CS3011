
isSet([]).
isSet([X|Y]) :- not(member(X, Y)), isSet(Y).



moreThanOne([X|Y]) :- Y \= [], not(member(X,Y)); moreThanOne(Y).



moreThan(List, 0) :- not(List == []).
moreThan([X|Y], Num) :- not(member(X,Y)) -> succ(Temp, Num), moreThan(Y, Temp) ; member(X,Y), moreThan(Y, Num).







fac(0, 1).
fac(N, Factorial) :- succ(Temp, N), fac(Temp, OldFac), Factorial is N * OldFac.



factorial(0, F, F).
factorial(N, A, F) :- AA is N*A, NN is N-1, factorial(NN, AA, F). 
fact(N, F) :- factorial(N, 1, F).


fib(0, 0).
fib(1, 1).
fib(N, Fibonacci) :- NNN is N-2, fib(NNN, Fib), NN is N-1, fib(NN, Fib1), Fibonacci is Fib+Fib1.

fibonacci(0, _, F, F).
fibonacci(N, P1, P2, F) :- NN is N-1, FF is P1+P2, fibonacci(NN, P2, FF, F).
fibo(N, F) :- fibonacci(N, 1, 1, F).





abc --> a(N), b(M), c(K), {K >= M+N}.

a(0) --> [].
a(N) --> [a], a(NN), {N is NN + 1}.

b(0) --> [].
b(M) --> [b], b(MM), {M is MM + 1}.

c(0) --> [].
c(K) --> [c], c(KK), {K is KK + 1}.


memberList(L,0) --> [].
memberList(L,N) --> [X,Y], {member(X, L)}, {member(Y,L)}, memberList(L,NN), {N is NN+1}.


