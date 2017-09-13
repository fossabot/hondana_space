source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"

gem "dotenv-rails"
gem "isbn"
gem "mini_racer"
gem "mysql2"
gem "puma"
gem "rapa"

# front-end
gem "simple_form"
gem "bootstrap", "~> 4.0.0.beta"
gem "font-awesome-rails"
gem "jquery-rails"
gem "sass-rails"
gem "slim-rails"
gem "uglifier"

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
