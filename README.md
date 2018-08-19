# README

API server for sample chat app, using Ruby on Rails

1. sudo docker-compose build
2. sudo docker-compose run web bash
```
cp config/database.yml.sample config/database.yml
bin/setup
rails db:migrate
```
3. sudo docker-compose up

