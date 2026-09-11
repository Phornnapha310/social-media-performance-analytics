-- Social Media Analytics
-- View: verified_summary
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW verified_summary AS
SELECT
	(SELECT SUM(CASE WHEN is_verified = 'TRUE' THEN 1 ELSE 0 END) / COUNT(*) * 100
    FROM user_profile)	AS verified_pct,
    AVG(CASE WHEN is_verified = 'TRUE' THEN engagement_rate END)	AS verified_avg_engagement,
    AVG(CASE WHEN is_verified = 'FALSE' THEN engagement_rate END)	AS non_verified_avg_engagement
FROM social_media_engagement;
