select 
    id as unit_id,
    property_id,
    rent,
    name,
    bedrooms,
    bathrooms,
    square_feet,
    status,
    address_1,
    address_2,
    city,
    state,
    zip_code,
    created_at,
    uploaded_at

from {{ source('property_management', 'units') }}