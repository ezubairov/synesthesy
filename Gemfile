source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'

gem 'pg'

gem 'bcrypt'

gem 'puma'

gem 'haml'
gem 'sass'
gem 'coffee-script'

gem 'telegram-bot-ruby'

gem 'hanami-shrine'
gem 'image_processing'
gem 'mini_magick', '>= 4.3.5'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'

  gem 'capistrano', '~> 3.7'
  gem 'capistrano-hanami'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
