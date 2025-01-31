SET SCHEMA 'takemehome'

/*
   There are 437 duplicates in both tables. We join tables without duplicate rows.
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
    
/*
Now I will differentiate between the US and the RoW markets
*/
