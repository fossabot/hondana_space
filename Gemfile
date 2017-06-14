source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"

gem "dotenv-rails"
gem "mysql2"
gem "puma"

# front-end
gem "normalize-rails"
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
  gem "rubocop-github", github: "tetsuya/rubocop-github", branch: "style-to-layout"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-commands-rubocop"
  gem "spring-watcher-listen"
end
