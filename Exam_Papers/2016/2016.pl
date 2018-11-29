isSet([]).
isSet([X|Y]) :- not(member(X, Y)), isSet(Y).



moreThanOne([X|Y]) :- Y \= [], not(member(X,Y)); moreThanOne(Y).


moreThan(List, 0) :- not(List == []).
moreThan([X|Y], Num) :- not(member(X,Y)) -> succ(Temp, Num), moreThan(Y, Temp) ; member(X,Y), moreThan(Y, Num).
