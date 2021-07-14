/*https://sqlzoo.net/wiki/More_JOIN_operations*/

/*List the films where the yr is 1962 [Show id, title]*/

select
  id,
  title
from movie
where
  yr = 1962
  
/*Give year of 'Citizen Kane'.*/

select
  yr
from movie
where 
  title = 'Citizen Kane'
  
/*List all of the Star Trek movies,
 include the id, title and yr (all of these movies include the words Star Trek in the title).
 Order results by year.*/
 
 
select
  id,
  title,
  yr
from movie
where 
  title like '%Star Trek%'
order by yr

/*What id number does the actor 'Glenn Close' have?*/

select
  id
from actor
where name = 'Glenn Close' 


/*What is the id of the film 'Casablanca'*/

select
  id
from movie
where
  title = 'Casablanca'
  
/*Obtain the cast list for 'Casablanca'.

what is a cast list?*/

select
  a.name 
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  m.id = 27
  
/*Obtain the cast list for the film 'Alien'*/

select
  a.name 
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  m.title = 'Alien'
  
/*List the films in which 'Harrison Ford' has appeared*/

select
  m.title
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  a.name = 'Harrison Ford'
  
/*List the films where 'Harrison Ford' has appeared - but not in the starring role.*/

select
  m.title
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  a.name = 'Harrison Ford' and
  c.ord != 1
  
/*List the films together with the leading star for all 1962 films.*/


select
  m.title,
  a.name
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  m.yr = 1962 and
  c.ord = 1
  
  
/*Which were the busiest years for 'Rock Hudson'
, show the year and the number of movies he made each
 year for any year in which he made more than 2 movies. */ 
 
select 
  yr,
  count(title) 
from movie
join casting on 
  movie.id=movieid
join actor on actorid=actor.id
where
  name='Rock Hudson'
group by yr
having count(title) > 2

/*List the film title and the leading actor for all of the films 'Julie Andrews' played in.*/

select
  m.title,
  a.name
  
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  c.ord = 1 and
  m.id in (
    select 
      m.id
    from movie m 
    join casting c on
      c.movieid = m.id
    join actor a on
      a.id = c.actorid
    where
      a.name = 'Julie Andrews')
	  


/*Obtain a list, in alphabetical order, 
of actors who've had at least 15 starring roles.*/

select
  a.name
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  c.ord = 1 
group by a.name
having count(a.name)>14

/*List the films released in the year 1978 ordered by 
the number of actors in the cast, then by title.*/

select
  m.title,
  count(a.name)
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  m.yr = 1978
group by m.title
order by count(a.name) desc,m.title

/*List all the people who have worked with 'Art Garfunkel'.*/


select
  
  a.name
  
from actor a 
join casting c on
  a.id = c.actorid
join movie m on 
  c.movieid = m.id
where 
  a.name !='Art Garfunkel' and 
  m.id in (
    select 
      m.id
    from movie m 
    join casting c on
      c.movieid = m.id
    join actor a on
      a.id = c.actorid
    where
      a.name = 'Art Garfunkel')