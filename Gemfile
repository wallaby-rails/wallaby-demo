source 'http://rubygems.org'

ruby '3.2.2'

git 'https://github.com/wallaby-rails/wallaby-rails.git' do
  gem "wallaby"
  gem "wallaby-core"
  gem "wallaby-view"
  gem "wallaby-active_record"
end
# gem 'wallaby', '~> 6.1.2'
# gem 'wallaby', git: 'git@github.com:wallaby-rails/wallaby.git', branch: 'develop'
# gem 'wallaby-core', git: 'git@github.com:wallaby-rails/wallaby-core.git', branch: 'develop'
# gem 'wallaby-active_record', git: 'git@github.com:wallaby-rails/wallaby-active_record.git', branch: 'develop'
# gem 'simple_blog_theme', git: 'https://github.com/wallaby-rails/simple_blog_theme.git', branch: 'master'
# gem 'wallaby', git: 'https://github.com/wallaby-rails/wallaby.git', branch: 'develop'
# gem 'wallaby-core', git: 'https://github.com/wallaby-rails/wallaby-core.git', branch: 'develop'
# gem 'wallaby-active_record', git: 'https://github.com/wallaby-rails/wallaby-active_record.git', branch: 'develop'
# gem 'wallaby', '7.0.0.beta1', path: '../wallaby'
# gem 'wallaby-core', '0.3.0.beta1', path: '../wallaby-core'
# gem 'wallaby-active_record', '0.3.0.beta1', path: '../wallaby-active_record'
# gem 'wallaby', '~> 6.1.0', path: '../wallaby'
# gem 'wallaby-core', '~> 0.2.0', path: '../wallaby-core'
# gem 'wallaby-active_record', '~> 0.2.0', path: '../wallaby-active_record'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.1'

# Date sources
gem 'pg'

gem 'devise'
gem 'cancancan'

# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
gem 'font-awesome-sass', '< 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'ffaker', require: false

gem 'bootstrap'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
