select 
    id as email_delivery_status_id,
    email_id,
    event,
    created_at,
    uploaded_at

from {{ source('property_management', 'email_delivery_statuses') }}