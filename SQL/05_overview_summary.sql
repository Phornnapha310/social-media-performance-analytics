-- Social Media Analytics
-- View: overview_summary
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW overview_summary AS
SELECT 
	COUNT(*)		AS total_post,
    SUM(likes)		AS total_likes,
    SUM(comments)	AS total_comments,
    SUM(shares)		AS total_shares,
    SUM(likes + comments + shares)		AS total_interactions,
    AVG(engagement_rate)				AS avg_engagement_rate,
    COUNT(DISTINCT user_id)				AS unique_user,
    COUNT(DISTINCT location)			AS unique_locations,
    COUNT(*) / COUNT(DISTINCT user_id)	AS avg_posts_per_user,
    SUM(likes + comments + shares) / COUNT(*)		AS interactions_per_post,
   SUM(CASE WHEN is_verified = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS non_verified_users_pct,
   AVG(content_length)					AS avg_content_length
FROM social_media_engagement;
