%Q4 a
divisible([], _) :- false.
divisible([H|T], X) :- X mod H =:= 0, !; divisible(T, X).

%Q4 b
generateList(L, R, L0):-
	generateList(L,1,1,R,L0).

generateList(_, _, R1, R2, []):-
	R1 > R2, !.
generateList(L, C,R1, R2, L1):-
	C =< R1,
	R1 =< R2,
	\+divisible(L, C),
	C0 is C + 1,
	C0 =< R1,
	generateList(L,C0,R1,R2, L1).

generateList(L, C,R1, R2, [C|L1]):-
	C =< R1,
	R1 =< R2,
	\+divisible(L, C),
	C0 is C + 1,
	\+(C0 =< R1),
	R is R1 + 1,
	generateList(L,1,R,R2,L1).

generateList(L, C,R1,R2,L1):-
	C =< R1,
	R1 =< R2,
	divisible(L, C),
	C0 is C + 1,
	C0 =< R1,
	generateList(L,C0,R1,R2,L1).

generateList(L, C,R1,R2, L1):-
	C =< R1,
	R1 =< R2,
	divisible(L, C),
	C0 is C + 1,
	\+(C0 =< R1),
	R is R1 +1,
	generateList(L,1,R,R2,L1).















	
	