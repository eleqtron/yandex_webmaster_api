source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'pg', '0.17.1'
gem 'pg_search'

gem 'foreigner', '1.0.3'
gem 'devise', '3.2.2'
gem 'will_paginate', '3.0.3'
gem 'russian' ,'~> 0.6.0'
gem 'remotipart', '1.0.5'
gem 'settingslogic', '2.0.8'
gem 'rmagick', '2.13.2', require: false
gem 'carrierwave', '0.9.0'
gem 'acts_as_list', '0.3.0'
gem 'enumerize', '0.7.0'
gem 'mini_magick', '3.7.0'
gem 'paperclip', '4.1.0'
gem 'cancan','1.6.7'
gem 'friendly_id','5.0.3'
gem 'gretel', '3.0.5'
gem 'whenever', '0.9.4'
gem 'standalone_typograf', '3.0.2'
gem 'nokogiri', '~> 1.6.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '4.2.0'
gem 'jquery-migrate-rails'
gem 'highlight_js-rails', '7.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
gem 'haml'
gem 'ckeditor', github: 'galetahub/ckeditor'

gem "recaptcha", :require => "recaptcha/rails"

gem 'exception_notification', group: [:production]


group :assets do
  gem 'sprockets'
  gem 'sass-rails', '~>4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'bootstrap-sass', '3.1.0.2'

  if RUBY_PLATFORM=~ /mingw32/
    gem 'therubyracer', '0.11.0beta1', :platform => :ruby
  else
    gem 'therubyracer', '0.12.1', :platform => :ruby
  end
end

group :development do
  gem 'better_errors', '1.1.0'
  gem 'binding_of_caller'
  gem 'awesome_print', :require => 'ap'
  gem 'commands'
  #gem 'thin', '1.5.1'
  gem 'letter_opener', '1.2.0'
  # Use Capistrano for deployment
  gem 'capistrano', '~> 2.15.5'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
group :production do
  platforms :ruby do # linux
    gem 'unicorn'
  end
end

# Use debugger
#gem 'debugger', group: [:development, :test]

gem 'net-ssh', '2.7.0'
