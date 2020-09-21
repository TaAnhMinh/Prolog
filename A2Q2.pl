adj(a,b).
adj(a,g).
adj(b,c).
adj(b,i).
adj(c,d).
adj(d,e).
adj(d,j).
adj(e,l).
adj(f,g).
adj(g,h).
adj(h,i).
adj(i,j).
adj(j,k).
adj(k,l).
adj(l,m).

color(red).
color(yellow).
color(blue).

% Assignment 2, Question 2 a
colorset([],[]):- !.

colorset([_|B], [X|C]):-
	color(X),
	colorset(B,C).

% Question 2 b
diffadjcolor(_,_, [],[]):- !.

diffadjcolor(G, C, [A|B], [D|E]):-
	adj(G,A),
	C \= D,
	diffadjcolor(G,C,B,E).

diffadjcolor(G, C, [A|B], [_|E]):-
	\+adj(G,A),
	diffadjcolor(G,C,B,E).

% Question 2 c
generate(Gs,Cs):-colorset(Gs,Cs),valid(Gs,Cs).

valid([],_):- !.

valid([A|B], [X|C]):- 
	color(X),
	colorset(B, C),
	diffadjcolor(A, X, B, C),
	valid(B,C).