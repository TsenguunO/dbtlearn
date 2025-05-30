{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
}}
WITH src_reviews AS (
 SELECT * FROM {{ ref('src_reviews') }}
)
SELECT
{{ dbt_utils.generate_surrogate_key([
    "coalesce(cast(listing_id as string), '')",
    "coalesce(cast(review_date as string), '')",
    "coalesce(reviewer_name, '')",
    "coalesce(review_text, '')"
]) }}

 AS review_id,
 *
 FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}