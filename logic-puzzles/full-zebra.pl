%% John Enquist Project 4 logic puzzles

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).    

%% Zebra owner nationality =  A, and water drinker nationality = B
    
answer(water_drinker(A),zebra_owner(B)) :-
    %% the street is represented as a list of 5 houses
    Street = [House1,House2,House3,House4,House5],

    %% each house is represented as a 5-place
    %% (color, nationality, pet, cigarette, drink) complex term
    member(house(red,_,_,_,_), Street),
    member(house(blue,_,_,_,_), Street),
    member(house(green,_,_,_,_), Street),    
    member(house(yellow,_,_,_,_), Street),
    member(house(ivory,_,_,_,_), Street),

    %% filling in the information directly related to a color house
    member(house(red,english,_,_,_), Street),
    member(house(green,_,_,_,coffee), Street),
    member(house(yellow,_,_,kools,_), Street),
    
    %% now the more ambiguous facts
    member(house(_,spaniard,dog,_,_), Street),
    member(house(_,ukranian,_,_,tea), Street),
    member(house(_,_,snails,old-gold,_), Street),
    member(house(_,_,_,lucky-strike,orange-juice), Street),
    member(house(_,japanese,_,parliaments,_), Street),

    %% the green house is directly right of the ivory house
    sublist([house(ivory,_,_,_,_),house(green,_,_,_,_)], Street),

    %% the man who smokes chesterfields lives in the house nexttofox
    (sublist([house(_,_,_,chesterfields,_),house(_,_,fox,_,_)], Street);
    sublist([house(_,_,fox,_,_),house(_,_,_,chesterfields,_)], Street)),

    %% kools are smoked nextto the house where the horse is kept
    (sublist([house(_,_,_,kools,_),house(_,_,horse,_,_)], Street);
    sublist([house(_,_,horse,_,_),house(_,_,_,kools,_)], Street)),

    %% norwegian lives nextto the blue house
    (sublist([house(_,norwegian,_,_,_),house(blue,_,_,_,_)], Street);
    sublist([house(blue,_,_,_,_),house(_,norwegian,_,_,_)], Street)),
    
    %% milk is drunk in the middle house
    House3 = house(_,_,_,_,milk),

    %% norwegian lives in the first house
    House1 = house(_,norwegian,_,_,_),

    %% the zebra belongs to the person with nationality A
    member(house(_,B,zebra,_,_), Street),
    member(house(_,A,_,_,water), Street).
