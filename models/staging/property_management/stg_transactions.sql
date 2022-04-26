select 
    id as transaction_id,
    type,
    amount,
    payer,
    payee,
    created_at,
    uploaded_at,
    deleted_at

from {{ source('property_management', 'transactions') }}