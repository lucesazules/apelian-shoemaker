source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'
gem 'execjs'
gem 'therubyracer'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'

gem 'paperclip'
gem 'aws-s3'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

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
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl', :require => false if RUBY_PLATFORM =~ /darwin/i

  # guard notifications on Linux
  gem 'rb-inotify', :require => false if RUBY_PLATFORM =~ /linux/i
  gem 'libnotify', :require => false if RUBY_PLATFORM =~ /linux/i
end
