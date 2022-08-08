# Knowledge Graph API

This API allows one to store facts and relations between entities. The service is configured with a schema that describes the types of entities, which keys each type requires, and what type the value of each key has. Right now, the type of a key can either be a string or an id referencing another entity.

An example json schema is provided [here](config/schema.json).

You can find the API reference [here](https://www.postman.com/cloudy-star-601209/workspace/yash-s-workspace/documentation/22546309-f6e18e60-801c-40be-b194-3e022938bc5f). Please don't modify this reference as I have to pay for Postman Premium to lock it :)

The database schema is located [here](db/schema.rb).


## How to start the server

Ensure you have Ruby 2.7.5 installed

1. `bundle install` to install dependencies
2. `rake db:migrate` to run all db migrations
3. `rails s` to start the local server
4. The service is now exposed at `localhost:3000`

## How to change the schema

1. Modify the `config/schema.json` as you see fit.
2. `rake db:reset`. Note that this will also delete any entities under the old schema.

## Next Steps
- Configure multi-stage builds so that we can automatically detect and account for schema changes.
- Add more types, and split the `values` table into `string_values`, `entity_values`, `other_type_values` tables
