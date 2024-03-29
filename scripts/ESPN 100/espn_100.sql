SELECT *
FROM espn_100

--1. How many players are in this database?--
SELECT COUNT(*)
FROM espn_100

-- Answer: There are 1596 basketball players / ESPN 100 recruits in this database.

--2. Which position has the most ESPN 100 recruits?--

SELECT pos, COUNT(pos) AS number_of_players
FROM espn_100
GROUP BY pos
ORDER BY number_of_players DESC

-- Answer: Shooting Guard (SG) has the most ESPN 100 recurits with 358
-- Note: Center (C) has the least ESPN 100 recruits with 233


--3a. What is the highest grade a ESPN 100 recruit has received?--

SELECT MAX(grade)
FROM espn_100

-- Answer: The highest grade an ESPN 100 Recruit recieved was 99.

--3b. How many players have this grade?--

SELECT COUNT(*)
FROM espn_100
WHERE grade = '99'

-- Answer: Two players have recieved a grade of 99

--3c. Let's see who these players are:--

SELECT *
FROM espn_100
WHERE grade = '99'

--Answer: Kevin Love & Brandon Jennings

--4a. What is the lowest grade an ESPN 100 recruit has received?--

SELECT MIN(grade)
FROM espn_100

-- Answer: The lowest grade an ESPN 100 Recruit recieved was 80.

--4b. How many players have this grade?--

SELECT COUNT(*)
FROM espn_100
WHERE grade = '80'

-- Answer: Thirteen players have recieved a grade of 80

--Let's see who these players are:--

SELECT *
FROM espn_100
WHERE grade = '80'

-- Answer: Elijah Stewart, Payton Dastrup, Justin Tillman, Josh Cunningham, Mamadi Diakite, Jalen Bridges
-- Answer (cont.):Franck Kepnang, Trey Patterson, Alex Fudge, Ben Gregg, Mac Etienne, Jordan Nesbitt

-- 5. Which city has the most ESPN 100 recruits?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer: Chicago, IL has produced the most ESPN 100 recruits with 35.

--6. Which state has the most ESPN 100 recruits?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
GROUP BY state
ORDER BY number_of_players DESC

-- Answer: California has produced the most ESPN 100 recruits with 141.

--7. Which high school has produced the most ESPN 100 recruits?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Oak Hill Academy has produced the most ESPN 100 players with 39.

--8. What type of high school has produced the most ESPN 100 recruits?--

SELECT hs_type, COUNT(hs_type) AS number_of_players
FROM espn_100
GROUP BY hs_type
ORDER BY number_of_players DESC

-- Answer: Public schools produced the most ESPN 100 recruits with 757.
-- Note: Private school came in a close second with 669 recruits and reform school had the lowest with 1.


--9. What type of high school affiliation has produced the most ESPN 100 recruits?--

SELECT hs_affiliation_type, COUNT(hs_affiliation_type) AS number_of_players
FROM espn_100
GROUP BY hs_affiliation_type
ORDER BY number_of_players DESC

-- Answer: Public high school affiliation produced the most ESPN 100 recruits.
-- Note: Performance Arts, Reform and Online high school affiliations were tied for the least with 1 recruit.

--10. What college has the most ESPN 100 recruits--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
GROUP BY school
ORDER BY college_commits DESC

-- Answer: Kentucky has the most ESPN 100 recruits with 70.

--11. Which NCAA conference has the most ESPN 100 recruits?--

SELECT conference, COUNT(conference) AS number_of_players
FROM espn_100
WHERE conference IS NOT NULL 
GROUP BY conference
ORDER BY number_of_players DESC

-- Answer: The ACC has the most ESPN 100 Recruits with 307.
-- Note: The SEC came in a close second with 302.
-- Note: The Big Weast, Southern, AEC, and MEAC were tied for the least recruits with 1.


--12. What type of NCAA conference the most ESPN 100 recruits?--

