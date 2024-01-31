room("2.70.0.10").   
room("2.70.0.11").  
room_capacity("2.70.0.10", 48). 
room_capacity("2.70.0.11", 60).  
course(("AI", v)).
course(("AI", u)).
course_size(("AI", v), 50).
course_size(("AI", u), 50).   
consecutive(("AI", v), ("AI", u)). 
availability_course(42, ("AI", v)).
availability_room(42, "2.70.0.11"). 
availability_day(42, fr). 
availability_time(42, 10). 
availability_course(43, ("AI", u)).
availability_room(43, "2.70.0.10"). 
availability_day(43, mo). 
availability_time(43, 12). 
availability_course(44, ("AI", u)).
availability_room(44, "2.70.0.11"). 
availability_day(44, fr). 
availability_time(44, 12). 
book(42, ("AI", v)) :- availability_course(42, ("AI", v)).
book(43, ("AI", u)) :- availability_course(43, ("AI", u)), 
                       not book(44, ("AI", u)).
book(44, ("AI", u)) :- availability_course(44, ("AI", u)), 
                       not book(43, ("AI", u)).
conflict(consecutive, ((42, ("AI", v)), (43, ("AI", u)))) :- 
                            book(42, ("AI", v)), book(43, ("AI", u)), 
                            consecutive(("AI", v), ("AI", u)), 
                            availability_day(42, fr), 
                            not availability_day(43, fr). 
conflict :- conflict(consecutive, ((42, ("AI", v)), (43, ("AI", u)))), 
            not conflict.