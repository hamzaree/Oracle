-- 1. List the customer number, the name, the phone number, and the city of customers.

select custno , custname , phone , city from customer;

-- 2. List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).

select custno, custname,phone , city  from customer
where state LIKE 'CO';

--3.	List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld).

select * from eventrequest
where estcost > 4000
order by dateheld;

--4. List the event number, the event date (DateHeld), and the estimated audience number with approved status and audience greater than 9000 or with pending status and audience greater than 7000.

select eventno , dateheld , estaudience from eventrequest
where (status like 'approved' and estcost > 9000)
    OR (status like 'pending'and estaudience > 7000);
    
--5. List the event number, event date (DateHeld), customer number and customer name of events placed in January 2018 by customers from Boulder.

select eventrequest.eventno, eventrequest.dateheld , customer.custno ,customer.custname 
   from eventrequest inner join customer 
   on eventrequest.custno=customer.custno
   where eventrequest.dateheld between '01-jan-2018' and '31-jan-2018';

--6. List the average number of resources used (NumberFld) by plan number. Include only location number L100.

select planno ,AVG(numberfld) from eventplanline
where locno like 'L100' 
group by planno
;

--7.	List the average number of resources used (NumberFld) by plan number. Only include location number L100. Eliminate plans with less than two event lines containing location number L100.

SELECT PlanNo, AVG(NumberFld) AS AvgNumResources, 
               COUNT(*) AS NumEventLines
  FROM EventPlanLine
  WHERE LocNo = 'L100'
  GROUP BY PlanNo
  HAVING COUNT(*) > 1;