SELECT conference_type, COUNT(conference_type) AS number_of_players
FROM espn_100
WHERE conference_type IS NOT NULL
GROUP BY conference_type
ORDER BY number_of_players DESC

-- Answer: The Power 5 conferences had the most recruits with 1204.
-- Note: The Mid-Major conferences had the least with 126
-- Note: The Big East Conference is considered as "Other" since they're considered a power conference in Basketball only.



--13. Let's find all the #1 recruits--
SELECT class, player, pos, hometown, high_school, height, weight, grade, school, mcdonalds_aa, jbc
FROM espn_100
WHERE Rank = '1'

--Answer: Run Code Above in SQL

--14. Let's find all the unsigned and uncommited players--

--How many players are unsigned and/or uncommitted?--

SELECT COUNT(*)
FROM espn_100
WHERE school = 'Unsigned/Uncommitted'

--Answer: There are 42 players that were unsigned and/or uncommitted.

--14b. Let's see who these players are--

SELECT *
FROM espn_100
WHERE school = 'Unsigned/Uncommitted'

--Answer: Run Code Above in SQL


--15. Let's Find All the players that were McDonald's All-Americans--

--First the total number of players--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE

-- Answer: There are 384 McDonald's All-Americans.

--15b. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE

--Answer: Run Code Above in SQL


--16. Let's Find All the players that were Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE

-- Answer: There are 377 Jordan Brand Classic Participants.

--16b.Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE

--Answer: Run Code Above in SQL


--17. Let's Find All the players that were either McDonald's All-Americans or Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE

-- Answer: There are 498 players that particpated in either the McDonald's All-American Game or Jordan Brand Classic.

--17b. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE

--Answer: Run Code Above in SQL


--18. Let's Find All the players that were McDonald's All-Americans and Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE

-- Answer: There are 263 players that were both McDonald's All-American and Jordan Brand Classic participants.

--18b. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE

--Answer: Run Code Above in SQL

--19. How many ESPN 100 recruits are named Michael?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Michael%'

--Answer: There are 12 players named Michael

--19b. Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Michael%'

--Answer: Run Code Above in SQL

--20. How many ESPN 100 recruits are named Jalen?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Jalen%'

--Answer: There are 21 players named Jalen

--20b. Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Jalen%'

--Answer: Run Code Above in SQL

--21. How many ESPN 100 recruits are named Anthony?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Anthony%'

--Answer: There are 15 players named Anthony.

--21b. Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Anthony%'

--Answer: Run Code Above in SQL

--22. What is the most popular First Name?--

SELECT first_name, COUNT(first_name) AS players
FROM espn_100
GROUP BY first_name
ORDER BY players DESC

-- Answer: Jordan and Jalen are tied for the most popular first name at 21.
-- Note: Brandon was second with 19, followed by Isaiah with 16, and Chris & Josh with 15.

--23. What is the most popular Last Name?--

SELECT last_name, COUNT(last_name) AS players
FROM espn_100
GROUP BY last_name
ORDER BY players DESC

-- Answer: Johnson is the most popular last name with 35.
-- Note: Williams was second with 26 and Jones was third with 21.

--24. Let's look into the Point Guard position--
SELECT *
FROM espn_100
WHERE pos = 'PG'

-- Answer:  Run Code Above in SQL

--24b. What is the highest grade an ESPN 100 PG received?--

SELECT MAX(grade)
FROM espn_100
WHERE pos = 'PG'

-- Answer: 99

--24c. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '99'
AND pos = 'PG'

-- Answer: Brandon Jennings

--24d. What is the lowsest grade an ESPN 100 PG received?--

SELECT MIN(grade)
FROM espn_100
WHERE pos = 'PG'

-- Answer: 80

--24e. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '80'
AND pos = 'PG'

-- Answer: Riley LaChance


--24f. Which city has the most ESPN 100 PGs?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
WHERE pos = 'PG'
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer:Detroit, MI has produced the most ESPN 100 PGs with 7.

