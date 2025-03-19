/*
total_conversion_rate = total number of users that purchased the product / total users that created an account
total_conversion_rate_lifetime = total number of users that purchased the product / total users that created an account 
*/

/*
US
*/

-- USA Table

SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'US'

-- total accounts in the US --> 98
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'US')t

-- total conversions in the US --> 20
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'US' AND ad.date_of_first_purchase <> "")t

-- total lifetime conversions in the US --> 1
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'US' AND ad.purchased_lifetime = 'true')t


-- Total conversion rate in the US --> 0.20408
SELECT 
    (COUNT(CASE WHEN ad.date_of_first_purchase <> "" THEN 1 END) * 1.0 / COUNT(*)) AS conversion_rate
FROM amboss_data ad
WHERE ad.market = 'US';

-- Lifetime conversion rate in the US --> 0.0102
SELECT 
    (COUNT(CASE WHEN ad.purchased_lifetime = 'true' THEN 1 END) * 1.0 / COUNT(*)) AS conversion_rate
FROM amboss_data ad
WHERE ad.market = 'US';
