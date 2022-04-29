with emails as (
    select * from {{ ref('stg_emails') }}
),

email_delivery_statuses as (
    select * from {{ ref('stg_email_delivery_statuses') }}
),

final as (
    select
        emails.email_id,
        emails.subject,
        emails.body,
        emails.sent_at,
        emails.delivered_at
    from emails
    left join email_delivery_statuses using (email_id)
    where email_delivery_statuses.event = 'delivered'
)

select * from final