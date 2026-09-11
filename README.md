# Social Media Performance Analytics

This project analyzes social media engagement to understand content performance, user behavior, and engagement trends over time.

The dataset contains 20,000 posts from 4,909 users, covering 13 months (Mar 2024 – Mar 2025).

## Tools

- MySQL 8.0
- SQL
- Power BI

## What I Did

- Performed data profiling and data quality checks
- Created SQL Views for data analysis and Power BI preparation
- Used CTEs, Recursive CTEs, and Window Functions ROW_NUMBER(), LAG(), AVG() OVER()
- Built a 4-page Power BI Dashboard: Overview, Content & Topic, Audience, and Trend & Time
- Analyzed the data and translated findings into business insights

## Data Quality Issue

Multiple hashtags were stored in a single cell, which caused hashtag usage to be undercounted.

I used a Recursive CTE to split hashtags into individual rows before calculating hashtag frequency.

## Key Insights

- Fitness had slightly higher engagement than Photography, despite Photography having a higher number of posts
- Jul 2024 had the highest average engagement, approximately 16% above the overall monthly average
- Verified accounts had only a 0.012% lower engagement than non-verified accounts, suggesting that verified status had little impact on engagement
- Engagement per post increased consistently across follower tiers (Micro → Mega), with Mega users achieving the highest average at 4,367 likes per post

## Project Links

Power BI Dashboard: [View Dashboard](https://drive.google.com/file/d/1AnJFM2Uf_HDwZ--tOdGezq04SZM1Wk8U/view?usp=drive_link)

SQL: [View SQL Files](https://github.com/Phornnapha310/social-media-performance-analytics/tree/main/SQL)
