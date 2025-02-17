
1. Insert a new record in your Orders table.

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.

3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.

4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.

5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.

6. Using right join fetch all the results from Salesman and Orders table


SOLUTIONS:-
------------

1)insert into Orders values( 5005,7654,124,'2024-06-28',5000);

2)alter table salesman alter column salesmanid int not null;
alter table salesman add constraint salesmanid primary key(salesmanid);--adding primary key constraint

alter table salesman add constraint city default 'delhi' for city;--adding default constraint

alter table customer with nocheck add constraint salesman_id  foreign key (salesmanid) references salesman(salesmanid);--adding foreign key constraint
alter table customer alter column customername varchar(40) not null; --adding primary key constraint


3)select * from Customer where CustomerName like '%N' and PurchaseAmount>500;



4)select (salesmanid)from Salesman union select(salesmanid)from customer;
                  
select(salesmanid)from salesman union all select(salesmanid)from customer;


5)select orderdate,name,customername,PurchaseAmount from customer c join salesman s on c.SalesmanId=s.salesmanid 
join orders o on c.SalesmanId=o.SalesmanId where PurchaseAmount  between 500 and 1500;


6)select * from salesman right join orders on salesman.salesmanid=orders.salesmanid;