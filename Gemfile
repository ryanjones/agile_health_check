source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use Puma as the app server
gem 'puma'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap-sass'
gem 'sass-rails'
gem 'bootswatch-rails'
gem 'jquery-rails'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'pg'
gem 'simple_form'
gem 'audited'
gem 'breadcrumbs_on_rails'
gem 'draper'
gem 'bootsnap'
gem 'webpacker'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit', git: "git@github.com:thoughtbot/capybara-webkit.git"
  gem 'headless'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'pry'
  gem 'factory_girl'
end

group :development do
  gem 'better_errors', git: 'https://github.com/charliesome/better_errors.git', branch: 'master'
  gem 'binding_of_caller'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
