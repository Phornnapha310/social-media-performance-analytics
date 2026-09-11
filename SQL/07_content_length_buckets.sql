-- Social Media Analytics
-- View: content_length_buckets
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW content_length_buckets AS
SELECT
	CASE
		WHEN content_length < 50 THEN '< 50'
        WHEN content_length < 100 THEN '50-100'
        WHEN content_length < 150 THEN '100-150'
        WHEN content_length < 200 THEN '150-200'
        ELSE '200+'
	END AS length_bucket,
    AVG(engagement_rate)		AS avg_engagement_rate,
    COUNT(*)					AS post_count
FROM social_media_engagement
GROUP BY length_bucket;