--24g. Which state has the most ESPN 100 PGs?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
WHERE pos = 'PG'
GROUP BY state
ORDER BY number_of_players DESC

-- Answer: California and Texas produced the most ESPN 100 PG with 26 each.

--24h. Which high school has produced the most ESPN 100 Point Guards?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
WHERE pos = 'PG'
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Oak Hill & Montverde Academy produced the most ESPN 100 PG with 8 each.

--24i. What college has the most ESPN PGs--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
WHERE pos = 'PG'
GROUP BY school
ORDER BY college_commits DESC

-- Answer: Kentucky has the most ESPN 100 PGs with 14 .

--24j. How many PGs were McDonald's All-Americans?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'PG'

-- Answer:75 McDonald's All-Americans were PGs.

--24k. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'PG'

--Answer: Run Code Above in SQL

--24l. How many PGs played in the Jordan Brand Classic?--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE
AND pos = 'PG'

-- Answer: 71 Jordan Brand Classic Participants were PGs.

--24m. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE
AND pos = 'PG'

--Answer: Run Code Above in SQL


--24n. How many PGs were a McDonald's All-American or Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'PG'

-- Answer: 403 players that participated in either the McDonald's All-American Game or Jordan Brand Classic were PGs.

--24o. How many PGs were a McDonald's All-American and Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'PG'

-- Answer: 52 players that participated in both the McDonald's All-American Game and Jordan Brand Classic were PGs.


--24p. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'PG'

--Answer: Run Code Above in SQL


--25. Let's look into the Shooting Guard position--
SELECT *
FROM espn_100
WHERE pos = 'SG'

-- Answer:  Run Code Above in SQL

--25b. What is the highest grade an ESPN 100 SG received?--

SELECT MAX(grade)
FROM espn_100
WHERE pos = 'SG'

-- Answer: 98

--25c. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '98'
AND pos = 'SG'

-- Answer: Multiple Players (Run Code Above in SQL)

--25d. What is the lowest grade an ESPN 100 SG received?--

SELECT MIN(grade)
FROM espn_100
WHERE pos = 'SG'

-- Answer: 80

--25e. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '80'
AND pos = 'SG'

-- Answer: Elijah Stewart


--25f. Which city has the most ESPN 100 SGs?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
WHERE pos = 'SG'
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer: Chicago, IL has produced the most ESPN 100 SGs with 10.

--25g. Which state has the most ESPN 100 SGs?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
WHERE pos = 'SG'
GROUP BY state
ORDER BY number_of_players DESC

-- Answer: California has produced the most ESPN 100 SG with 36.

--25h. Which high school has produced the most ESPN 100 Shooting Guards?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
WHERE pos = 'SG'
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Oak Hill Academy has produced the most ESPN 100 SG with 11.

--25i. What college has the most ESPN SGs--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
WHERE pos = 'SG'
GROUP BY school
ORDER BY college_commits DESC

-- Answer: Duke has the most ESPN 100 SGs with 14.

--25j. How many SGs were McDonald's All-Americans?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'SG'

-- Answer: 84 McDonald's All-Americans were SGs.

--25k. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'SG'

--Answer: Run Code Above in SQL

--25l. How many SGs played in the Jordan Brand Classic?--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE
AND pos = 'SG'

-- Answer: 90 Jordan Brand Classic Participants were SGs.

--25m. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE
AND pos = 'SG'

--Answer: Run Code Above in SQL


--25n. How many SGs were a McDonald's All-American or Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'SG'

-- Answer: 414 players that participated in either the McDonald's All-American Game or Jordan Brand Classic were SGs.

--25o. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'SG'

--Answer: Run Code Above in SQL

--25p. How many SGs were a McDonald's All-American or Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'SG'

-- Answer: 60 players that participated in both the McDonald's All-American Game and Jordan Brand Classic were SGs.

--25q. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'SG'

--Answer: Run Code Above in SQL


--26. Let's look into the Small Forward position--
SELECT *
FROM espn_100
WHERE pos = 'SF'

