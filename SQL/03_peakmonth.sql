-- Social Media Analytics
-- View: peakmonth
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW peakmonth AS 
SELECT
	m.year_num,
	m.month_num,
	m.month_short,
	m.month_year_short,
	m.total_interactions
FROM monthly_trend m
WHERE m.total_interactions = (SELECT MAX(total_interactions) FROM monthly_trend)
LIMIT 1;
