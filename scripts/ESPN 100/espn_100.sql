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



--Let's find all the #1 recruits--
SELECT class, player, pos, hometown, high_school, height, weight, grade, school, mcdonalds_aa, jbc
FROM espn_100
WHERE Rank = '1'

--Answer: Run Code Above in SQL

--Let's find all the unsigned and uncommited players--

--How many players are unsigned and/or uncommitted?--

SELECT COUNT(*)
FROM espn_100
WHERE school = 'Unsigned/Uncommitted'

--Answer: There are 42 players that were unsigned and/or uncommitted.

--Let's see who these players are--

SELECT *
FROM espn_100
WHERE school = 'Unsigned/Uncommitted'

--Answer: Run Code Above in SQL


--Let's Find All the players that were McDonald's All-Americans--

--First the total number of players--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE

-- Answer: There are 384 McDonald's All-Americans.

--Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE

--Answer: Run Code Above in SQL


--Let's Find All the players that were Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE jbc = TRUE

-- Answer: There are 377 Jordan Brand Classic Participants.

--Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE jbc = TRUE

--Answer: Run Code Above in SQL


--Let's Find All the players that were either McDonald's All-Americans or Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE

-- Answer: There are 498 players that particpated in either the McDonald's All-American Game or Jordan Brand Classic.

--Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
OR jbc = TRUE

--Answer: Run Code Above in SQL


--Let's Find All the players that were McDonald's All-Americans and Jordan Brand Classic Participants--

SELECT COUNT(*)
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE

-- Answer: There are 263 players that were both McDonald's All-American and Jordan Brand Classic participants.

--Let's see who these players are--

SELECT class, player, pos, grade
FROM espn_100
WHERE mcdonalds_aa = TRUE
AND jbc = TRUE

--Answer: Run Code Above in SQL

--How many ESPN 100 recruits are named Michael?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Michael%'

--Answer: There are 12 players named Michael

--Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Michael%'

--Answer: Run Code Above in SQL

--How many ESPN 100 recruits are named Jalen?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Jalen%'

--Answer: There are 21 players named Jalen

--Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Jalen%'

--Answer: Run Code Above in SQL

--How many ESPN 100 recruits are named Anthony?--

SELECT COUNT(player) AS players
FROM espn_100
WHERE lower(player) ILIKE '%Anthony%'

--Answer: There are 15 players named Anthony.

--Let's see who these players are--

SELECT class, player
FROM espn_100
WHERE lower(player) ILIKE '%Anthony%'

--Answer: Run Code Above in SQL

--What is the most popular First Name?--

SELECT first_name, COUNT(first_name) AS players
FROM espn_100
GROUP BY first_name
ORDER BY players DESC

-- Answer: Jordan and Jalen are tied for the most popular first name at 21.
-- Note: Brandon was second with 19, followed by Isaiah with 16, and Chris & Josh with 15.

--What is the most popular Last Name?--

SELECT last_name, COUNT(last_name) AS players
FROM espn_100
GROUP BY last_name
ORDER BY players DESC

-- Answer: Johnson is the most popular last name with 35.
-- Note: Williams was second with 26 and Jones was third with 21.


