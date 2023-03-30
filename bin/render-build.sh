#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile assets:clean
bundle exec rake db:drop db:create db:migrate db:migrate:status db:seed
