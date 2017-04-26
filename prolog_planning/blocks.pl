:- dynamic(on/2).

%% Background knowledge
%% Things that won't change

block(a).
block(b).
block(c).
clear(table).

object(X) :- block(X) ; X = table.

%% Initial State

initial_state([clear(c), clear(b), on(c,a), on(a,table), on(b,table)]).

%% Goal Conditions

goal([on(a,b), on(b,c)]).

%% Action Schemata

%% move(X, From, To)
preconditions(move(X, From, To),
	      [on(X, From), clear(X), clear(To), 
	       block(X), dif(X, To), object(From), dif(From, To), dif(X, From)]).
add(move(X, From, To),
    [on(X, To), clear(From)]).
del(move(X, From, To),
    [on(X, From), clear(To)]).

