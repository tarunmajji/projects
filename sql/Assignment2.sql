Tasks to be performed:
1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.
2. Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.
3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating.
4. Find the Ceil, floor and absolute values of the rating column and display the current date
and separately display the year, month_name and day.
5. Display the restaurant type and total average cost using rollu



SOLUTIONS:-
----------
1)
create  function today(@new varchar(max))
returns varchar(max)
as
begin
declare @total varchar(max)
set @total=stuff(@new,6,0,' chicken ')
return @total
end

select dbo.today ('quick bites')

-------OR-----------

create function one(@para varchar(max))
returns varchar(max)
as
begin
return (select stuff(@para,6,0,' chicken '))
end
 
 select dbo.one('quick bites');
2)
create  function max_rating()
returns table
as
return(select restaurant_name,cuisines_type  from zomato where num_of_ratings=(SELECT MAX(num_of_ratings) FROM zomato))

3)
select rate_out_of_5, case 
when rate_out_of_5>=4 then 'excellent'
when rate_out_of_5 >=3.5 and rate_out_of_5<5 then 'good'
when rate_out_of_5>3 and rate_out_of_5<=3.5 then 'average'
else
'bad'
end as rating_status
from zomato where rate_out_of_5>=4;

4)
select ceiling(rate_out_of_5) as tp,floor(rate_out_of_5) as bottom,abs(rate_out_of_5) as absolute_value from zomato;
 
 select getdate() as c_date ,year(getdate()) as c_year,datename(month,getdate()) as c_month,day(getdate()) as c_day;

5)
select coalesce (restaurant_type,'total_avg_salary'),avg(avg_cost_two_people) from zomato group by ( restaurant_type) with rollup;





























