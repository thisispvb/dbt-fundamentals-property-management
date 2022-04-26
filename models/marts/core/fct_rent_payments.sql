with transactions as (
    select * from {{ ref('stg_transactions') }}
),

tenants as (
    select * from {{ ref('dim_tenants') }}
),

leases as (
    select * from {{ ref('stg_leases') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

tenant_lease_unit as (
    select
        tenants.full_name,
        tenants.lease_id,
        leases.unit_id,
        units.rent
    from tenants
    
    left join leases using (tenants.lease_id)
    left join units using (leases.unit_id)
),

final as (
    select        
        transactions.transaction_id,
        transactions.amount,
        transactions.payer,
        transactions.payee,
        transactions.created_at
    from transactions

    left join tenant_lease_unit on transactions.payer = tenant_lease_unit.full_name

    where transactions.type = 'charge'
    and transactions.amount = tenant_lease_unit.rent
)

select * from final