----------------------------------------------------------------------------------------------------------------
                                              Number 1
----------------------------------------------------------------------------------------------------------------
SELECT
  d.ordered_item,
  SUM(d.item_quantity) AS no_of_item,
  SUM(d.item_price) AS sum_of_item_price
FROM
  details d
JOIN
  transactions t ON t.transaction_id = d.transaction_id
WHERE
  t.time_taken IS NOT NULL AND
  t.status_id NOT IN (2,3,4,5) OR
  t.status_id IS NULL
GROUP BY
  d.ordered_item
ORDER BY
  sum_of_item_price DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------------------
                                                Number 2
----------------------------------------------------------------------------------------------------------------
SELECT
  TRIM(TO_CHAR(final_delivery_time, 'Month')) AS month_name,
  COUNT(transaction_id) AS number_of_orders,
  AVG(time_taken)::NUMERIC(10,2) AS average_time,
  SUM(order_price) AS sum_of_orders
FROM
  transactions
WHERE
  time_taken IS NOT NULL AND
  final_delivery_time IS NOT NULL
GROUP BY
  month_name
ORDER BY
  sum_of_orders DESC;

----------------------------------------------------------------------------------------------------------------
                                                Number 3
----------------------------------------------------------------------------------------------------------------
SELECT
  e.food_category,
  COUNT(t.transaction_id) AS number_of_orders,
  SUM(t.order_price) AS total_order_price
FROM
  establishments e
JOIN
  transactions t ON e.establishment_id = t.establishment_id
WHERE
  t.time_taken IS NOT NULL AND
  t.status_id NOT IN (2,3,4,5) OR
  t.status_id IS NULL
GROUP BY
  e.food_category
ORDER BY
  total_order_price DESC;

----------------------------------------------------------------------------------------------------------------
                                                Number 4
----------------------------------------------------------------------------------------------------------------
SELECT
  e.food_establishments,
  AVG(t.time_taken)::NUMERIC(10,2) AS average_time_taken
FROM
  establishments e
JOIN
  transactions t ON e.establishment_id = t.establishment_id
WHERE
  t.time_taken IS NOT NULL AND
  t.status_id NOT IN (2,3,4,5) OR
  t.status_id IS NULL
GROUP BY
  e.food_establishments
ORDER BY
  average_time_taken DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------------------
                                                Number 5
----------------------------------------------------------------------------------------------------------------
SELECT
  e.food_establishments,
  SUM(t.order_price) AS total_amount_spent
FROM
  establishments e
JOIN
  transactions t ON e.establishment_id = t.establishment_id
WHERE
  t.time_taken IS NOT NULL AND 
  t.status_id NOT IN (2,3,4,5) OR
  t.status_id IS NULL
GROUP BY
  e.food_establishments
ORDER BY
  total_amount_spent DESC
LIMIT 10;
