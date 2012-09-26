[![Build Status](https://secure.travis-ci.org/ka8725/neday.png)](http://travis-ci.org/ka8725/neday)

# Neday
This is a social network wich helps to organize sport events. You can
manage your events, find opponents and etc.

## Installation
- clone repository
- create config for **database.yml**
- bundle install --path=vendor/bundle
- bundle exec rake db:create
- bundle exec rake db:migrate
- bundle exec rails s
- bundle exec rake db:seed
- go to **/admin** to upload slides and configure your site

## Test Driven Development (TDD) and Behavior Driven Development (BDD)
If you are going to make any change please write tests before. Using tests is very simple: just type command `guard` in terminal
and write tests/code, make any changes and see results of your work in terminal. For every change **guard** will be restart test
and you can see results immediately in shell.