-- Answer:  Run Code Above in SQL

--26b. What is the highest grade an ESPN 100 SF received?--

SELECT MAX(grade)
FROM espn_100
WHERE pos = 'SF'

-- Answer: 98

--26c. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '98'
AND pos = 'SF'

-- Answer: Kyle Singler, Jordan Hamilton, Harrison Barnes, Michael Gilchrist, Shabazz Muhammad

--26d. What is the lowest grade an ESPN 100 SF received?--

SELECT MIN(grade)
FROM espn_100
WHERE pos = 'SF'

-- Answer: 80

--26e. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '80'
AND pos = 'SF'

-- Answer: Jalen Bridges, Alex Fudge, Jordan Nesbitt


--26f. Which city has the most ESPN 100 SFs?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
WHERE pos = 'SF'
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer: Chicago, IL has produced the most ESPN 100 SFs with 8.

--26g. Which state has the most ESPN 100 SFs?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
WHERE pos = 'SF'
GROUP BY state
ORDER BY number_of_players DESC

-- Answer:California has produced the most ESPN 100 SF with 30.

--26h. Which high school has produced the most ESPN 100 Small Forwards?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
WHERE pos = 'SF'
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Oak Hill Academy has produced the most ESPN 100 SF with 12.

--26i. What college has the most ESPN SFs--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
WHERE pos = 'SF'
GROUP BY school
ORDER BY college_commits DESC

-- Answer:Duke has the most ESPN 100 SFs with 16.

--26j. How many SFs were McDonald's All-Americans?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'SF'

-- Answer: 69 McDonald's All-Americans were SFs.

--26k. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'SF'

--Answer: Run Code Above in SQL

--26l. How many SFs played in the Jordan Brand Classic?--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE
AND pos = 'SF'

-- Answer: 79 Jordan Brand Classic Participants were SFs.

--26m. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE
AND pos = 'SF'

--Answer: Run Code Above in SQL


--26n. How many SFs were a McDonald's All-American and Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'SF'

-- Answer: 412 players that participated in either the McDonald's All-American Game or Jordan Brand Classic were SFs.

--26o. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'SF'

--Answer: Run Code Above in SQL

--26p. How many SFs were a McDonald's All-American and Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'SF'

-- Answer: 51 players that participated in both the McDonald's All-American Game and Jordan Brand Classic were SFs.

--26q. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'SF'

--Answer: Run Code Above in SQL

--27. Let's look into the Power Foward position--
SELECT *
FROM espn_100
WHERE pos = 'PF'

-- Answer:  Run Code Above in SQL

--27b. What is the highest grade an ESPN 100 PF received?--

SELECT MAX(grade)
FROM espn_100
WHERE pos = 'SG'

-- Answer: 98

--27c. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '98'
AND pos = 'PF'

-- Answer: Multiple Players (Run Code Above in SQL)

--27d. What is the lowest grade an ESPN 100 PF received?--

SELECT MIN(grade)
FROM espn_100
WHERE pos = 'PF'

-- Answer: 80

--27e. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '80'
AND pos = 'PF'

-- Answer: Justin Tillman, Josh Cunningham, Mamadi Diakite, Trey Patterson, Ben Gregg


--27f. Which city has the most ESPN 100 PFs?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
WHERE pos = 'PF'
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer: Chicago, IL has produced the most ESPN 100 PFs with.

--27g. Which state has the most ESPN 100 PFs?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
WHERE pos = 'PF'
GROUP BY state
ORDER BY number_of_players DESC

-- Answer: Florida has produced the most ESPN 100 PF with 33.

--27h. Which high school has produced the most ESPN 100 Power Forwards?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
WHERE pos = 'PF'
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Brewster Academy has produced the most ESPN 100 PF with 11.

--27i. What college has the most ESPN PFs?--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
WHERE pos = 'PF'
GROUP BY school
ORDER BY college_commits DESC

-- Answer: Kentucky has the most ESPN 100 PFs with 18.

