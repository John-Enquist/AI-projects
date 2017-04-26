%% John Enquist project 4 prolog logic puzzles part two endangered animals

prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).


%% R is the list of endangered animals in year order   
report(Animal_list) :-
    %% the report is represented as a list of 6 animals
    A1 = endangered(_,_,_,2006),
    Q2 = endangered(_,_,_,2007),
    R3 = endangered(_,_,_,2008),
    S4 = endangered(_,_,_,2009),
    T5 = endangered(_,_,_,2010),
    U6 = endangered(_,_,_,2011),
    Animal_list = [A1,Q2,R3,S4,T5,U6],

    %% each endangered animal  is represented as a 4 tuple described below
    %% endangered(animal,origin,population,year-endangered)

    %% (fact 2) the perens pig doesnt have a population of 525
    %% N \= 525,
    dif(N, 525),
    member(endangered(perens_pig,_,N,_), Animal_list),

    %% (fact 1) one of the animals lives in egypt
    member(endangered(_,egypt,_,_), Animal_list),

    %% (fact 3) population size 525 was listed the year before the nibner newt
    sublist([endangered(_,_,525,_),endangered(nibner_newt,_,_,_)], Animal_list),

    %% (fact 4) year 2009 and population 350 dont live in ukraine
    %% M \= ukraine,
    dif(M, ukraine),
    member(endangered(_,_M,_,2009), Animal_list),
    member(endangered(_,M,350,_), Animal_list),

    %% (fact 5) 245 came one year before 420
    sublist([endangered(_,_,245,_),endangered(_,_,420,_)], Animal_list),

    %% (fact 6) dobra dingo is listed 2 years before lisner cat
    member(endangered(dobra_dingo,_,_,X), Animal_list),
    Y is (X+2),
    member(endangered(lisner_cat,_,_,Y), Animal_list),

    %% (fact 7) 2011 is either pop size 315 or from venezuela
    (member(endangered(_,_,315,2011), Animal_list);
    member(endangered(_,venezuela,_,2011), Animal_list)),
    
    %% (fact 8) elder elk either lives in indonesia or is 2008
    (member(endangered(elder_elk,_,_,2008), Animal_list);
    member(endangered(elder_elk,indonesia,_,_), Animal_list)),

    %% (fact 9) elder elk is one year before kosovo species
    sublist([endangered(elder_elk,_,_,_),endangered(_,kosovo,_,_)], Animal_list),

    %% (fact 10) animal from oman is listed 4 years after 525 pop size animal
    member(endangered(_,_,525,Z), Animal_list),
    W is (Z+4),
    member(endangered(_,oman,_,W), Animal_list),
    
    %% (fact 11) pop size 525 is 1 year before indonesia animal
    sublist([endangered(_,_,525,_),endangered(_,indonesia,_,_)], Animal_list),

    %% (fact 12) (double scenario possibility question)
    (member(endangered(_,ukraine,_,2006), Animal_list),member(endangered(_,_,560,2010), Animal_list));
    (member(endangered(_,ukraine,_,2010), Animal_list),member(endangered(_,_,560,2006), Animal_list)),

    %% (fact 13) (double scenario possibility question)
    (member(endangered(lisner_cat,_,_,2008), Animal_list),member(endangered(_,slovakia,315,_), Animal_list));
    (member(endangered(lisner_cat,_,315,_), Animal_list),member(endangered(_,slovakia,_,2008), Animal_list)),

    %% (fact 14) slovakia animal is either size 420 or pop size 525
    (member(endangered(_,_,315,2011), Animal_list);
    member(endangered(_,venezuela,_,2011), Animal_list)),

    %% (fact 15) byengo bat was listed sometime after the animal that lives in kosovo
    member(endangered(_,kosovo,_,B), Animal_list),
    C > B,
    member(endangered(byengo_bat,_,_,C), Animal_list),
    
    %% (fact 16) animal with 350 pop was listed before animal with 315 pop
    member(endangered(_,_,350,D), Animal_list),
    E < D,
    member(endangered(_,_,315,E), Animal_list),
    
    %% (fact 17) osbele onyx was 3 years before animal with 280 population
    member(endangered(osbele_onyx,_,_,F), Animal_list),
    G = F+3,
    member(endangered(_,_,280,G), Animal_list).
    
    %% getting the report R
    %% Animal_list = Animal_list.
