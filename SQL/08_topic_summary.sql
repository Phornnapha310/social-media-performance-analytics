-- Social Media Analytics
-- View: topic_summary
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW topic_summary AS 
WITH topic_data AS ( 
	SELECT 
		topic,
        AVG(engagement_rate)				AS avg_engagement_rate,
        COUNT(*)							AS post_count,
        SUM(likes + comments + shares)		AS total_interactions,
        AVG(likes)							AS avg_likes,
        AVG(comments)						AS avg_comments,
        AVG(shares)							AS avg_shares,
        SUM(CASE WHEN has_media = 'TRUE' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS media_pct
	FROM social_media_engagement
    GROUP BY topic
)
	SELECT 
		ROW_NUMBER() OVER (ORDER BY total_interactions DESC)	AS topic_rank,
        ROW_NUMBER() OVER (ORDER BY post_count DESC)			AS posts_rank,
        topic,avg_engagement_rate,post_count,total_interactions,
        avg_likes,avg_comments,avg_shares,media_pct,
        CASE
			WHEN total_interactions >= AVG(total_interactions) OVER()
            THEN 'Top' ELSE 'Mid'
		END AS tier
	FROM topic_data
    ORDER BY total_interactions DESC;
