%2018
% X = 1+1.
% X = 2.
% undefined procedure: love/2
% true.
% X = Y, Y = [].
% L = [X].
% L = [X] where X = f(X).
% X = 1.
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
drophead([H|T], N, Ret) :-
	NewN is N - 1,
	drophead(T, NewN, Ret).



harmonic(N, H) :- N > 0, harmonichelp(N, 0, H).

harmonichelp(0, H, H).
harmonichelp(N, Acc, H) :-
	NN is N - 1,
	NewAcc is Acc + (1/N),
	harmonichelp(NN, NewAcc, H).





%Difference lists represent the information about grammatical categories as the difference
%between two lists. The first list is what needs to be consumed, the second is what should
%be left behind. Useful for checking DCGs as the first list should be entirely consumed, and
%the second should be empty.

dcg --> ab(X), bc(Y).

ab(0) --> [].
ab(N) --> [a,b], ab(NN), {N is NN + 1}.

bc(0) --> [].
bc(N) --> [b,c], bc(NN), {N is NN + 1}.


dcg2(A,C) :- ab(A,B,X), bc(B,C,X).

ab(Ret, Ret, 0).
ab([a,b|T], Ret, Count) :- ab(T, Ret, Count2), Count is Count2 + 1.

bc(Ret, Ret, 0).
bc([b,c|T], Ret, Count) :- bc(T, Ret, Count2), Count is Count2 + 1.





%2017
%false.
%doesn't terminate.
%doesn't terminate.
%L = [].
%False.
%X = [c].

%Anonymous variable.. '_' denotes a distinct variable, called a singleton variable because
%it only appears once in a clause. 

lessSome([H|T], L2) :- number(H), less(H, L2) ; lessSome(T, L2).
less(X, [H|T]) :- number(H), X < H ; less(X, T).  

lessAll([], List).
lessAll([H|T], L2) :- number(H), less2(H, L2), lessAll(T, L2).
less2(X, []).
less2(X, [H|T]) :- number(H), X < H, less(X, T).


append1([], List, List).
append1([H|T], L2, [H|Full]) :- append1(T, L2, Full).






sum(List, Sum) :- sumhelp(List, 0, Sum).
sumhelp([], Sum, Sum).
sumhelp([H|T], Acc, Sum) :-
	NewAcc is Acc + H,
	sumhelp(T, NewAcc, Sum).


length([], N).
length([H|T], N) :- length(T, NN), N is NN + 1. 

%tail recursive predicate is one whose final clause is a call to itself.
%like so..
length2(List, N) :- lengthhelp(List, 0, N).
lengthhelp([], N, N).
lengthhelp([H|T], Acc, N) :-
	NewAcc is Acc + 1,
	lengthhelp(T, NewAcc, N).



split(Number, List, Small, Big) :- 
	member(Number, List),
	split1(Number, List, [], [], Small, Big).

split1(_, [], S, B, S, B).
split1(N, [H|T], Sacc, Bacc, S, B) :-
	number(H), N < H, split1(N, T, [H|Sacc], Bacc, S, B) ;
	number(H), N > H, split1(N, T, Sacc, [H|Bacc], S, B) ;
	number(H), N == H, split1(N, T, Sacc, Bacc, S, B).



median(List, Median) :-
	length2(List, N), 
 	mod(N,2) =:= 1,
	Middle is floor(N/2),
	medianhelp(List, Middle, Median).

medianhelp([H|T], 0, H).
medianhelp([H|T], N, Median) :-
	NN is N - 1,
	medianhelp(T, NN, Median).
	

remove(X, List, Rest) :-
	findall(Y, (member(Y, List), Y \= X), Rest).

%idk about this one..
permute([], L2).
permute((H|T), L2) :- remove(H, L2, T).



%Difference lists represent the information about gramatical categories as the difference
%between two lists. The first of the pair of lists is what should be consumed and the second
%is what is left behind. This is useful for checking dcg's since the first list should be 
%entirely consumed by our recognised and the second is what is left behind.


