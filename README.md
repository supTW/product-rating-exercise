# README

Please fork this repository and use it to solve the following problem: given a simple product catalog API, add the ability to rate products, to see product ratings, and to list products by rating.

This repository provides a starting point for a Ruby on Rails implementation.  You are welcome to use a different toolset if you prefer, please see below.

## Setup

To start working on this codebase, do the following:

1. Ensure that you have an up-to-date installation of Docker.
2. `$ docker-compose build`
3. `$ docker-compose run --rm api rake db:create db:migrate db:seed`
4. `$ docker-compose up`

You should now be able to list products at http://localhost:3000/product

The initial api consists of just two operations:

- `GET /product`: returns all products as a JSON array.
- `GET /product/:id`: returns a single product.

## The problem

Please implement the following changes and additions to the API and the necessary controllers, models, database schemas, etc:

- `POST /product/:id/review`: create a product review with the following properties:
  - `author`: string, required, the name of the author of the review
  - `star_rating`: integer between 1 and 5 inclusive, required
  - `headline`: string between 5 and 50 characters long, required, the review headline
  - `body`: string up to 1000 characters long, options, the body of the review
- `GET /product/:id/reviews`: list reviews for a product, with the following optional parameters:
  - `by=stars|date` - sort by the star rating or by date
  - `order=asc|desc` - sort in ascending or descending order
  - the default sort order should be by date descending (most recent review first)

Also, please modify the `GET /product` call, used to return all products, to return the most highly rated products first.

## To use something other than Rails

You are welcome to implement this in a language/toolkit of your choice.  You will need to replace the basic functionality implemented in this project template, which is:

1. A table with the following schema (or equivalent if not using a relational database)
   ```sql
   CREATE TABLE products (
    id uuid DEFAULT gen_random_uuid() primary key,
    name text not null,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
   );
   CREATE UNIQUE INDEX index_products_on_name ON products(name);
   ```
2. The initial API as described above, returning the rows of this table as JSON.

You can get started by running the `docker-compose` commands listed under `Setup` above to create the database, schema, and some sample data in the `products` table, and then replacing the `api` service in `docker-compose.yaml` with your own implementation.