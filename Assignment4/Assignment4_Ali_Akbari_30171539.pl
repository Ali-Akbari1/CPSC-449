% CPSC 449 - Programming Paradigms
% Assignment 4
% Ali Akbari
% 30171539

% Problem 1 - interleave
% interleave/3: Combines two lists by alternating their elements. 
% If one list is longer, the remaining elements are appended to the result.
interleave([], Ys, Ys).
interleave(Xs, [], Xs).
interleave([X|Xs], [Y|Ys], [X,Y|Zs]) :-
    interleave(Xs, Ys, Zs).


% Example queries:
% ?- interleave([1,3,5], [2,4,6], Zs).
% Zs = [1,2,3,4,5,6].
% ?- interleave([a,c,e,g], [b,d], Zs).
% Zs = [a,b,c,d,e,g].


% Problem 2 - Smart Home Automation Challenge
% Part A: Knowledge Base

room(living_room).
room(bedroom).
room(kitchen).

device(light, living_room).
device(light, bedroom).
device(light, kitchen).

device(thermostat, living_room).
device(thermostat, bedroom).
device(thermostat, kitchen).

device(security_camera, living_room).
device(security_camera, bedroom).
device(security_camera, kitchen).


% Part B: Initial State
initial_state(state([],20,disarmed)).
goal_state(state([living_room], 22, armed)).

% Part C: State Transition Rules
% Turn on lights in a specific room
turn_on_lights(CurrentState, Room, NewState) :-
    CurrentState = state(Lights, Temp, SecurityMode),
    \+ member(Room, Lights),
    NewState = state([Room|Lights], Temp, SecurityMode).

% Adjust the temperature
adjust_temperature(CurrentState, NewTemp, NewState) :-
    CurrentState = state(Lights, _, SecurityMode),
    NewState = state(Lights, NewTemp, SecurityMode).

% Change the security mode
change_security_mode(CurrentState, Mode, NewState) :-
    CurrentState = state(Lights, Temp, _),
    NewState = state(Lights, Temp, Mode).


% Part D: Goal State

% Reach Goal State Rule with improved multiple room handling
reach_goal_state(CurrentState, GoalState, []) :-
    CurrentState = GoalState.

reach_goal_state(CurrentState, GoalState, [Action|Actions]) :-
    % Separate initial state components
    CurrentState = state(CurrentLights, CurrentTemp, CurrentMode),
    GoalState = state(GoalLights, GoalTemp, GoalMode),
    
    % Try different transitions in order
    (   % Turn on lights for rooms not yet lit
        member(Room, GoalLights),
        \+ member(Room, CurrentLights),
        turn_on_lights(CurrentState, Room, NextState),
        Action = turn_on_lights(Room)
    ;   % Adjust temperature if different
        CurrentTemp \= GoalTemp,
        adjust_temperature(CurrentState, GoalTemp, NextState),
        Action = adjust_temperature(GoalTemp)
    ;   % Change security mode
        CurrentMode \= GoalMode,
        change_security_mode(CurrentState, GoalMode, NextState),
        Action = change_security_mode(GoalMode)
    ),
    
    % Recursively find remaining actions
    reach_goal_state(NextState, GoalState, Actions).


% Knowledge Base
leaf(_, _).
cnode(red, []).
cnode(green, []).
cnode(blue, []).
cnode(red, [T|Ts]) :- colortree(T), cnode(red, Ts).
cnode(green, [T|Ts]) :- colortree(T), cnode(green, Ts).
cnode(blue, [T|Ts]) :- colortree(T), cnode(blue, Ts).
colortree(leaf(_, _)).
colortree(cnode(_, _)).

% Base case: A leaf converts to a list with its color and value.
colortree_list(leaf(Color, Value), [Color, Value]).

% Recursive case: A cnode converts to [Color | ProcessedChildren].
colortree_list(cnode(Color, Children), [Color | ProcessedChildren]) :-
    % Process each child in the list of children.
    maplist(colortree_list, Children, ProcessedChildren).


