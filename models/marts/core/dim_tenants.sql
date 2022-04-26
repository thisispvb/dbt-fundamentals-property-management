with tenants as (
    select * from {{ ref('stg_tenants') }}
),

contact_infos as (
    select * from {{ ref('stg_contact_infos') }}
),

bank_accounts as (
    select * from {{ ref('stg_bank_accounts') }}
),

final as (
    select
        tenants.tenant_id,
        tenants.lease_id,
        tenants.move_in_date,
        tenants.move_out_date,
        tenants.notice_date,

        tenants.contact_info_id,
        concat(contact_infos.first_name, ' ', contact_infos.last_name) as full_name,
        contact_infos.email_address,
        contact_infos.phone_number,

        tenants.bank_account_id,
        bank_accounts.name,
        bank_accounts.bank_account_number,
        bank_accounts.routing_number
    from tenants
    left join contact_infos using (contact_info_id)
    left join bank_accounts using (bank_account_id)
)

select * from final