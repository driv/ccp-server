source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'rails-api'

gem 'rack-cors'

gem 'gcm'

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails'
	gem 'guard-rspec'
	gem 'spork-rails', github: 'A-gen/spork-rails'
	gem 'guard-spork'
end

group :development do
	gem 'populator'
end

group :test do
	gem 'factory_girl_rails'
end

group :production do
    gem 'pg'
    gem 'rails_12factor'
end
