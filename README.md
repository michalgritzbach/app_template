app_template
============

My application template for new Rails 4 apps. Just commonly used gems and rspec + guard set up, nothing more.

Usage
=====

```
rails new { your app name } -T -d { database of your choice } -m https://github.com/michalgritzbach/app_template/blob/master/rails-app-template.rb --skip-bundle
```

What's included
===============

*Gems:*
- paranoia
- inherited_resources
- simple_form
- faker
- thin
- foundation-rails
- paperclip
- rails-i18n
- paper_trail
- devise

*Development:*
- better_errors
- binding_of_caller
- meta_request
- pry
- pry-byebug
- letter_opener
- guard
- guard-rspec
- guard-bundler
- guard-annotate

*Test:*
- rspec-rails
- capybara
- factory_girl_rails
- database_cleaner
