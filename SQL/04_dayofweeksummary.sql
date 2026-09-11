-- Social Media Analytics
-- View: dayofweeksummary
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW dayofweeksummary AS
SELECT 
	DAYNAME(STR_TO_DATE(post_date,'%C/%e/%Y'))		AS day_of_week,
    WEEKDAY(STR_TO_DATE(post_date,'%c/%e/%Y'))		AS day_of_week_sort,
    COUNT(*)			AS post_count,
    SUM(likes + comments + shares)		AS total_interactions
FROM social_media_engagement
GROUP BY day_of_week,day_of_week_sort;
