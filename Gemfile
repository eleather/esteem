source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


# Authentication and user roles.
gem 'devise'


# Gems for views.
gem 'haml-rails'
gem 'breadcrumbs_on_rails'


# Use rspec for testing
gem 'rspec-rails', :group => [:test, :development]
group :test do  
  # Pretty printed test output
  gem 'turn', :require => false
  
  # Use factory girl instead of fixtures
  gem 'factory_girl_rails'
  
  # Acceptance tests
  gem 'capybara'
  gem 'launchy'
  
  # Autorun tests on file save
  gem 'guard-rspec'
  gem 'rb-fsevent'
end
