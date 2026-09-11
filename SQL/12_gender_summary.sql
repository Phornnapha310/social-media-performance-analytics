-- Social Media Analytics
-- View: gender_summary
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW gender_summary AS 
SELECT
	user_gender,
    COUNT(*)		AS user_count
FROM user_profile
GROUP BY user_gender;
