:- dynamic(on/2).

%% Background knowledge
%% Things that won't change

block(a).
block(b).
block(c).
clear(table).

object(X) :- block(X) ; X = table ; X = pyramid(X) ; X = ball(X) ; X = box(X,_, BoxState).

%% Initial State

initial_state([clear(c), clear(b), on(c,a), on(a,table), on(b,table)]).

%% Goal Conditions

goal([on(a,b), on(b,c)]).

%% Action Schemata

%% move(X, From, To)
%% where X is going to be an object listed above
preconditions(move(block(X), From, To),
	      [on(X, From), clear(X), clear(To), 
	       block(X), dif(X, To), object(From), dif(From, To), dif(X, From), dif(pyramid, To), dif(ball, To)]).

preconditions(move(pyramid(X), From, To),
	      [on(X, From), clear(X), clear(To), 
	       pyramid(X), dif(X, To), object(From), dif(From, To), dif(X, From), dif(pyramid, To), dif(ball, To)]).

preconditions(move(ball(X), From, To),
	      [on(X, From), clear(X), clear(To), 
	       ball(X), dif(X, To), object(From), dif(From, To), dif(X, From), dif(pyramid, To), dif(ball, To), =(To, box(_,_,_))]).

preconditions(move(box(X,_, A), From, To),
	      [on(X, From), clear(X), clear(To), 
	       box(X,_, closed), dif(X, To), object(From), dif(From, To), dif(X, From), dif(pyramid, To), dif(ball, To)]).

add(move(X, From, To),
    [on(X, To), clear(From)]).
del(move(X, From, To),
    [on(X, From), clear(To)]).

%% putIn(X, From, box(Y,_,Z))
%% putting objects into a box that is open and empty
preconditions(putIn(X, From, box(Y,_,Z)),
              [on(X, From), clear(X), dif(X, box(Y,_,Z)), empty(box(Y,_,Z)), =(open, Z)]). 

add(putIn(X, From, box(Y,_,Z)),
    [box(Y,X,Z), clear(From)]).
del(putIn(X, From, box(Y,_,Z)),
    [on(X, From), empty(box(Y,_,Z), =(open, Z)]).
     
%% takeOut(X, box(Y,X,Z), table))
%% taking out an object from a box that is full and open
preconditions(takeOut(X, box(Y,X,Z), table)),
              [object(X), box(Y,X,Z), clear(box(Y,X,Z)), open(box(Y)), dif(box(Y), X)]). 

add(takeOut(X, box(Y), table),
    [on(X, table), box(Y,_,Z]).
del(takeOut(X, box(Y), To),
    [box(Y,X,Z), clear(To)]).
