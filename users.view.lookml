- view: users
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id
    drill_fields: [id, first_name, last_name, zip, city, email]

  - dimension: age
    type: int
    sql: ${TABLE}.age

  - dimension: city
    sql: ${TABLE}.city

  - dimension: country
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: email
    sql: ${TABLE}.email

  - dimension: first_name
    sql: ${TABLE}.first_name

  - dimension: gender
    sql: ${TABLE}.gender
    html: |
      <p style = "text-align: center">{{rendered_value}}</p>

  - dimension: last_name
    sql: ${TABLE}.last_name

  - dimension: state
    sql: ${TABLE}.state

  - dimension: zip
    type: zipcode
    sql: ${TABLE}.zip

  - dimension: full_name
    sql: CONCAT_WS(" ", ${TABLE}.first_name, ${TABLE}.last_name)

  - measure: count
    type: count
    drill_fields: detail*
    


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - last_name
    - first_name
    - events.count
    - orders.count
    - user_data.count

