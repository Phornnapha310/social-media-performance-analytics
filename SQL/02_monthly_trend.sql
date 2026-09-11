-- Social Media Analytics
-- View: monthly_trend
-- Source: social_media.sql
-- Note: Logic preserved from the original project SQL.

CREATE VIEW monthly_trend AS
WITH base AS (
	SELECT 
		YEAR(STR_TO_DATE(post_date, '%c/%e/%Y'))	AS year_num,
        MONTH(STR_TO_DATE(post_date, '%c/%e/%Y'))	AS month_num,
        COUNT(*)		AS post_count,
        SUM(likes + comments + shares)		AS total_interactions,
        AVG(engagement_rate)				AS avg_engagement_rate 
	FROM social_media_engagement
    GROUP BY year_num, month_num
)
	SELECT 
		year_num,
        month_num,
        year_num * 100 + month_num		AS year_month_sort,
        DATE_FORMAT(STR_TO_DATE(CONCAT(month_num, '/1/', year_num), '%c/%e/%Y'), '%b')	AS month_short,
        DATE_FORMAT(STR_TO_DATE(CONCAT(month_num, '/1/', year_num), '%c/%e/%Y'), '%b %Y') AS month_year_short,
        post_count,
        total_interactions,
        avg_engagement_rate,
        total_interactions - LAG(total_interactions) OVER (ORDER BY year_num,month_num) /
        LAG(total_interactions) OVER (ORDER BY year_num,month_num) * 100		AS mom_growth_pct
	FROM base
    ORDER BY year_num,month_num;
