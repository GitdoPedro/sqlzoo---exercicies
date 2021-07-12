/*https://sqlzoo.net/wiki/SUM_and_COUNT*/


/*Show the total population of the world.*/

select 
  sum(population)
from world

/*List all the continents - just once each.*/

select
  distinct continent
from world

/*Give the total GDP of Africa*/

select
  sum(gdp)
from world
where
  continent = 'Africa'
  
/*Count the big countries*/

select
  count(name)
from world
where 
  area >= 1000000
  
/*Baltic states population*/

select
  sum(population)
from world
where
  name in ('Estonia', 'Latvia', 'Lithuania')
  
/*For each continent show the continent and number of countries.*/

select 
  distinct continent,
  count(name)
from world
group by continent


/*For each continent show the continent and number of 
countries with populations of at least 10 million.*/


select 
  distinct continent,
  count(name)
from world
where 
  population >= 10000000
group by continent

/*List the continents that have a total population of at least 100 million.*/


select
  distinct continent
from world
group by continent
having sum(population) >= 100000000