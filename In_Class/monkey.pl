%
%  The Monkey and The Banana
%
%  Can the monkey get the banana that is hanging in the middle of the room?
%  What sequence of actions will get it for him?
%

%
%  Start state: state(atDoor, atWindow, onFloor, hasNot)
%
%  End state: state(_, _, _, has)
%
%  Valid state changes:
%
transition(state(atMiddle, atMiddle, onBox, hasNot),
           grasp,
           state(atMiddle, atMiddle, onBox, has)).

transition(state(X, X, onFloor, B),
           climb,
           state(X, X, onBox, B)).

transition(state(X, X, onFloor, B),
           carry(X, Y),
           state(Y, Y, onFloor, B)).

transition(state(X, BoxLoc, onFloor, B),
           walk(X, Y),
           state(Y, BoxLoc, onFloor, B)).

%
%  Rule to identify the sequence of steps needed to get the banana
%
canGet(state(_,_,_,has), ActionList) :- ActionList = [], !.
canGet(CurrentState, ActionList) :-
  transition(CurrentState, A, NewState),
  canGet(NewState, Actions), 
  ActionList = [A | Actions], !.
