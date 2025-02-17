1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.
2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.
3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.
4. Use the while loop to display the 1 to 50.
5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.
6. Write a trigger that sends an email notification to the restaurant owner whenever a new
record is inserted
-------------------------------------------------
SOLUTIONS:-
------------

1)
create proc usp_restaurants
as 
( 
select restaurant_name,restaurant_type, cuisines_type from zomato where table_booking !=0
)

2)
begin transaction
update zomato set cuisines_type='cafeteria' where cuisines_type='cafe'
rollback transaction

3)
select  top 5  row_number() over(order by rate_out_of_5 desc) as Top_restaurant, restaurant_name,rate_out_of_5,area from zomato 

4)
declare @counter int=1
while @counter<=50
begin
print @counter
set @counter=@counter+1
end;

5)
create view vw_top_view
as
(
select top 5 restaurant_name, rate_out_of_5 from zomato order by rate_out_of_5 desc
)

select * from vw_top_view

6) --createing Audit table

CREATE TABLE AuditLog 
(
    Logname varchar(30),
    LogMessage VARCHAR(MAX)
);
--creating trigger function
create trigger tg_newitem on  zomato
for insert
as begin
declare @name varchar(30);
declare @itemtype varchar(30);
select @name=name,@itemtype=item_type  from inserted;

 insert into Auditlog(Logname,Logmessage)
 values('a new record inserted ,the new record name  is ' + @name +'and item type is', @itemtype)
 end;

 


























