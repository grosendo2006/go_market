# README

Purpose: API created to manage products and create payments for them, interacting
with the Conekta API to generate payments links.
Also, implement webhooks to modify the state of the payments


## How to use with Docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Run `docker-compose build`
1. Run `docker-compose up`
1. To run the migrations run `docker-compose run web bundle exec rails db:create` and `docker-compose run web bundle exec rails db:migrate`
1. You can now try your REST services!

See [Docker docs](./docs/docker.md) for more info

## Sidekiq

When running with docker, you're using `Sidekiq` to process backgroud jobs, you can
check `http://localhost:3000/sidekiq` on any browser to see it!

