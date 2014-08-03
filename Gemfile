source 'https://rubygems.org'
ruby '2.1.0'

gem 'bootstrap-sass', '~>3.0'
gem 'coffee-rails'
gem 'rails'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'bootstrap_form', :git => "git://github.com/bootstrap-ruby/rails-bootstrap-forms"
gem 'bcrypt-ruby'
gem 'fabrication'
gem 'faker'

group :development do
  gem 'sqlite3'
  gem 'letter_opener'
  gem 'pry-nav'
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :test, :development do
  gem 'rspec-rails', '~>2.14.2'
  gem 'pry'
  # gem 'rspec-expectations', '~>3.0.1'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara', '~>2.4'
  gem 'launchy'
  gem 'capybara-email', github: "dockyard/capybara-email"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

