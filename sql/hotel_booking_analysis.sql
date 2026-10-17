-- =========================================================
-- HOTEL BOOKING CANCELLATION ANALYSIS
-- Descriptive analysis of booking cancellations
-- =========================================================

-- 1. DATA VALIDATION
SELECT * FROM hotel_bookings LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM hotel_bookings;


-- 2. OVERALL CANCELLATION RATE
SELECT
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS overall_cancellation_rate
FROM hotel_bookings;


-- 3. HOTEL TYPE
-- Question: Which hotel type has a higher cancellation rate?
SELECT
    hotel,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY hotel
ORDER BY cancellation_rate DESC;


-- 4. ARRIVAL MONTH
-- Question: How does cancellation rate vary across months with different booking volumes?
SELECT
    arrival_date_month,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY arrival_date_month
ORDER BY cancellation_rate DESC;


-- 5. LEAD TIME
-- Question: How does cancellation rate vary by booking lead time?
SELECT
    CASE
        WHEN lead_time <= 7 THEN '0-7 days'
        WHEN lead_time <= 30 THEN '8-30 days'
        WHEN lead_time <= 90 THEN '31-90 days'
        ELSE '90+ days'
    END AS lead_time_range,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY lead_time_range
ORDER BY
    CASE
        WHEN lead_time_range = '0-7 days' THEN 1
        WHEN lead_time_range = '8-30 days' THEN 2
        WHEN lead_time_range = '31-90 days' THEN 3
        ELSE 4
    END;


-- 6. DEPOSIT TYPE
-- Question: How does cancellation rate vary by deposit type?
SELECT
    deposit_type,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY deposit_type
ORDER BY cancellation_rate DESC;


-- 7. GUEST TYPE
-- Question: Do repeated guests have a lower cancellation rate than first-time guests?
SELECT
    CASE
        WHEN is_repeated_guest = 1 THEN 'Repeated guest'
        ELSE 'First-time guest'
    END AS guest_type,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY is_repeated_guest
ORDER BY cancellation_rate DESC;


-- 8. COUNTRY
-- Question: Among the ten countries with the highest booking volumes, which have the highest and lowest cancellation rates?
SELECT
    country,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_bookings DESC
LIMIT 10;


-- 9. MARKET SEGMENT
-- Question: Which market segments have the highest and lowest cancellation rates?
SELECT
    market_segment,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
WHERE LOWER(market_segment) != 'undefined'
GROUP BY market_segment
ORDER BY cancellation_rate DESC;


-- 10. MARKET SEGMENT VALIDATION
-- Validation: Check the number of bookings in each market segment, including undefined values.
SELECT
    market_segment,
    COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY market_segment
ORDER BY total_bookings DESC;


-- 11. LENGTH OF STAY
-- Follow-up question: Does cancellation rate show a clear pattern across different stay lengths?
SELECT
    stays_in_weekend_nights + stays_in_week_nights AS total_nights,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS canceled_bookings,
    ROUND(
        SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM hotel_bookings
GROUP BY total_nights
HAVING COUNT(*) >= 100
ORDER BY total_nights;
