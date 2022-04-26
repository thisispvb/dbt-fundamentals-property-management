select 
    id as rental_application_id,
    contact_info_id,
    status,
    created_at,
    uploaded_at,
    deleted_at

from {{ source('property_management', 'rental_applications') }}