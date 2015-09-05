source 'https://rubygems.org'
ruby '2.2.2'

STAGES = %w(
  development
  production
  test
).freeze

NON_PROD_STAGES = (STAGES - ['production']).freeze

gem 'rails', '4.1.8'

group(*STAGES) do
  gem 'coffee-rails'
  gem 'jquery-rails'
  gem 'pg'
  gem 'puma'
  gem 'sass-rails', '~> 4.0.3'
  gem 'sdoc', '~> 0.4.0', group: :doc
  gem 'spring',        group: :development
  gem 'turbolinks'
  gem 'uglifier'
end

group(*NON_PROD_STAGES) do
  gem 'faker'
  gem 'factory_girl_rails', '~> 4.5.0', require: false
end

group :development do
  gem 'annotate', '~> 2.6.6'
end

group :development, :test do
  gem 'awesome_print'
  gem 'database_cleaner'
  gem 'derailed'
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'pry-awesome_print'
  gem 'pry-rails'
  gem 'rspec-console'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :test do
  gem 'rspec-its'
  gem 'rspec-collection_matchers'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end