-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

--List each country name where the population is larger than that of 'Russia'.

select
 name
from world
where
 population >(
   select
     population
   from world
   where 
      name='Russia'
)
	  

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

select
  name
from world
where
  continent = 'Europe' and
  gdp/population >(
    select 
      gdp/population
    from world
    where 
      name = 'United Kingdom'
)
	 
--List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

select 
  name,
  continent
from world
where 
  continent in(
    select 
      continent
    from world
    where 
      name in (
	    'Argentina' , 
		'Australia'
	)
)

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.

select
  name,
  population
from world
where
  population > (
    select 
      population
    from world
    where 
      name = 'Canada') and
  population < (
    select 
      population
    from world
    where 
      name = 'Poland') 
	  

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select
  name,
  concat(round((population*100)/(
  select 
     population
  from world
  where
    name = 'Germany'
   ),0),'%') as percentage
from world
where
  continent = 'Europe'
  
-- Which countries have a GDP greater than every country in Europe?

select
  name
from world
where gdp > (
  select 
    max(gdp)
  from world
  where 
    continent = 'Europe'
) 