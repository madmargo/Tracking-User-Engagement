drop view if exists purchases_info;

create view purchases_info as
select
	*,
    case
		when date_start <= '2021-06-30' and (date_end >= '2021-04-01' or date_end is null)
        then 1 
        else 0
	end as paid_q2_2021,
    case
		when date_start <= '2022-06-30' and (date_end >= '2022-04-01' or date_end is null)
        then 1
        else 0
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

select
	a.student_id,
    a.minutes_watched,
    if(max(i.paid_q2_2022) = 1, 1, 0) as paid_in_q2
from
(select
	student_id,
    round(sum(seconds_watched) / 60, 2) as minutes_watched
from
	student_video_watched
where
	date_watched between '2022-04-01' and '2022-06-30'
group by
	student_id) a
left join 
	purchases_info i on a.student_id = i.student_id
group by
	a.student_id
having
	paid_in_q2 = 1;
    
select
	a.student_id,
    round(sum(seconds_watched) / 60, 2), 0 as minutes_watched,
    a.certificates_issued
from
(select
	student_id,
    count(certificate_id) as certificates_issued
from
	student_certificates
group by
	student_id) a
    left join student_video_watched w on a.student_id = w.student_id
group by
	student_id;
    
