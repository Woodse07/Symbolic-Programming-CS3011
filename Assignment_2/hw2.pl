% QUESTION 1
% u2v where num of 0s in u is twice the number of 1s in v.
% Translation of DCG to ordinary Prolog Clauses..
% String(Count,A,D) :- u(Count,A,B), two(A,C), v(Count,A,D). .. I think

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
init --> houses(_,_,_).

houses(A, B, C) --> 	color(A, A1), nationality(B, B1), pet(C, C1),
						color(A1, A2), nationality(B1, B2), pet(C1, C2), 
						color(A2, _), nationality(B2, _), pet(C2, _).  

color(red, blue_green) --> [red].
color(blue, green_red) --> [blue].
color(green, red_blue) --> [green].
color(blue_green, green_done) --> [blue].
color(blue_green, blue_done) --> [green].
color(green_red, red_done) --> [green].
color(green_red, green_done) --> [red].
color(red_blue, blue_done) --> [red].
color(red_blue, red_done) --> [blue].
color(red_done, done) --> [red].
color(green_done, done) --> [green].
color(blue_done, done) --> [blue].

nationality(english, spanish_japanese) --> [english].
nationality(spanish, japanese_english) --> [spanish].
nationality(japanese, english_spanish) --> [japanese].
nationality(spanish_japanese, japanese_done) --> [spanish].
nationality(spanish_japanese, spanish_done) --> [japanese].
nationality(japanese_english, japanese_done) --> [english].
nationality(japanese_english, english_done) --> [japanese].
nationality(english_spanish, english_done) --> [spanish].
nationality(english_spanish, spanish_done) --> [english].
nationality(english_done, done) --> [english].
nationality(spanish_done, done) --> [spanish].
nationality(japanese_done, done) --> [japanese].

pet(jaguar, snail_zebra) --> [jaguar].
pet(snail, zebra_jaguar) --> [snail].
pet(zebra, jaguar_snail) --> [zebra].
pet(snail_zebra, zebra_done) --> [snail].
pet(snail_zebra, snail_done) --> [zebra].
pet(zebra_jaguar, jaguar_done) --> [zebra].
pet(zebra_jaguar, zebra_done) --> [jaguar].
pet(jaguar_snail, snail_done) --> [jaguar].
pet(jaguar_snail, jaguar_done) --> [snail].
pet(jaguar_done, done) --> [jaguar].
pet(snail_done, done) --> [snail].
pet(zebra_done, done) --> [zebra].


% QUESTION 3
mkList(0,[]).
mkList(N, [N|L]) :- succ(X, N), mkList(X, L).