%2016
% X = 1.
% False.
% False.
% True.
% False.
% True.
% True.
% False.
% not instantiated.
% L = [].

isSet([]).
isSet([H|T]) :- not(member(H, T)), isSet(T).


moreThanOne([H|T]) :- T \= [], not(member(H, T)) ; moreThanOne(T).


moreThan(List, Num) :- moreThanHelp(List, 1, Num).

moreThanHelp([], N, Num) :- N > Num.
moreThanHelp([H|T], N, Num) :-
	T \= [], 
	not(member(H,T)),
	NN is N + 1,
	moreThanHelp(T, NN, Num) ;
	moreThanHelp(T, N, Num).



fac(0, 1).
fac(N, Factorial) :-
	fac(NN, NewFac),
	N is NN + 1,
	Factorial is NewFac * N.



fachelp(0, Fac, Fac).
fachelp(N, Acc, Fac) :-
	NewAcc is Acc * N,
	NN is N - 1,
	fachelp(NN, NewAcc, Fac).

fac1(N, Factorial) :- fachelp(N, 1, Factorial).


fib(0, 0).
fib(1, 1).
fib(N, Fibonacci) :- 
	NN is N - 1,
	fib(NN, Fibo1),
	NNN is N - 2,
	fib(NNN, Fibo2),
	Fibonacci is Fibo1 + Fibo2.


fibohelp(0, _, Fibonacci, Fibonacci).
fibohelp(N, Acc, Acc1, Fibonacci) :-
	NN is N - 1,
	NewAcc is Acc1,
	NewAcc1 is Acc + Acc1,
	fibohelp(NN, NewAcc, NewAcc1, Fibonacci).

fibo(N, Fibonacci) :- fibohelp(N, 0, 1, Fibonacci).



%2015
% i is a fact
% ii is a fact
% iii is a rule
% iii is best translation.

%False.
%X = 3+2.
%False.
%Not instantiated.
%X = 5.
%False.
%True.
%True.

isnumbers([]).
isnumbers([H|T]) :- number(H), isnumbers(T).

splitter(N, List, Small, Big) :-
	isnumbers(List), 
	findall(X, (member(X, List), X < N), Small),
	findall(X, (member(X,List), X >= N), Big).




sumOfPowers(N, SoP) :- 
	N > 0, 
	sop(N, 0, SoP).

sop(0, SoP, SoP).
sop(N, Acc, SoP) :-	
	NN is N - 1,
	Temp is N ** N,
	NewAcc is Acc + Temp,
	sop(NN, NewAcc, SoP). 
	


member(X, [H|T]) :- X is H, member(X,T).

%Green, doesn't effect outcome of the program and is more efficient. 

last(X, [X|[]]).
last(X, [H|T]) :- last(X, T).


multiple(X, [H|T]) :- X is H, multiple2(X, T) ; multiple(X, T).
multiple2(X, [H|T]) :- X is H ; multiple2(X, T).


next(A,B, [A,B|T]).
next(A,B, [H|T]) :- next(A,B, T).


u2v --> u(Count), [2], v(Count).

u(0) --> [].
u(N) --> [0], u(N).
u(N) --> [1], u(NN), {N is NN + 1}.

v(0) --> [].
v(N) --> [1], v(N).
v(N) --> [0], v(NNN), {N is NNN + 2}.


%Difference list represent the information of gramatical categories as the difference between
%two lists, this first of the pair of lists is what should be consumed, and the second is 
%what is left behind. Useful for DCGS since the first list should be completely consumed by
%out recognised, and the second list should be empty.

u2v2(A,C) :- u(A,B,Count), v(B,C,Count).

u([2|T], Res, 0).
u([0|T], Res, N) :- u(T, Res, N).
u([1|T], Res, N) :- u(T, Res, NN), N is NN + 1.

v(Res, Res, 0).
v([1|T], Res, N) :- v(T, Res, N).
v([0|T], Res, N) :- v(T, Res, NNN), N is NNN + 2.









