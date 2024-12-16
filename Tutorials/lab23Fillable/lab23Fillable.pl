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
% Usage:
% ?- path_exists(a, e).
% true.
%
% ?- path_exists(e, a).
% true.

% Example 2: Find all paths between two nodes.
% Usage:
% ?- all_paths(a, e, Path).
% Path = [a, b, d, e];
% Path = [a, c, e].

% Example 3: Shortest Path
% Find the shortest path between two nodes using all possible paths.
% Usage:
% ?- shortest_path(a, e, ShortestPath).
% ShortestPath = [a, c, e].


% Example 4: Find the degree of a node.
% The degree of a node is the number of connections it has.

% Usage:
% ?- degree(a, Degree).
% Degree = 2.

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

% Usage:
% ?- find_developers(Name).
% Name = mary;
% Name = susan.

% Example 2: Find employees earning above a certain salary.

% Usage:
% ?- find_high_earners(60000, Name).
% Name = john;
% Name = susan.

% Example 3: Calculate the total salary expense.

% Usage:
% ?- total_salary(Total).
% Total = 242000.

