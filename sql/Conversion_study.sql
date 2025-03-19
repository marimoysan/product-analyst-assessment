/*
Conversion Study
*/

-- US conversion per device type (Desktop- 80%, Mobile- 20%)
SELECT ad.device_type,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'US' AND date_of_first_purchase <> "")) * 100 AS percentage
FROM amboss_data ad
WHERE ad.market = 'US' AND ad.date_of_first_purchase <> ""
GROUP BY ad.device_type;

-- RoW conversion per device type (Unknown- 12.2%, Desktop- 65.9%, Mobile- 17.2%, Tablet- 4,6%)
SELECT ad.device_type,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'RoW' AND date_of_first_purchase <> "")) * 100 AS percentage
FROM amboss_data ad
WHERE ad.market = 'RoW' AND ad.date_of_first_purchase <> ""
GROUP BY ad.device_type;



-- US conversion per mkt source (Friends - 50%, Ambassador - 10%, Ads - 5%)

/* 
Activity first 5 days:
Those coming from advertisement were using more the platform more during the trial, but didn't convert. 
Recomendations for friends didnt use it, but converted.
*/

SELECT ad.marketing_source,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'US' AND date_of_first_purchase <> "")) * 100 AS conversion_percentage,
    ad.chapters_read_first_5_days + ad.searches_first_5_days + ad.questions_answered_first_5_days AS activity_5_days
FROM amboss_data ad
WHERE ad.market = 'US' AND ad.date_of_first_purchase <> ""
GROUP BY ad.marketing_source
ORDER BY conversion_percentage DESC;


-- RoW conversion per mkt source (Friends - 50%, Ambassador - 10%, Ads - 5%)

/* 
Activity first 5 days:
Those coming from advertisement were using more the platform more during the trial, but didn't convert. 
Recomendations for friends didnt use it, but converted.
*/

SELECT ad.marketing_source,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'RoW' AND date_of_first_purchase <> "")) * 100 AS conversion_percentage,
    ad.chapters_read_first_5_days + ad.searches_first_5_days + ad.questions_answered_first_5_days AS activity_5_days
FROM amboss_data ad
WHERE ad.market = 'RoW' AND ad.date_of_first_purchase <> ""
GROUP BY ad.marketing_source
ORDER BY conversion_percentage DESC;

-- US conversion per class

/* 
Activity first 5 days:
50% of conversions over the 3rd year, and actually they were the most active. 
No higher years in the US
*/

SELECT ad.class,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'US' AND date_of_first_purchase <> "")) * 100 AS conversion_percentage,
    SUM(ad.chapters_read_first_5_days + ad.searches_first_5_days + ad.questions_answered_first_5_days) AS activity_5_days
FROM amboss_data ad
WHERE ad.market = 'US' AND ad.date_of_first_purchase <> ""
GROUP BY ad.class
ORDER BY conversion_percentage DESC;

-- RoW conversion per class
/* 
activity  first 5 days:
50% of conversions over the 3rd year, and actually they were the most active.
First and second year doesnt seem to convert nor in the US or the RoW
*/
SELECT ad.class,
    (COUNT(ad.user_id) * 1.0 / (SELECT COUNT(*) FROM amboss_data WHERE market = 'RoW' AND date_of_first_purchase <> "")) * 100 AS conversion_percentage,
    SUM(ad.chapters_read_first_5_days + ad.searches_first_5_days + ad.questions_answered_first_5_days) AS activity_5_days
FROM amboss_data ad
WHERE ad.market = 'RoW' AND ad.date_of_first_purchase <> ""
GROUP BY ad.class
ORDER BY conversion_percentage DESC;
