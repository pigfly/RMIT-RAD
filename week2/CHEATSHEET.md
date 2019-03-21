## Week 2 CHEATSHEET

### C9 Init
- `printf "install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri\n" >> ~/.gemrc`
- `gem install rails -v 5.1.6`
- `cd ~/environment`
- `rails _5.1.6_ new toy_app`
- `cd toy_app/`
- **update your gemfile**
    - https://www.railstutorial.org/book/toy_app#code-demo_gemfile_sqlite_version_redux
- `bundle update`
- `bundle install --without production`

### Hello Action
- application_controller.rb
- config/routes.rb

### User Model
- `rails generate scaffold User name:string email:string`
- `rails db:migrate`
- `rails server`

