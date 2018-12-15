split(N, List, Big, Small) :- splitH(N, List, [], [], Big, Small).

splitH(N, [], Big, Small, Big, Small).
splitH(N, [H|T], BAcc, SAcc, B, S) :-
	H < N, splitH(N, T, BAcc, [H|SAcc], B, S);
	H > N, splitH(N, T, [H|BAcc], SAcc, B, S);
	H == N, splitH(N, T, BAcc, SAcc, B, S).




next1(A,B,[A,B|T]).
next1(A,B,[H|T]) :- next1(A,B,T).


u2v --> u(Count), [2], v(Count).

u(0) --> [].
u(N) --> [1], u(NN), {N is NN + 1}.
u(N) --> [0], u(N).

v(0) --> [].
v(N) --> [1], v(N).
v(N) --> [0], v(NN), {N is NN + 2}.
	
