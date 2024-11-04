# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# graphiqlで動作確認するまで
1. docker-compose build
2. docker-compose run web bundle install
3. docker-compose run web rails db:create
4. docker-compose run web bundle exec ridgepole -c config/ridgepole.yml -E development --apply -f db/Schemafile
5. docker-compose run web bundle exec ridgepole -c config/ridgepole.yml -E test --apply -f db/Schemafile
6. docker-compose run web rails db:seed
7. docker-compose run web rspec
8. docker compose up
9. graphiqlで動作確認
```
{
    users {
          id
          name
          createdAt
          updatedAt
    }
}
```