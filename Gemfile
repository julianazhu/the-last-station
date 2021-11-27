source 'http://rubygems.org'

ruby '3.0.0'

gem 'listen', '~> 3.7.0'
gem 'rails', '~> 6.1.4.1'
gem 'rake', '~> 13.0.6'
gem 'turbolinks', '~> 5.2.0'
gem 'webpacker', '>= 5.4.3'
gem 'webrick', '~> 1.7'

# Javascript
gem 'haml-rails', '~> 2.0'
gem 'jquery-rails', '~> 4.4.0'
gem 'jquery-ui-rails', '~> 6.0.1'

# Images default to AWS s3 hosting
gem 'aws-sdk-s3', '~> 1.106.0', require: false

# Database
gem 'pg', '~> 1.0'

# TODO: update and remove these gems maybe
gem 'cocoon', '~> 1.2.15'
gem 'coffee-rails', '~> 5.0.0'
gem 'responders', '~> 3.0.1'
gem 'sass-rails', '~> 6.0.0'

group :development do
  gem 'debase' # VSCode debugging
  gem 'pry', '>= 0.14.1'
  gem 'ruby-debug-ide' # VSCode debugging
  gem 'rufo' # Autoformatter
  gem 'web-console'
end

group :development, :test do
  gem 'better_errors', '~> 2.9.1'
  gem 'binding_of_caller', '~> 1.0.0'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.19.0'
  gem 'rspec', '~> 3.10.0'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop-rails', '>= 2.12.4', require: false
  gem 'rubocop-rake', '>= 0.6.0', require: false
end
