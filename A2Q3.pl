choice(marie, [peru,greece,vietnam]).
choice(jean, [greece,peru,vietnam]).
choice(sasha, [vietnam,peru,greece]).
choice(helena,[peru,vietnam,greece]).
choice(emma, [greece,peru,vietnam]).

where(A,C):- where(A,0,0,0,C).

where([],P0,G0,V0,P1,G1,V1):- 
	P1 is P0,
	G1 is G0,
	V1 is V0.

where([A|B],P,G,V,P1,G1,V1):- 
	choice(A, L),
	point(L,P, G, V, P0,G0,V0),
	where(B,P0,G0,V0,P1,G1,V1).
	
where(A,P0,G0,V0,C):-
	where(A,P0,G0,V0, P, G, V),
	max(P,G,V,C).
	
point(L, P0, G0, V0, P, G, V):- point(L, P0, G0, V0, 3, P, G, V).
point(_, _, _, _, 0, _, _, _):- !.
point([A|B], P0, G0, V0, Q, P, G, V):-
	A = peru,
	P is P0 + Q,
	Q0 is Q - 1,
	point(B, P0, G0, V0, Q0, P, G, V).

point([A|B], P0, G0, V0, Q, P, G, V):-
	A = greece,
	G is G0 + Q,
	Q0 is Q - 1,
	point(B, P0, G0, V0, Q0, P, G, V).

point([A|B], P0, G0, V0, Q, P, G, V):-
	A = vietnam,
	V is V0 + Q,
	Q0 is Q - 1,
	point(B, P0, G0, V0, Q0, P, G, V).

max(P,G,V,C):- 
	P >= G,
	P >= V,
	choice(marie, L),
	country(L, C).

max(P,G,V,C):- 
	G >= P,
	G >= V,
	choice(jean, L),
	country(L, C).

max(P,G,V,C):- 
	V >= P,
	V >= G,
	choice(sasha, L),
	country(L, C).

country([A|_], C):-
	C = A.