-- Social Media Analytics
-- View: calendar
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW calendar AS
WITH RECURSIVE date_calc AS (
	SELECT MIN(STR_TO_DATE(post_date,'%c/%e/%Y'))		AS the_date
	FROM social_media_engagement
        
	UNION ALL 
        
	SELECT DATE_ADD(the_date,INTERVAL 1 DAY) 
	FROM date_calc
	WHERE the_date < (SELECT MAX(STR_TO_DATE(post_date,'%c/%e/%Y'))
	FROM social_media_engagement)
)
	SELECT
		the_date					AS post_date,
		DAYNAME(the_date)			AS day_of_week,
		WEEKDAY(the_date)			AS day_of_week_sort,
		MONTH(the_date)				AS month_num,
		YEAR(the_date)				AS year_num,
		YEAR(the_date) * 100 + MONTH(the_date)		AS year_month_sort,
		DATE_FORMAT(the_date,'%b')					AS month_short,
		DATE_FORMAT(the_date,'%b %Y')				AS month_year_short
    FROM date_calc;
