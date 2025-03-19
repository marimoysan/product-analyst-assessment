SET SCHEMA 'takemehome'

/*
   There are 437 duplicates in both tables. I will join tables without duplicate rows and save as a new csv file (saved in the data folder as amboss_data.csv).
*/

SELECT filtered_up.*, filtered_tc.created_at, filtered_tc.market, filtered_tc.md_do, filtered_tc.university_id, filtered_tc.device_type, filtered_tc.marketing_source, filtered_tc.class
FROM (
    SELECT DISTINCT ON (user_id) * 
    FROM amboss_user_profile
    ORDER BY user_id
) filtered_up
JOIN (
    SELECT DISTINCT ON (user_id) * 
    FROM amboss_trial_conversions
    ORDER BY user_id
) filtered_tc 
ON filtered_up.user_id = filtered_tc.user_id;

