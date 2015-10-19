- view: products
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: brand
    sql: ${TABLE}.brand
    html: |
      {{ linked_value }}
      <a href="https://mlogicadev.looker.com/dashboards/1?brand_filter={{ value }}" target="_new"> 
      <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>

  - dimension: category
    sql: ${TABLE}.category
    html: |
      {{ linked_value }}
      <a href="https://mlogicadev.looker.com/dashboards/5?cat_filter={{ value | encode_uri }}" target="_new"> 
      <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>
  
  - dimension: department
    sql: ${TABLE}.department

  - dimension: item_name
    sql: ${TABLE}.item_name

  - dimension: rank
    type: int
    sql: ${TABLE}.rank

  - dimension: retail_price
    type: number
    sql: ${TABLE}.retail_price

  - dimension: sku
    sql: ${TABLE}.sku

  - measure: count
    type: count
    drill_fields: [id, item_name, inventory_items.count]

