% QUESTION 1
% u2v where num of 0s in u is twice the number of 1s in v.

string --> string(_).
string(N) --> u(N), two, v(N).

two --> [2].

u(0) --> [].
u(succ(succ(N))) --> [0], u(N1).
u(N) --> [1], u(N).

v(0) --> [].
v(succ(N)) --> [1], v(N1).
v(N) --> [0], v(N).


% QUESTION 2

