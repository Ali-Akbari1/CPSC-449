male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(gaby).
female(edwina).
female(mona).
female(jacqueline).
female(abbie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).


happy(oswald).

%
% hasParent(Child, Parent)
%
hasParent(bart, homer).
hasParent(bart, marge).
hasParent(lisa, homer).
hasParent(lisa, marge).
hasParent(maggie, homer).
hasParent(maggie, marge).
hasParent(ling, selma).
hasParent(herb, gaby).
hasParent(herb, abraham).
hasParent(abbie, edwina).
hasParent(abbie, abraham).
hasParent(homer, mona).
hasParent(homer, abraham).
hasParent(marge, clancy).
hasParent(marge, jacqueline).
hasParent(patty, clancy).
hasParent(patty, jacqueline).
hasParent(selma, clancy).
hasParent(selma, jacqueline).

% added for hasAncestor

hasParent(abraham, orville).
hasParent(abraham,yuma).
hasParent(orville,oswald).
hasParent(orville,happy).


/*
hasParent(abraham, orville).
hasParent(orville, oswald).

hasGrandparent(GC,GP) :- 
	hasParent(GC,X), 
    hasParent(X,GP).
*/

%
%  hasFather(Child, Father)
%
hasFather(Child, Father) :-
  hasParent(Child, Father),
  male(Father).

%
%  hasMother(Child, Mother)
%

hasMother(Child, Mother) :-
  hasParent(Child, Mother),
  female(Mother).

%
%  hasGrandmother(Child, Grandmother)
%

hasGrandmother(Child, Grandmother) :-
  hasParent(Child, X),
  hasParent(X, Grandmother),
  female(Grandmother).

%
%  hasFullSibling(S1, S2)
%
hasFullSibling(S1, S2) :-
  hasFather(S1, X),
  hasFather(S2, X),
  hasMother(S1, Y),
  hasMother(S2, Y),
  S1 \= S2.

%
%  hasBrother(A, B) A has brother B
%
hasBrother(A, B) :-
  hasFullSibling(A, B),
  male(B).

%
%  hasSister(A, B) A has sister B
%
hasSister(A, B) :-
  hasFullSibling(A, B),
  female(B).

%
%  hasAunt(N, Aunt) N has aunt Aunt
%
hasAunt(N, Aunt) :-
  hasParent(N, X),
  hasFullSibling(X, Aunt),
  female(Aunt).

%
%  hasCousin(C1, C2)
%
hasCousin(C1, C2) :-
  hasGrandmother(C1, X),
  hasGrandmother(C2, X),
  C1 \= C2.


%
%  Child has Ancestor as a parent, 
%  grandparent, great grandparent, etc.
%
hasAncestor(Child, Ancestor) :-
  hasParent(Child, Ancestor).
hasAncestor(Child, Ancestor) :- 
  hasParent(Child, Parent),
  hasAncestor(Parent, Ancestor).

/*hasGGP(GGC,GGP) :-
	hasParent(GGC,X), 
	hasParent(X,Y),
	hasParent(Y,GGP).
*/