source 'https://rubygems.org'
gem 'bundler', '>= 1.8.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# load enveronmets
gem 'dotenv-rails', :groups => [:development, :test]
# Use postgresql9.4 as the database for Active Record
gem 'pg'
gem 'foreigner'
gem 'immigrant'
# fix for attr_accessible and attr_protected
gem 'protected_attributes'
# Authentication
gem 'devise', '3.5.2'
gem 'oauth2'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-instagram'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2'
gem 'devise_lastseenable', '0.0.6'
gem 'devise-token_authenticatable', '~> 0.4.0'
# Background processing
gem 'sidekiq', '3.4.2'
gem 'sinatra', '1.4.6'
# Scheduled processing
gem 'sidetiq', '0.6.3'
# CSS and around it
gem 'bootstrap-sass', '3.3.5.1'
gem 'compass-rails',  '2.0.5'
gem 'sass-rails',     '5.0.4'
gem 'less-rails'
gem 'therubyracer'
gem 'less-rails-bootstrap'
gem 'autoprefixer-rails', '6.0.3'
gem 'bootstrap-switch-rails', '3.3.3'
gem 'bootstrap-generators'
gem "font-awesome-rails"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# GUID generation
gem 'uuid', '2.3.8'
# Icons
gem 'entypo-rails', '3.0.0.pre.rc2'
# JavaScript
gem "bower-rails", "~> 0.10.0"
gem 'backbone-on-rails', '1.2.0.0'
gem 'handlebars_assets', '0.21.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'js_image_paths',    '0.0.2'
gem 'js-routes',         '1.1.2'
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery',                              '1.11.2'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-angular'
  gem 'rails-assets-leaflet'
  # Should be kept in sync with jquery-rails
  gem 'rails-assets-markdown-it',                         '5.0.2'
  gem 'rails-assets-markdown-it-hashtag',                 '0.4.0'
  gem 'rails-assets-markdown-it-sanitizer',               '0.4.1'
  gem 'rails-assets-markdown-it--markdown-it-for-inline', '0.1.1'
  gem 'rails-assets-markdown-it-sub',                     '1.0.0'
  gem 'rails-assets-markdown-it-sup',                     '1.0.0'
  gem 'rails-assets-highlightjs',                         '8.9.1'
  gem 'rails-assets-typeahead.js',                        '0.11.1'
  # jQuery plugins
  gem 'rails-assets-jquery.documentsize'
  gem 'rails-assets-jquery.isinview'
  gem 'rails-assets-animate-css'
  gem 'rails-assets-wow'
  gem 'rails-assets-jquery-mousewheel'
  gem 'rails-assets-jquery-placeholder'
  gem 'rails-assets-jquery-textchange'
  gem 'rails-assets-vanilla-masker'
  gem 'rails-assets-perfect-scrollbar'
  gem 'rails-assets-jquery-smooth-scroll'
  gem 'rails-assets-Smooth-jQuery-Parallax'
  gem 'rails-assets-jakobmattsson--jquery-elastic'
  gem 'rails-assets-autosize'
  gem 'rails-assets-blueimp-gallery'
  gem 'rails-assets-blueimp-bootstrap-image-gallery'
  gem 'rails-assets-blueimp-canvas-to-blob'
  gem 'rails-assets-blueimp--JavaScript-Load-Image'
  gem 'rails-assets-blueimp-tmpl'
  gem 'rails-assets-blueimp-file-upload'
  gem 'rails-assets-jquery.jscroll'
end
gem 'bootstrap-wysihtml5-rails'
gem 'tinymce-rails'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# URIs and HTTP
gem 'addressable',        '2.3.8', require: 'addressable/uri'
gem 'faraday',            '0.9.2'
gem 'faraday_middleware', '0.10.0'
gem 'faraday-cookie_jar', '0.0.6'
gem 'typhoeus',           '0.8.0'
# Views
gem 'haml', '4.0.7'
gem 'haml-rails'
gem 'haml-contrib'
gem 'simple_form'
# Mail
gem 'markerb',             '1.1.0'
gem 'messagebus_ruby_api', '1.0.3'
# Parsing
gem 'nokogiri',          '1.6.6.4'
gem 'redcarpet',         '3.3.3'
gem 'twitter-text',      '1.13.0'
gem 'roxml',             '3.1.6'
gem 'ruby-oembed',       '0.8.14'
gem 'open_graph_reader', '0.6.1'
gem 'gravtastic'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'annotate', :groups => [:development]
gem 'kramdown', :groups => [:development], :require => false
gem 'railroady', :groups => [:development, :test]
# Prevent occasions where minitest is not bundled in
# packaged versions of ruby. See following issues/prs:
# https://github.com/gitlabhq/gitlabhq/issues/3826
# https://github.com/gitlabhq/gitlabhq/pull/3852
# https://github.com/discourse/discourse/pull/238
gem 'minitest'

group :development do
  # Automatic test runs
  gem 'guard-cucumber', '1.5.4'
  gem 'guard-jshintrb', '1.1.1'
  gem 'guard-rspec',    '4.6.4'
  gem 'guard-jasmine', '2.0.6'
  gem 'guard-rubocop', '1.2.0'
  gem 'guard-bundler', '2.1.0', require: false
  gem 'guard',          '2.13.0', require: false
  gem 'rb-fsevent',     '0.9.6', require: false
  gem 'rb-inotify',     '0.9.5', require: false
  # Linters
  gem 'jshintrb',       '0.3.0'
  gem 'rubocop',        '0.34.2'
  gem 'haml_lint',      '0.15.2'
  gem 'pronto',         '0.4.3'
  gem 'pronto-jshint',  '0.4.2'
  gem 'pronto-rubocop', '0.4.7'
  gem 'pronto-haml',    '0.4.4'
  gem 'pronto-scss',    '0.4.7', require: false
  # Preloading environment
  gem 'spring', '1.4.0'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'spring-commands-cucumber', '1.0.1'
  # Debugging
  gem 'pry'
  gem 'pry-debundle'
  gem 'pry-byebug'
  # test coverage
  gem 'simplecov', '0.10.0', require: false
end
group :test do
  # RSpec (unit tests, some integration tests)
  gem 'fixture_builder',   '0.4.1'
  gem 'fuubar',            '2.0.0'
  gem 'rspec-instafail',   '0.4.0', require: false
  gem 'test_after_commit', '0.4.1'
  # Cucumber (integration tests)
  gem 'cucumber-rails', '1.4.2'
  gem 'capybara', '2.5.0'
  gem 'database_cleaner', '1.5.1'
  gem 'selenium-webdriver', '2.47.1'
  gem "chromedriver-helper"
  # General helpers
  gem 'factory_girl_rails', '4.5.0'
  gem 'timecop',            '0.8.0'
  gem 'webmock',            '1.22.1', require: false
  gem 'shoulda-matchers',   '3.0.0'
  gem 'email_spec'
end
group :development, :test do
  # RSpec (unit tests, some integration tests)
  gem 'rspec-rails', '3.3.3'
  # Jasmine (client side application tests (JS))
  gem 'jasmine',                   '2.3.1'
  gem 'jasmine-jquery-rails',      '2.0.3'
  gem 'rails-assets-jasmine-ajax', '3.2.0',
      source: 'https://rails-assets.org'
  gem 'sinon-rails',               '1.15.0'
  # silence assets
  gem 'quiet_assets', '1.1.0'
end
