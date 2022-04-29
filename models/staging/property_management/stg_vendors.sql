select 
    id as vendor_id,
    contact_info_id,
    bank_account_id,
    created_at,
    uploaded_at

from {{ source('property_management', 'vendors') }}