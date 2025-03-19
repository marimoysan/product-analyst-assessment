/*
total_conversion_rate = total number of users that purchased the product / total users that created an account
total_conversion_rate_lifetime = total number of users that purchased the product / total users that created an account 
*/

/*
RoW
*/

-- RoW Table

SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'RoW'


-- total accounts in the RoW --> 13,749
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'RoW')t


-- total conversions in the RoW --> 996
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'RoW' AND ad.date_of_first_purchase <> "")t

-- total lifetime conversions in the RoW --> 20
SELECT count(t.user_id)
FROM
(SELECT ad.*
FROM amboss_data ad
WHERE ad.market = 'RoW' AND ad.purchased_lifetime = 'true')t


-- Total conversion rate in the RoW --> 0.072
SELECT 
    (COUNT(CASE WHEN ad.date_of_first_purchase <> "" THEN 1 END) * 1.0 / COUNT(*)) AS conversion_rate
FROM amboss_data ad
WHERE ad.market = 'RoW';

-- Lifetime conversion rate in the RoW --> 0.00102
SELECT 
    (COUNT(CASE WHEN ad.purchased_lifetime = 'true' THEN 1 END) * 1.0 / COUNT(*)) AS conversion_rate
FROM amboss_data ad
WHERE ad.market = 'RoW';