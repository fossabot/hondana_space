source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"

gem "dotenv-rails"
gem "foreman"
gem "mysql2"
gem "puma"
gem "rapa"
gem "sorcery"

# front-end
gem "font-awesome-rails"
gem "foundation-rails", "~> 6.4"
gem "jbuilder"
gem "normalize-rails"
gem "sass-rails"
gem "simple_form"
gem "slim-rails"
gem "uglifier"
gem "webpacker", github: "rails/webpacker"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "listen"
  gem "rubocop", require: false
  gem "rubocop-github"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-commands-rubocop"
  gem "spring-watcher-listen"
end
