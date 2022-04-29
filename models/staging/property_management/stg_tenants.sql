select 
    id as tenant_id,
    contact_info_id,
    lease_id,
    bank_account_id,
    move_in_date,
    move_out_date,
    notice_date,
    created_at,
    uploaded_at

from {{ source('property_management', 'tenants') }}