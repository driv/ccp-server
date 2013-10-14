source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'rails-api'

gem 'rack-cors'

gem 'thin'

git "git://github.com/habeel/faye-rails.git" do
	gem 'faye-rails'
end


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


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
