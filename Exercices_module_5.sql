--1.List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events placed by Boulder customers.

select eventno,dateheld,eventrequest.custno,custname,eventrequest.facno,facname 
from eventrequest,facility,customer
where eventrequest.custno = customer.custno
and eventrequest.facno=  facility.facno
and city like 'Boulder'
and dateheld between '01-jan-2018'and '31-dec-2018';

--2.List the customer number, customer name, event number, date held, facility number, facility name, and estimated audience cost per person (EstCost / EstAudience) for events held on 2018, in which the estimated cost per person is less than $0.2

select eventno,dateheld,eventrequest.custno,custname,eventrequest.facno,facname , (estcost / estaudience) as estaudienceperperson
from eventrequest,facility,customer
where eventrequest.custno = customer.custno
and eventrequest.facno=  facility.facno
and (estcost / estaudience)<0.2
and dateheld between '01-jan-2018'and '31-dec-2018' ;

--3.List the customer number, customer name, and total estimated costs for Approved events. The total amount of events is the sum of the estimated cost for each event. Group the results by customer number and customer name.

select customer.custno , custname ,sum(estcost) 
from customer , eventrequest
where customer.custno = eventrequest.custno
and status like 'Approved'
group by customer.custno ,customer.custname ;

--4.Insert yourself as a new row in the Customer table.

insert into customer 
(custno , custname , address , internal , contact , phone , city , state , zip)
values 
('C102','Soccer','hay sadiq' ,'Y','Madouch mohammed','2568100' , 'fess','FC' , '80012');


--5.Increase the rate by 10 percent of resource names equal to nurse.

update resourcetbl
set rate=rate*1.1
WHERE resname='nurse';

--6.Delete the new row added to the Customer table.


delete from customer 
where custno ='C102';





