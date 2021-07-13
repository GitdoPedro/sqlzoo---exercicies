/*https://sqlzoo.net/wiki/The_JOIN_operation/


/*The first example shows the goal scored by a player with the last name 'Bender'.
 The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime*/
 
select 
  matchid,
  player
from goal
where 
  teamid = 'GER'
  

/*Show id, stadium, team1, team2 for just game 1012*/

select
  id,
  stadium,
  team1,
  team2
from game
where
  id = '1012'


/*Modify it to show the player, teamid, stadium and mdate for every German goal.*/

select
  goal.player,
  goal.teamid,
  game.stadium,
  game.mdate
from goal join game on
  goal.matchid = game.id
where
  goal.teamid = 'GER'

/*Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'*/


select 
  game.team1,
  game.team2,
  goal.player
from game join goal on
  game.id = goal.matchid
where
  goal.player like 'Mario%'

/*Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10*/

select
  g.player,
  g.teamid,
  e.coach,
  g.gtime
from goal g join eteam e on
  g.teamid = e.id
where
  g.gtime <=10

/*List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.*/


select 
  g.mdate,
  e.teamname
from game g join eteam e on
  g.team1 = e.id
where
  e.coach = 'Fernando Santos'

/*List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'*/

select 
  goal.player
from game join goal on
  game.id = goal.matchid
where
  game.stadium = 'National Stadium, Warsaw'

/*Instead show the name of all players who scored a goal against Germany.*/

select
   distinct goal.player
from game join goal on
  game.id = goal.matchid
where
  (game.team1 = 'GER' and goal.teamid != 'GER') or
  (game.team2 = 'GER' and goal.teamid != 'GER')


/*Show teamname and the total number of goals scored.*/

select 
  e.teamname,
  count(g.teamid) as gols
from goal g join eteam e on
  g.teamid  = e.id
group by e.teamname
order by gols desc

/*Show the stadium and the number of goals scored in each stadium.*/

select
  game.stadium,
  count(goal.matchid)
from game join goal on
  game.id = goal.matchid
group by game.stadium

/*For every match involving 'POL', show the matchid, date and the number of goals scored.*/

select 
  matchid,
  mdate,
  team1,
  team2,
  teamid
from game join goal on 
  matchid = id 
where
  team1 = 'POL' or team2 = 'POL'
  
  
/*For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'*/

select
  matchid,
  mdate,
  count(teamid)
from game join goal on
  matchid = id 
where 
  (team1 = 'GER' or team2 = 'GER') and
  teamid = 'GER'
group by matchid,mdate 
