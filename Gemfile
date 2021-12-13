source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'


gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise' , '>= 4.8.0'
gem 'pundit', '~> 2.1', '>= 2.1.1'
gem "rolify" , '>= 6.0.0'

group :development, :test do
  gem 'awesome_print', '~> 1.9', '>= 1.9.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec', '~> 3.10'
end

group :development do

  gem 'web-console', '>= 4.1.0'


  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'letter_opener', '~> 1.7'

  gem 'spring'
end

group :test do

  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'

  gem 'webdrivers'

  gem 'faker',                        '~> 1.8', '>= 1.8.7'
  gem 'factory_bot_rails',            '~> 4.8', '>= 4.8.2'
  gem 'rails-controller-testing',     '~> 1.0.2'
  gem 'rspec-rails'
  gem 'shoulda',                      '~> 3.5'
  gem 'shoulda-callback-matchers',    '~> 1.1', '>= 1.1.3'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
