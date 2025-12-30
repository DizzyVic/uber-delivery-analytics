CREATE TABLE "accounts" (
  "account_id" integer PRIMARY KEY,
  "first_name" varchar,
  "nickname" varchar,
  "country" varchar,
  "rating" numeric(4,2),
  "signup_city" varchar,
  "signup_date" timestamp
);

CREATE TABLE "transactions" (
  "transaction_id" integer PRIMARY KEY,
  "account_id" integer,
  "establishment_id" integer,
  "city_id" integer,
  "order_request_time" timestamp,
  "final_delivery_time" timestamp,
  "time_taken" integer,
  "serving_time_quality" varchar,
  "status_id" integer,
  "order_price" numeric(10,2),
  "payment_currency_id" integer
);

CREATE TABLE "details" (
  "detail_id" integer PRIMARY KEY,
  "transaction_id" integer,
  "ordered_item" varchar,
  "item_quantity" integer,
  "customization" boolean,
  "item_price" numeric(10,2)
);

CREATE TABLE "calories" (
  "calorie_id" integer PRIMARY KEY,
  "detail_id" integer,
  "min_calories" integer,
  "max_calories" integer,
  "average_calorie" integer
);

CREATE TABLE "establishments" (
  "establishment_id" integer PRIMARY KEY,
  "food_establishments" varchar,
  "food_category" varchar,
  "food_subcategory" varchar,
  "average_price_range" varchar
);

CREATE TABLE "service_styles" (
  "service_id" integer PRIMARY KEY,
  "service_name" varchar
);

CREATE TABLE "establishments_service_styles" (
  "establishment_id" integer,
  "service_id" integer
);

CREATE TABLE "currency" (
  "currency_id" integer PRIMARY KEY,
  "currency_abbreviation" varchar,
  "currency_full_name" varchar,
  "symbol" varchar,
  "exchange_rate_value" float,
  "date_rate_stored" date
);

CREATE TABLE "status" (
  "status_id" integer PRIMARY KEY,
  "status_type" varchar
);

CREATE TABLE "city" (
  "city_id" integer PRIMARY KEY,
  "city_name" varchar
);

ALTER TABLE "establishments_service_styles" ADD FOREIGN KEY ("establishment_id") REFERENCES "establishments" ("establishment_id");

ALTER TABLE "establishments_service_styles" ADD FOREIGN KEY ("service_id") REFERENCES "service_styles" ("service_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("account_id");

ALTER TABLE "details" ADD FOREIGN KEY ("transaction_id") REFERENCES "transactions" ("transaction_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("status_id") REFERENCES "status" ("status_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("city_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("payment_currency_id") REFERENCES "currency" ("currency_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("establishment_id") REFERENCES "establishments" ("establishment_id");

ALTER TABLE "calories" ADD FOREIGN KEY ("detail_id") REFERENCES "details" ("detail_id");
