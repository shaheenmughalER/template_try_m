--Q.1 Write a SQL query to determine the year in which North America had highest video games sales.
--Solution:-
SELECT  release_year,MAX(na_sales_in_millions) as maximum_sales_in_millons_in_north_america
FROM games
JOIN sales
ON games.game_id = sales.game_id
GROUP BY release_year
	ORDER BY maximum_sales_in_millons_in_north_america DESC
	LIMIT 1

--Q.2 Write a SQL query to determine the year in which the global sales was highest.
--Solution:-
SELECT  release_year,MAX(global_sales_in_millions) as maximum_sales_in_millons
FROM games
JOIN sales
ON games.game_id = sales.game_id
GROUP BY release_year
	ORDER BY maximum_sales_in_millons DESC
	LIMIT 1

 --Q.3 Write a SQL query to determine the year in which the total shipped was highest
 --Solution:---
SELECT  release_year,MAX(total_shipped_in_millions) as maximum_shipped_in_millons
FROM games
JOIN sales
ON games.game_id = sales.game_id
GROUP BY release_year
	ORDER BY maximum_shipped_in_millons DESC
	LIMIT 1
--Q.4 Write a SQL query to determine the most popular video game console in North America.

SELECT COUNT(console)as count_console,game_name
FROM games
JOIN console
ON console.console_id = games.console_id
WHERE game_name = 'Call of Duty: Black Ops'
GROUP BY game_name
	ORDER BY game_name DESC
	LIMIT 1
SELECT console,most_poupler_games_north_america,sales_in_north_america
FROM console
JOIN(
SELECT games.console_id,game_name AS most_poupler_games_north_america,MAX(na_sales_in_millions) as sales_in_north_america
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY sales_in_north_america DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,most_poupler_games_north_america,sales_in_north_america

--Q.5 Write a SQL query to determine the most popular video game console in PAL
--Solution
SELECT console,most_poupler_games_pal,sales_in_pal
FROM console
JOIN(
SELECT games.console_id,game_name AS most_poupler_games_pal,MAX(pal_sales_in_millions) as sales_in_pal
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY sales_in_pal DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,most_poupler_games_pal,sales_in_pal

--Q.6 Write a SQL query to determine the most popular video game console in Japan
--Solution:-
SELECT console,most_poupler_games_japan,sales_in_japan
FROM console
JOIN(
SELECT games.console_id,game_name AS most_poupler_games_japan,MAX(japan_sales_in_millions) as sales_in_japan
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY sales_in_japan DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,most_poupler_games_japan,sales_in_japan

--Q.7 Write a SQL query to determine the most popular video game console in Other regions.
SELECT console,most_poupler_games_in_other_regions,sales_in_other_regions
FROM console
JOIN(
SELECT games.console_id,game_name AS most_poupler_games_in_other_regions,MAX(other_sales_in_millions) as sales_in_other_regions
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY sales_in_other_regions DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,most_poupler_games_in_other_regions,sales_in_other_regions

--Q.8 Write a SQL query to determine the most popular video game console globally.
--solution:-
SELECT console,most_poupler_games_globally,sales_globally
FROM console
JOIN(
SELECT games.console_id,game_name AS most_poupler_games_globally,MAX(global_sales_in_millions) as sales_globally
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY sales_globally DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,most_poupler_games_globally,sales_globally

--Q.9 Write a SQL query to determine the most shipped video game console.
--Solution
SELECT console,shipped_game,most_shipped
FROM console
JOIN(
SELECT games.console_id,game_name AS shipped_game,MAX(total_shipped_in_millions) as most_shipped
FROM games
JOIN sales
ON sales.game_id = games.game_id
GROUP BY game_name,games.console_id,games.game_id
	ORDER BY most_shipped DESC
	LIMIT 1
)sub
ON console.console_id = sub.console_id
GROUP BY console.console,shipped_game,most_shipped

--Q.10 Write a SQL query to determine the most popular video game across various consoles.
--Solution:-
SELECT game_name AS popular_video_games_across_various_console,COUNT(console) AS count_various_console
FROM games 
JOIN console
ON games.console_id = console.console_id
GROUP BY popular_video_games_across_various_console
	ORDER BY count_various_console DESC
	LIMIT 1
--Q.11 Write a SQL query to determine the most popular video game across various genres.

SELECT game_name,genre,MAX(y) AS most_popular_video_game
FROM games
JOIN
(
SELECT genre,genre.genre_id,COUNT(genre) AS y
FROM games
JOIN genre
ON games.genre_id = genre.genre_id
GROUP BY genre,genre.genre_id
ORDER BY y DESC
)sub
ON sub.genre_id = games.genre_id
GROUP BY game_name,genre
ORDER by most_popular_video_game DESC
LIMIT 1