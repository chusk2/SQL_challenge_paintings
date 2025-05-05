-- Active: 1742240169412@@51.77.141.159@3306@paintings
-- Solve the below SQL problems using the Famous Paintings & Museum dataset:

-- 1) Fetch all the paintings which are not displayed on any museums?
SELECT
    name as painting_name,
    full_name,
    w.style
from work w
join artist using (artist_id)
where museum_id IS NULL

order by full_name, painting_name ;

-- 2) Are there museums without any paintings?

select museum_id
from museum
where museum_id not in (select distinct museum_id from work) ;

-- 3) How many paintings have an asking price of more than their regular price?

select
    count(*)
from product_size
where sale_price > regular_price ;

-- 4) Identify the paintings whose asking price is less than 50% of its regular price.

select
    w.work_id,
    name as painting_name,
    a.full_name as artist,
    p.sale_price,
    p.regular_price
    
from product_size p
join work w using (work_id)
join artist a using (artist_id)

where sale_price < regular_price * 0.5 

order by artist, painting_name, sale_price;

-- 5) Which canva size costs the most?

select
    p.size_id,
    c.width,
    c.height,
    p.sale_price
from product_size p
join canvas_size c using (size_id)
where sale_price = (select max(sale_price) from product_size ) ;

-- 6) Delete duplicate records from work, product_size, subject and image_link tables.
-- The duplicates where removed during data cleaning, so this questions will not be answered using SQL

-- 7) Identify the museums with invalid information in the given dataset.

select *
from museum
where name || address || city || state || postal || country || phone || url is null ;

-- 8) museum_Hours table has 1 invalid entry. Identify it and remove it.
-- question already solved in the cleaning process

-- 9) Fetch the top 10 most famous painting subject.

select
    subject,
    count(*) as number_works
from subject
group by subject
order by count(*) desc
limit 10 ;

-- 10) Identify the museums which are open on both Sunday and Monday.

select
    mh.museum_id,
    m.name as museum,
    day as weekday,
    open as opening_time,
    close as closing_time
from museum_hours mh
join museum m using (museum_id)
where day in ('Sunday', 'Monday')
order by 2, 3 ;

-- 11) How many museums are open every single day?


select name 
from (
    select
        museum_id,
        name,
        count(distinct day) as days_open 
    from museum_hours
    join museum using (museum_id)
    group by museum_id
    having count(day) = 7 ) as s
order by 1;

-- 12) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum).

select
    m.name as museum,
    count(*) as number_paintings
from work
left join museum m using (museum_id)
where m.name is not null
group by 1
order by 2 desc
limit 5 ;

-- 13) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist).

select
    a.full_name as artist,
    count(*) as number_paintings
from work
left join artist a using (artist_id)
group by 1
order by 2 desc
limit 5 ;

-- 14) Display the 3 least popular canva sizes.

select
    c.size_id,
    c.height,
    c.width,
    count(work_id) as number_paintings
from product_size p
left join canvas_size c using (size_id)
where p.size_id is not null
group by 1,2, 3
order by 4
limit 3 ;

-- 15) Which museum is open for the longest during a day. Display museum name, state and hours open and which day?

select
    museum_id,
    name,
    state,
    day,
    open, close,
    round((TIME_TO_SEC(close) - TIME_TO_SEC(open) ) / 3600, 2) as hours_opened
from museum_hours
join museum using (museum_id)
order by 7 desc, 1
limit 5 ;

-- 16) Which museum has the most no of most popular painting style?

select style, count(*)
from work
where style is not null
group by 1
order by 2 desc
limit 5 ;

-- 17) Identify the artists whose paintings are displayed in multiple countries.
SELECT
    a.full_name as artist,
    count (distinct m.country) as num_countries_museums
    
from work
join museum m using (museum_id)
join artist a using (artist_id)
group by 1 
having count (m.country) > 1
order by 2 desc;

/* 18) Display the country and the city with most no of museums.
Output 2 separate columns to mention the city and country.
If there are multiple value, separate them with comma. */

with cte as (
    SELECT
        country,
        city,
        count(*) as museum_count
    from museum
    group by 1, 2
    order by 3 desc
    )
select * from cte
where museum_count = (
    select max(museum_count) from cte
    )
order by 1, 2  ;

/* 19) Identify the artist and the museum where the most expensive and least expensive painting is placed.
Display the artist name, sale_price, painting name, museum name, museum city and canvas label. */

with min_max_prices as (
    select min(sale_price) as sale_price from product_size
    UNION
    select max(sale_price) as sale_price from product_size
    )
select 
    a.full_name as artist,
    w.name as painting,
    m.name as museum,
    m.city as city,
    p.*
from product_size p
join work w using (work_id)
join artist a using (artist_id)
join museum m using (museum_id)
 
where sale_price in (select * from min_max_prices ) ;



select min(sale_price) as sale_price from product_size
    UNION
select max(sale_price) as sale_price from product_size ;

selectprice;


-- 20) Which country has the 5th highest no of paintings?

-- 21) Which are the 3 most popular and 3 least popular painting styles?

-- 22) Which artist has the most no of Portraits paintings outside USA? Display artist name, no of paintings and the artist nationality.
