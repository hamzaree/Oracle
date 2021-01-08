--1.List the city, state, and zip codes in the customer table.  Your result should not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)

select distinct city , customer.state ,zip from customer;

--2.List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.

select empname,department,email,phone from employee
where phone like '3-%';

--3.List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.

select * from resourcetbl
where rate between 10 and 20
order by rate ;

--4.List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2018. Include the event number, authorization date, and status in the output. (Hint: see the examples in Module 4 for date constants in Oracle and MySQL.)

select dateauth,eventno,status from eventrequest
where (status like 'approved' or status like 'denied')
    and dateauth between '01-jul-2018' and '31-jul-2018';
    
--5.List the location number and name of locations that are part of the “Basketball arena”.  Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”). Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

select locno,locname from location inner join facility 
on facility.facno=location.facno
where facility.facname like 'basketball arena';


--6.For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned.  For example, plan number “P100” has 4 lines and 7 resources assigned.  You only need to consider event plans that have at least one line.

select planno,count(*),sum(numberfld) from eventplanline
group by planno;









