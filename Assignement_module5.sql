

--SELECT Statement Problems
--1.For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.  Only include event requests in the result if the event request has more than one related event plan with a work date in December 2018.

select eventrequest.eventno , dateheld , count(planno) as "count of the event plans"
from eventrequest , eventplan
where eventrequest.eventno = eventplan.eventno
and eventplan.workdate between '01-dec-2018' and '31-dec-2018'
group by eventrequest.eventno ,eventrequest.dateheld
having count(planno) >1
;
--2.List the plan number, event number, work date, and activity of event plans meeting the following two conditions: (1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”.  Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

select planno , eventplan.eventno , workdate , activity 
from eventplan , eventrequest , facility
where eventplan.eventno = eventrequest.eventno
and eventrequest.facno = facility.facno
and workdate between '01-dec-2018' and '31-dec-2018'
and facility.facname = 'Basketball arena'
;

--3.List the event number, event date, status, and estimated cost of events where there is an event plan managed by Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.  Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE clause. Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.

select eventrequest.eventno , dateheld , estcost 
from eventrequest,facility,employee,eventplan
where eventrequest.eventno = eventplan.eventno
and eventrequest.facno = facility.facno
and eventplan.empno = employee.empno
and employee.empname ='Mary Manager'
and facility.facname = 'Basketball arena'
and dateheld BETWEEN '01-oct-2018' and '31-dec-2018'
;
 --4.List the plan number, line number, resource name, number of resources (eventplanline.number), location name, time start, and time end where the event is held at the basketball arena, the event plan has activity of activity of “Operation”, and the event plan has a work date in the period October 1 to December 31, 2018.  Your query must not use the 
 
 select eventplanline.planno ,lineno,resname , numberfld , locname , timestart, timeend
 from eventplanline,resourcetbl,location,facility,eventplan
 where eventplanline.resno=resourcetbl.resno
 and eventplanline.locno = location.locno
 and facility.facno = location.facno
 and eventplan.planno = eventplanline.planno
 and facname = 'Basketball Arena'
 and activity = 'operation'
 and workdate BETWEEN '01-oct-2018' and '31-dec-2018';
 
 
 --Database Modification Problems
 --1.Insert a new row into the Facility table with facility name “Swimming Pool”.
 select * from facility;
 insert into facility
 (facno,facname)
 values ('F104','Swimming Pool');
 
 
 --2.Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Door” for the location name.
 select * from location;
insert into location
(facno ,locno,locname)
values ('F104','L107','Door');

--3.Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Locker Room” for the location name.
insert into location
(facno ,locno,locname)
values ('F104','L108','Locker Room');

--4.Change the location name of “Door” to “Gate” for the row inserted in modification problem 
update location
set locname= 'Gate'
where locno ='L107';

--5.Delete the row inserted in modification problem 3.

delete from location
where locname = 'Locker Room';


--SQL Statements with Errors and Poor Formatting
--1.Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.

SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  and eventplan.eventno=eventrequest.eventno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';
  
  
--2.Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.


SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno ;


--3.Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the error.
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility
WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' ;
  
--4.Identify errors in the following SQL statement and label errors with error type (syntax, redundancy, or semantic). To simplify your work, the statement has only one type of error. Rewrite the statement to remove the errors.

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
  
--5.Identify areas in which the SQL statement has poor coding practices and rewrite the statement to improve the coding practices. You do not need to search for errors.
  
SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
FROM eventrequest, facility, eventplan, eventplanline, resourcetbl
WHERE estaudience = '10000'
AND eventplan.planno = eventplanline.planno 
AND eventrequest.facno = facility.facno
AND  eventplanline.resno = resourcetbl.resno
AND eventrequest.eventno = eventplan.eventno 
AND facname = 'Basketball arena' ;










