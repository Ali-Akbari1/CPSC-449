% -------------------
% Representing Graphs
% -------------------
% Define the edges in the graph. Each edge represents a connection between two nodes.
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).
edge(c, e).

% Bidirectional edges.
% The `connected/2` predicate ensures that edges are treated as bidirectional.
connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% -------------------
% Graph Traversal
% -------------------

% Example 1: Check if a path exists between two nodes (bidirectional).
% The predicate `path_exists/2` verifies if there is a path between Start and End nodes.
path_exists(Start, End) :-
    path_exists(Start, End, []). % Start with an empty list of visited nodes.

% Base case: Direct connection exists between Start and End.
path_exists(Start, End, _) :-
    connected(Start, End). % Base case without cut.

% Recursive case: Explore neighbors and avoid revisiting nodes.
path_exists(Start, End, Visited) :-
    connected(Start, Next),       % Find a neighbor of Start.
    \+ member(Next, Visited),     % Ensure it has not been visited.
    path_exists(Next, End, [Start|Visited]). % Recur with updated visited list.

% Usage:
% ?- path_exists(a, e).
% true.

% -------------------
% Additional Examples
% -------------------

% Example 2: Find all paths between two nodes.
all_paths(Start, End, Path) :-
    travel(Start, End, [Start], Path). % Initialize with the starting node.

% Base case: Destination is reached.
travel(Node, Node, Path, Path).

% Recursive case: Explore neighbors and build paths.
travel(Start, End, Visited, Path) :-
    connected(Start, Next),
    \+ member(Next, Visited), % Avoid revisiting nodes.
    travel(Next, End, [Next|Visited], Path).

% Usage:
% ?- all_paths(a, e, Path).
% Path = [a, b, d, e];
% Path = [a, c, e].

% Example 3: Shortest Path
shortest_path(Start, End, ShortestPath) :-
    bagof(Path, all_paths(Start, End, Path), Paths), % Collect all paths.
    find_shortest(Paths, ShortestPath). % Identify the shortest.

% Helper predicate to find the shortest path.
find_shortest([Path], Path). % Base case: Only one path exists.
find_shortest([Path1, Path2|Paths], Shortest) :-
    length(Path1, L1), length(Path2, L2), % Compare lengths of paths.
    (L1 =< L2 -> find_shortest([Path1|Paths], Shortest);
                 find_shortest([Path2|Paths], Shortest)).

% Example 4: Find the degree of a node.
degree(Node, Degree) :-
    findall(Neighbor, connected(Node, Neighbor), Neighbors), % Find all neighbors.
    length(Neighbors, Degree). % Count the number of neighbors.

% -------------------
% Working with Structures
% -------------------

% Example: Defining a knowledge base about employees.
% Each employee is represented by the structure `employee(Name, Position, Salary)`.
employee(john, manager, 70000).
employee(mary, developer, 60000).
employee(susan, developer, 62000).
employee(paul, analyst, 50000).

% Querying employees with specific attributes.
% Example 1: Find all developers.
find_developers(Name) :-
    employee(Name, developer, _).
% Usage:
% ?- find_developers(Name).
% Name = mary;
% Name = susan.

% Example 2: Find employees earning above a certain salary.
find_high_earners(MinSalary, Name) :-
    employee(Name, _, Salary),
    Salary > MinSalary.
% Usage:
% ?- find_high_earners(60000, Name).
% Name = john;
% Name = susan.

% Example 3: Calculate the total salary expense.
total_salary(Total) :-
    findall(Salary, employee(_, _, Salary), Salaries), % Collect all salaries.
    sum_list(Salaries, Total).
% Usage:
% ?- total_salary(Total).
% Total = 242000.

% Explanation:
% - Structures like `employee/3` make it easy to represent entities with multiple attributes.
% - Queries and computations on structured data are straightforward with Prolog's built-in predicates.
