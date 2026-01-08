drop view if exists purchases_info;

create view purchases_info as
select
	*,
    case
		when date_end < '2021-04-01' then 0
        when date_end > '2021-06-30' then 0
        else 1
	end as paid_q2_2021,
    case
		when date_end < '2022-04-01' then 0
        when date_end > '2022-06-30' then 0
        else 1
	end as paid_q2_2022
from
(select
	purchase_id,
    student_id,
    plan_id,
    date_start,
    if(date_refunded is null,
		date_end,
        date_refunded) as date_end
from
(select
	purchase_id,
    student_id,
    plan_id,
    date_purchased as date_start,
    case
		when plan_id = 0 then date_add(date_purchased, interval 1 month)
        when plan_id = 1 then date_add(date_purchased, interval 3 month)
        when plan_id = 2 then date_add(date_purchased, interval 12 month)
        when plan_id = 3 then null
	end as date_end,
    date_refunded
from
	student_purchases) a) b;
    
select * from purchases_info;
