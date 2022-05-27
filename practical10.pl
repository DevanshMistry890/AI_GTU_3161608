/* pr10.pl */
:- use_module(library(clpfd)).
oddlength(L):-
	L9 is L+2,
	L6 is L9/2,
	L7 is L6-1,
	write('List has '),
	write(L6),
	write(' Odd Element'),
	nl,
	write('List has '),
	write(L7),
	write(' Even Element').
evenlength(L):-
	L6 is L/2,
	write('List has '),
	write(L6),
	write(' Even Element'),
	nl,
	write('List has '),
	write(L6),
	write(' Odd Element').
	%%codebyDevanshMistry
split(Index,List,Left,Right) :-
   length(Left,Index),       % Actually CREATES a list of fresh variables if "Left" is unbound
   append(Left,Right,List).  % Demand that Left + Right = List.
create(L1):-read(Elem),create(Elem,L1).
create(-1,[]):-!. create(Elem,[Elem|T]):-read(Nextel),create(Nextel,T).
chklst([H|T]):-
length(T,L),
 L>=0 ->
 (
  L1 is L+1,
  L2 is mod(L1,2),
  L2=:=0 ->
   evenlength(L1)
  ;
   oddlength(L)
 ). 
go:- write('Creating a list'),nl, write('Enter -1 to stop'),nl, create(L), nl, write('Enter index'),read(ID),split(ID,L,X1,X2),nl, chklst(X1).
