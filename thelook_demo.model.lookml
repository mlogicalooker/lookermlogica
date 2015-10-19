- connection: thelook

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: events
  joins:
    - join: users
      foreign_key: user_id


- explore: inventory_items
  joins:
    - join: products
      foreign_key: product_id


- explore: order_items
  joins:
    - join: inventory_items
      foreign_key: inventory_item_id

    - join: orders
      foreign_key: order_id

    - join: products
      foreign_key: inventory_items.product_id

    - join: users
      foreign_key: orders.user_id


- explore: orders
  joins:
    - join: users
      foreign_key: user_id


- explore: products

- explore: schema_migrations

- explore: user_data
  joins:
    - join: users
      foreign_key: user_id


- explore: users

