% QUESTION 1
% u2v where num of 0s in u is twice the number of 1s in v.

string --> string(_).
string(Count) --> u(Count), two, v(Count).

two --> [2].

u(0) --> [].
u(succ(Count)) --> [0], u(Count).
u(Count) --> [1], u(Count).

v(0) --> [].
v(succ(succ(Count))) --> [1], v(Count).
v(Count) --> [0], v(Count).

% QUESTION 2

