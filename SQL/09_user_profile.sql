-- Social Media Analytics
-- View: user_profile
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW user_profile AS
SELECT 
	user_id,
	MAX(user_gender)		AS user_gender,
	MAX(user_age)			AS user_age,
	MAX(followers_count)	AS followers_count,
	MAX(following_count)	AS following_count,
	MAX(is_verified)		AS is_verified,
	MAX(location)			AS location
FROM social_media_engagement
GROUP BY user_id;
