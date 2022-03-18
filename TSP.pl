%% predife distances or facts
road(birmingham,bristol, 9).
road(london,birmingham, 3).
road(london,bristol, 6).
road(london,plymouth, 5).
road(plymouth,london, 5).
road(portsmouth,london, 4).
road(portsmouth,plymouth, 8).

%% predicate we will call to find our paths, get_road/4. 
%% calls the working predicate, that has two accumulators

get_road(Start, End, Visited, Result) :-
    get_road(Start, End, [Start], 0, Visited, Result).

%% working predicate,
%% get_road/6 : get_road(+Start, +End, +Waypoints, +DistanceAcc, -Visited, -TotalDistance) :
%% The first clause tells that if there is a road between our first point and our last point, we can end here.

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, End, Distance),
    reverse([End|Waypoints], Visited),
    TotalDistance is DistanceAcc + Distance.
	
%% The second clause tells that if there is a road between our first point and an intermediate point, 
%% we can take it and then solve get_road(intermediate, end).

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, Waypoint, Distance),
    \+ member(Waypoint, Waypoints),
    NewDistanceAcc is DistanceAcc + Distance,
    get_road(Waypoint, End, [Waypoint|Waypoints], NewDistanceAcc, Visited, TotalDistance).
