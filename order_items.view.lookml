- view: order_items
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: inventory_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.inventory_item_id

  - dimension: order_id
    type: int
    # hidden: true
    sql: ${TABLE}.order_id

  - dimension_group: returned
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returned_at

  - dimension: sale_price
    type: number
    sql: ${TABLE}.sale_price
    
  - dimension: sale_price_tier
    type: tier
    tiers: [0,5,25,50,75,100,200,300,400,500,700]
    sql: ${TABLE}.sale_price

  - measure: count
    type: count
    drill_fields: [users.id, users.last_name,users.city, users.state]
    
  - measure: total_sale
    type: sum
    sql: ${TABLE}.sale_price
    drill_fields: [products.id, products.item_name, products.category, products.department, order_items.sale_price]
    
  - measure: average_sale_price
    type: average
    sql: ${TABLE}.sale_price

