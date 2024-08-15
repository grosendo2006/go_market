# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.5'

gem 'httparty', '~> 0.21.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'

gem 'pg', '~> 1.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'annotate', '~> 3.2', '>= 3.0.3'
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'dotenv', '~> 3.1.2'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.4'
  gem 'pry-byebug', '~> 3.9', platform: :mri
  gem 'rspec-rails', '~> 6.1'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'rubocop', '~> 1.65', require: false
  # gem 'rubocop-capybara', '~> 2.21'
  gem 'rubocop-factory_bot', '~> 2.26', require: false
  gem 'rubocop-performance', '~> 1.21', require: false
  gem 'rubocop-rails', '~> 2.25', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'rubocop-rspec', '~> 3.0.4', require: false
  gem 'rubocop-rspec_rails', '~> 2.30.0', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 6.3'
  gem 'json_matchers', '~> 0.11.0'
  gem 'webmock', '~> 3.23'
end
