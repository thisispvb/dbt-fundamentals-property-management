with leases as (
    select * from {{ ref('stg_leases') }}
),

tenants as (
    select * from {{ ref('dim_tenants') }}
),

rental_applications as (
    select * from {{ ref('stg_rental_applications') }}
),

final as (
    select
        leases.lease_id,
        leases.unit_id,
        leases.start_date,
        leases.end_date,
        leases.completed,

        tenants.contact_info_id,
        tenants.move_in_date,
        tenants.move_out_date,
        tenants.notice_date
    from leases
    left join tenants using (leases.lease_id)
    left join rental_applications using (leases.rental_application_id)
    where rental_applications.status = 'converted_to_tenant'
)

select * from final