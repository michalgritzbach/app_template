def source_paths
  Array(super) + 
    [File.expand_path(File.dirname(__FILE__))]
end

gem 'paranoia', '~> 2.0'
gem 'inherited_resources'
gem 'simple_form'
gem 'faker'
gem 'thin'
gem 'foundation-rails'
gem 'paperclip', github: 'thoughtbot/paperclip' # fixes generator problems (https://github.com/thoughtbot/paperclip/issues/1495)
gem 'rails-i18n', '~> 4.0.0' # For 4.0.x
gem 'paper_trail', '~> 3.0.2'
gem 'devise'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry'
  gem 'pry-byebug'
  gem 'letter_opener'

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-annotate'
end

gem_group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

gsub_file "Gemfile", /^gem\s+["']sqlite3["'].*$/, ''
insert_into_file 'Gemfile', "\nruby '2.1.2'", after: "source 'https://rubygems.org'\n"

create_file('.ruby-version') { '2.1.2' }
create_file('.ruby-gemset') { @app_name }
copy_file('Guardfile')

run("/bin/bash --login 'rvm use 2.1.2@#{@app_name} --create'")

run('bundle install')

generate('devise:install')

directory('spec')
create_file('.rspec', '--color')
run('bundle binstubs rspec-core')

append_to_file '.gitignore', <<-CODE
.DS_Store
config/initializers/secret_token.rb
config/secrets.yml
config/database.yml

## Environment normalisation:
/.bundle
/vendor/bundle
CODE

git :init
git add: '.'
git commit: "-am 'Initial commit'"
