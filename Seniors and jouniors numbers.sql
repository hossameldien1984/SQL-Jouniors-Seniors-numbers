use my_tasks;
with seniors_cnt as (
select scnt as seniors,50000-rt as budget_remain
from(
select row_number() over (order by salary) as scnt
,sum(salary) over (order by id) as rt
from candidates
where position='senior'
) as q1
where rt <=50000
order by rt desc
limit 1
)
 select max(jcnt) as Juniors, seniors as Seniors
 from(
 select row_number() over (order by salary) as jcnt
,sum(salary) over (order by id) as rt
from candidates
where position='junior'
 )q2,seniors_cnt
 where q2.rt<= budget_remain;
