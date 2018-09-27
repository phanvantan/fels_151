source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "jquery-rails"
gem "config"
gem "bcrypt", "3.1.12"
gem "rubocop", require: false
gem "bootstrap-sass"
gem "rails", "~> 5.2.1"
gem "sqlite3"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "will_paginate", "~> 3.1.0"
gem "pry"
gem "bcrypt", "3.1.12"
gem "faker", "1.7.3"
gem "ransack"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"

group :development, :test do
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 3.8.1"
end

group :test do
  gem "shoulda-matchers", "4.0.0.rc1"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg", "0.20.0"
  gem "fog", "1.42"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
