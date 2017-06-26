source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.2"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", "3.3.6"
gem "font-awesome-rails"
gem "i18n"
gem "config"
gem "bcrypt"
gem "i18n-js", ">= 3.0.0.rc11"
gem "font-awesome-sass", "~> 4.7.0"
gem "will_paginate", "3.1.0"
gem "bootstrap-will_paginate", "0.0.10"
gem "faker", "1.6.6"
gem "carrierwave", "0.11.2"
gem "mini_magick", "4.5.1"
gem "fog", "1.38.0"
gem 'turbolinks'

group :development, :test do
  gem "byebug", platform: :mri
  gem "sqlite3"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg", "0.18.4"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