--27j. How many PFs were McDonald's All-Americans?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'PF'

-- Answer: 93 McDonald's All-Americans were PFs.

--27k. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'PF'

--Answer: Run Code Above in SQL

--27l. How many PFs played in the Jordan Brand Classic?--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE
AND pos = 'PF'

-- Answer: 81 Jordan Brand Classic Participants were PFs.

--27m. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE
AND pos = 'PF'

--Answer: Run Code Above in SQL


--27n. How many PFs were a McDonald's All-American or Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'PF'

-- Answer: 406 players that participated in either the McDonald's All-American Game or Jordan Brand Classic were PFs.

--27o. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'PF'

--Answer: Run Code Above in SQL

--27p. How many PFs were both a McDonald's All-American an Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'PF'

-- Answer: 59 players that participated in both the McDonald's All-American Game and Jordan Brand Classic were PFs.

--27q. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'PF'

--Answer: Run Code Above in SQL


--28. Let's look into the Center position--
SELECT *
FROM espn_100
WHERE pos = 'C'

-- Answer:  Run Code Above in SQL

--28b. What is the highest grade an ESPN 100 Center received?--

SELECT MAX(grade)
FROM espn_100
WHERE pos = 'C'

-- Answer: 99

--28c. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '99'
AND pos = 'C'

-- Answer: Kevin Love

--28d. What is the lowest grade an ESPN 100 Center received?--

SELECT MIN(grade)
FROM espn_100
WHERE pos = 'C'

-- Answer: 80

--28e. Which player(s) received this grade?--

SELECT *
FROM espn_100
WHERE grade = '80'
AND pos = 'C'

-- Answer: Payton Dastrup, Franck Kepnang, Mac Etienne


--28f. Which city has the most ESPN 100 Centers?--

SELECT hometown, COUNT(hometown) AS number_of_players
FROM espn_100
WHERE pos = 'C'
GROUP BY hometown
ORDER BY number_of_players DESC

-- Answer: Philadelphia, PA has produced the most ESPN 100 Centers with 8.

--28g. Which state has the most ESPN 100 Centers?--

SELECT state, COUNT(state) AS number_of_players
FROM espn_100
WHERE pos = 'C'
GROUP BY state
ORDER BY number_of_players DESC

-- Answer: Texas has produced the most ESPN 100 Centers with 22.

--28h. Which high school has produced the most ESPN 100 Centers?--

SELECT high_school, COUNT(high_school) AS number_of_players
FROM espn_100
WHERE pos = 'C'
GROUP BY high_school
ORDER BY number_of_players DESC

-- Answer: Montverde Academy has produced the most ESPN 100 Centers with 11.

--28i. What college has the most ESPN Centers--

SELECT school, COUNT(school) AS college_commits
FROM espn_100
WHERE pos = 'C'
GROUP BY school
ORDER BY college_commits DESC

-- Answer: Kentucky has the most ESPN 100 Centers with 12.

--28j. How many Centers were McDonald's All-Americans?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'PG'

-- Answer: 75 McDonald's All-Americans were Centers.

--28k. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND pos = 'C'

--Answer: Run Code Above in SQL

--28l. How many Centers played in the Jordan Brand Classic?--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE
AND pos = 'C'

-- Answer: 56 Jordan Brand Classic Participants were Centers.

--28m. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE
AND pos = 'C'

--Answer: Run Code Above in SQL


--28n. How many Centers were a McDonald's All-American or Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'C'

-- Answer: 399 players that participated in either the McDonald's All-American Game or Jordan Brand Classic were Centers.

--28o. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE
AND pos = 'C'

--Answer: Run Code Above in SQL


--28p. How many Centers were both a McDonald's All-American and Jordan Brand Classic Participant?--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'C'

-- Answer: 41 players that participated in both the McDonald's All-American Game and Jordan Brand Classic were Centers.

--28q. Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE
AND pos = 'C'

--Answer: Run Code Above in SQL

