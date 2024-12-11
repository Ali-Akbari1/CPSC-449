fruit(grape).
fruit(plum).
fruit(apple).
fruit(pear).
fruit(banana).
fruit(tomato).
fruit(bell_pepper).
fruit(egg_plant).

vegetable(celery).
vegetable(carrot).
vegetable(tomato).
vegetable(bell_pepper).
vegetable(egg_plant).

nut(almond).
nut(peanut).
nut(cashew).

junkfood(chips).
junkfood(candy).

okForSchool(X) :- nut(X), !, fail.
okForSchool(X) :- junkfood(X), !, fail.
% okForSchool(X).

  

causesConfusion(X) :- 
  fruit(X), 
  vegetable(X).

okForFruitSalad(X) :-
  fruit(X),
  \+causesConfusion(X).

has(alice, grape).
has(bob, apple).
has(bob, plum).
has(charles, apple).
has(charles, pear).
has(diane, plum).
has(diane, celery).
has(diane, carrot).

%healthy(grape) :- fruit(grape).
%healthy(plum) :- fruit(plum).
%healthy(apple) :- fruit(apple).
%healthy(pear) :- fruit(pear).
%healthy(banana) :- fruit(banana).

%healthy(celery) :- vegetable(celery).
%healthy(carrot) :- vegetable(carrot).

%healthy(X) :- fruit(X).
%healthy(X) :- vegetable(X).

healthy(X) :- fruit(X).
healthy(X) :- vegetable(X).
