select 
    id as property_owner_id,
    property_id,
    owner_id,
    uploaded_at

from {{ source('property_management', 'property_owners') }}