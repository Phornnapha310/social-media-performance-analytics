-- Social Media Analytics
-- View: hashtag_frequency
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW hashtag_frequency AS
WITH RECURSIVE split_tags AS (
	SELECT 
		post_id,
		TRIM(SUBSTRING_INDEX(hashtags,'',1)) AS tag,
		TRIM(SUBSTRING(hashtags,LENGTH(SUBSTRING_INDEX(hashtags,'',1)) + 2)) AS remaining
	FROM social_media_engagement
	WHERE hashtags IS NOT NULL AND hashtags !=''
    
	UNION ALL
        
	SELECT
		post_id,
		TRIM(SUBSTRING_INDEX(remaining,'',1)) AS tag,
		TRIM(SUBSTRING(remaining,LENGTH(SUBSTRING_INDEX(remaining,'',1)) + 2)) AS remaining
	FROM split_tags
	WHERE remaining !=''
)
	SELECT 
		tag				AS hashtag,
        COUNT(*)		AS usage_count
	FROM split_tags
    WHERE tag != ''
	GROUP BY tag
    ORDER BY usage_count DESC;
