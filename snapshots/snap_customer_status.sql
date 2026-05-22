{% snapshot customers_snapshot %}

{{
    config(
      target_database='dev',
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['email', 'country']
    )
}}

select * from {{ ref('stg_raw_customers') }}

{% endsnapshot %}
