source 'https://rubygems.org'
ruby '2.2.2'

source "https://rubygems.org"

gem "rails", "~> 4"

gem "coffee-rails"
gem "jquery-rails"
gem 'jquery-ui-rails', '~> 4.2.1'
gem "pg"
gem "puma"
gem "sass-rails"
gem "uglifier"

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "database_cleaner", git: "git@github.com:bmabey/database_cleaner.git"
  gem "ruby_css_lint"
  gem 'pry'
  gem 'pry-awesome_print'
  gem 'pry-rails'
  gem "selenium-webdriver"
  gem 'simplecov', require: false
end

group :test do
  gem 'rspec-its'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end