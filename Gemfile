source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.0"
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'tzinfo-data'
gem 'active_model_serializers', '~> 0.10.0'

# authentication
gem 'devise_token_auth'
gem 'omniauth'
gem 'rack-cors'

# routing
gem 'friendly_id', '~> 5.1.0'
gem 'russian'

# working with images
gem 'carrierwave'
gem "mini_magick"
gem 'carrierwave-base64'
gem 'carrierwave-aws'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
