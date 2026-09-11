-- Social Media Analytics
-- View: age_group
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW age_group AS
	SELECT 
		CASE 
			WHEN user_age < 30 THEN 'Gen Z(17-29)'
			WHEN user_age < 46 THEN 'Gen Y(30-45)'
			WHEN user_age < 62 THEN 'Gen X(46-61)'
			ELSE 'Boomer+(46+)'
		END AS age_group,
        COUNT(*) AS user_count
	FROM user_profile
    GROUP BY age_group;
