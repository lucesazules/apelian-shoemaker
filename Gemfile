source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'execjs'
gem 'therubyracer'

gem 'sqlite3', :group => [:test, :development]
gem 'pg', :group => :production # requested by heroku

gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'
gem 'cocoon'

gem 'paperclip'
gem 'aws-s3'

group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'kaminari' # pagination

group :development do
  gem 'heroku'
  gem 'taps'
end

group :development, :test do
  gem 'sqlite3'
  gem 'yard'
end

group :test do
  gem 'turn', :require => false
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'faker'

  gem "rspec-rails"

  # Guard
  gem 'guard-rspec'

  # guard notifications on MAC OS X
  gem 'rb-fsevent', :require => false #  if RUBY_PLATFORM =~ /darwin/i
  gem 'growl', :require => false # if RUBY_PLATFORM =~ /darwin/i

  # guard notifications on Linux
  gem 'rb-inotify', :require => false # if RUBY_PLATFORM =~ /linux/i
  gem 'libnotify', :require => false # if RUBY_PLATFORM =~ /linux/i
end
