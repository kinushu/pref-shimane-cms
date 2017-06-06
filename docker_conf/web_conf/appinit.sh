#!/usr/bin/env bash
bundle exec rake db:create
bundle exec rake railties:install:migrations
bundle exec rake db:migrate
bundle exec rake db:fixtures:load
