[![Build Status](https://secure.travis-ci.org/ka8725/neday.png)](http://travis-ci.org/ka8725/neday)

# Neday
This is a social network wich helps to organize sport events. You can
manage your events, teams, find opponents and etc.

##Installation
- clone repository
- create config for **database.yml**
- bundle install --path=vendor/bundle
- bundle exec rake db:create
- bundle exec rake db:migrate
- bundle exec rails s
- bundle exec rake db:seed
- go to **/admin** to upload slides and configure your site
