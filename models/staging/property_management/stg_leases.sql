select 
    id as lease_id,
    unit_id,
    rental_application_id,
    start_date,
    end_date,
    completed,
    created_at,
    uploaded_at

from {{ source('property_management', 'leases') }}