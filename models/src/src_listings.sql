WITH raw_listing AS (
    SELECT * FROM {{source('airbnb', 'listings')}}
)
SELECT 
    id as listing_id,
    name as listing_name,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM raw_listing