% Problem 4 - Recipe System
% Part A: Knowledge Base
ingredient(Name, Category) :-
    ingredient(chicken, meat).
    ingredient(tofu, vegetarian).
    ingredient(lettuce, vegetable).
    ingredient(tomato, vegetable).
    ingredient(cheese, dairy).

% Define recipes and their ingredient lists.
recipe(Name, IngredientList) :-
    recipe(chicken_salad, [chicken, lettuce, tomato]).
    recipe(veggie_salad, [lettuce, tomato, tofu]).
    recipe(cheese_salad, [lettuce, tomato, cheese]).

% Define dietary restrictions.
dietary_restriction(RestrictionName) :-
    dietary_restriction(vegetarian).
    dietary_restriction(vegan).

% Part B: Rules
% Define rules to check if an ingredient is compatible with a dietary restriction.
compatible_ingredient(Ingredient, vegetarian) :-
    ingredient(Ingredient, Category),
    Category \= meat.

compatible_ingredient(Ingredient, vegan) :- % Rule for vegan compatibility.
    ingredient(Ingredient, Category),
    Category \= meat,
    Category \= dairy.

% Default rule if no conditions are met.
compatible_ingredient(_, _) :-
    fail.

% Define rules to check if a recipe is compatible with a dietary restriction.
recipe_compatible(Recipe, Restriction) :-
    recipe(Recipe, Ingredients),
    forall(member(Ingredient, Ingredients), compatible_ingredient(Ingredient, Restriction)).


% Define rules to recommend a recipe based on available ingredients and dietary restrictions.
recommend_recipe(AvailableIngredients, Restriction, RecommendedRecipe) :-
    recipe(RecommendedRecipe, Ingredients),
    subset(Ingredients, AvailableIngredients),
    recipe_compatible(RecommendedRecipe, Restriction).


% Problem 5 - Ternary to Natural Number Conversion
% Base cases for ternary digits
tern(zero).
tern(one).
tern(two).

% Rules to ensure valid ternary structure
tern(tern(X), tern(Y)) :- tern(X), tern(Y).
tern(tern(X)) :- tern(X).
tern(tern(X,Y)) :- tern(X), tern(Y).

% Ternary to Natural Number Conversion
% Base cases
tern_nat(tern(zero), nat_zero).
tern_nat(tern(one), succ(nat_zero)).
tern_nat(tern(two), succ(succ(nat_zero))).

% Recursive conversion for nested ternary numbers
% Single argument case (handling leading zeros)
tern_nat(tern(X), Nat) :-
    tern_nat(X, SubNat),
    multiply_by_three(SubNat, Nat).

% Two arguments case
tern_nat(tern(X, Y), Nat) :-
    tern_nat(X, SubNatX),
    multiply_by_three(SubNatX, Multiplied),
    tern_nat(Y, SubNatY),
    add_nat(Multiplied, SubNatY, Nat).

% Inverse conversion - generate ternary from natural number
tern_nat(Tern, Nat) :-
    ground(Nat),
    generate_tern(Tern, Nat).

% Generate ternary number for a given natural number
generate_tern(tern(two), succ(succ(nat_zero))).
generate_tern(tern(one), succ(nat_zero)).
generate_tern(tern(zero), nat_zero).
generate_tern(tern(X, Y), Nat) :-
    generate_tern(X, SubNatX),
    multiply_by_three(SubNatX, Multiplied),
    generate_tern(Y, SubNatY),
    add_nat(Multiplied, SubNatY, Nat).

% Multiply by 3 
multiply_by_three(nat_zero, nat_zero).
multiply_by_three(succ(N), Res) :-
    multiply_by_three(N, Multiplied),
    add_nat(Multiplied, succ(succ(succ(Multiplied))), Res).

% Natural number addition
add_nat(nat_zero, N, N).
add_nat(succ(X), Y, succ(Z)) :- add_nat(X, Y, Z).