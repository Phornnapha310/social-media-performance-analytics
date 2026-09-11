-- Social Media Analytics
-- View: follower_tier
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW follower_tier AS
WITH user_tier AS (
	SELECT
		user_id,
		CASE
			WHEN followers_count < 25000 THEN 'Micro (<25K)'
			WHEN followers_count < 50000 THEN 'Mid (25K-50K)'
			WHEN followers_count < 75000 THEN 'Macro (50K-75K)'
			ELSE 'Mega (75K+)'
		END AS tier
	FROM user_profile
)
	SELECT
		t.tier,
		COUNT(DISTINCT t.user_id)	AS user_count,
		AVG(s.likes)				AS avg_likes
	FROM user_tier t 
	JOIN social_media_engagement s ON t.user_id = s.user_id
	GROUP BY t.tier;
