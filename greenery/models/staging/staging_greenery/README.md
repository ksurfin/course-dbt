How many users do we have ? 

select count(distinct(user_id))
from dbt.dbt_kenny_s.stg_users

130

On average, how many orders do we receive per hour?

WITH orders_by_hour AS( 
SELECT date_trunc('hour', created_at) as hour_cohort,
count(order_id) as total_orders
FROM dbt.dbt_kenny_s.stg_orders
GROUP by 1)
SELECT avg(total_orders) from orders_by_hour

7.52

On average, how long does an order take from being placed to being delivered?

WITH orders_time_to_delivery as (
select order_id, delivered_at - created_at as time_to_delivery
FROM dbt.dbt_kenny_s.stg_orders
where status = 'delivered')
select avg(time_to_delivery) 
from orders_time_to_delivery

3 days 21 hours 24 minutes and 11 seconds

How many users have only made one purchase? Two purchases? Three+ purchases?

Queries
WITH user_order_count as (
select user_id, count(distinct(order_id)) as num_orders
from dbt.dbt_kenny_s.stg_orders
group by user_id)
select count(user_id)
from user_order_count
where num_orders = 1

WITH user_order_count as (
select user_id, count(distinct(order_id)) as num_orders
from dbt.dbt_kenny_s.stg_orders
group by user_id)
select count(user_id)
from user_order_count
where num_orders = 2

select user_id, count(distinct(order_id)) as num_orders
from dbt.dbt_kenny_s.stg_orders
group by user_id)
select count(user_id)
from user_order_count
where num_orders >=3

25 users have made one purchase only, 28 users have made two purchases only, and 71 users have made 3+ purchases.

On average, how many unique sessions do we have per hour?

with sessions_by_hour as (
select date_trunc('hour',created_at), 
count(distinct(session_id)) as num_sessions
from dbt.dbt_kenny_s.stg_events
group by date_trunc('hour',created_at)
)
select avg(num_sessions)
from sessions_by_hour

16.32 sessions per hour