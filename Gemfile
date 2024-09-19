source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'  # Update to the latest stable Ruby version

gem 'rails', '~> 7.0.8'  # Update to Rails 7
gem 'pg', '~> 1.5'  # Update PostgreSQL adapter
gem 'puma', '~> 6.0'  # Update Puma
gem 'bootstrap', '~> 5.3.0'
gem 'sass-rails', '~> 6.0'
gem 'webpacker', '~> 5.0'  # Consider replacing with jsbundling-rails for Rails 7
gem 'turbo-rails'  # Replace turbolinks with turbo
gem 'stimulus-rails'  # Add stimulus for Rails 7
gem 'jbuilder', '~> 2.11'
gem 'redis', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false

gem 'devise', '~> 4.9'
gem 'faker', '~> 3.2'
gem 'pg_search', '~> 2.3.0'

gem 'autoprefixer-rails', '~> 10.4'
gem 'font-awesome-sass', '~> 6.4.0'
gem 'simple_form', '~> 5.2'

gem 'pundit', '~> 2.3'
gem 'geocoder', '~> 1.8'

# These are now part of Ruby 3.1+, so you can remove them
# gem 'net-smtp'
# gem 'net-imap'
# gem 'net-pop'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '~> 4.2'
  gem 'rack-mini-profiler', '~> 2.3'
  gem 'listen', '~> 3.8'
  gem 'spring'  # Note: Spring is not enabled by default in Rails 7
end

group :test do
  gem 'capybara', '~> 3.39'
  gem 'selenium-webdriver', '~> 4.10'
  gem 'webdrivers', '~> 5.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]