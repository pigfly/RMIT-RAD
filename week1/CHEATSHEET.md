## Week 1 Cheatsheet

### Init new rails app
1. `rails new your_new_app_name` # A new Rails app is created

---

### Rails structure
1. `app/​` Where most of your code will go
2. `bin/​` Where special Rails commands go. Don't worry about this.
3. `config/` ​This is where configuration and customization files go.
4. `config.ru` ​Another configuration file.
5. `db/​` Where your database lives.
6. `Gemfile​` Where other people's libraries of code gets installed from. Gemfile.lock ​Generated automatically from the Gemfile.
7. `lib/` ​Here's where you can store code you want to share between applications. log/​ Where log files go.
8. `public/` ​Where public files and images go.
9. `Rakefile`​ Special tasks you can create for your Rails application.


---

### Running the server
1. `rails s` start the server
2. `rails c` open a Rails console
3. `rails generate controller controller_name action_name` create a controller/action/view/route all in one step


