## Week 3 CHEATSHEET

### app Init
- `cd ~/environment`
- `rails _5.1.6_ new sample_app`
- `cd sample_app/`
- **update your gemfile**
    - https://www.railstutorial.org/book/static_pages
- `bundle install --without production`
- `bundle update`

### Hello Action
- app/controllers/application_controller.rb
```ruby
def hello
    render html: "hello, world!"
end
```

- config/routes.rb
```ruby
root 'application#hello'
```

---

### Static Pages
- `rails generate controller StaticPages home help`
- config/routes.rb
```ruby
get  'static_pages/home'
get  'static_pages/help'
``` 

- app/views/static_pages/home.html.erb
```ruby
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
  sample application.
</p>
```

- app/views/static_pages/help.html.erb
```ruby
<h1>Help</h1>
<p>
  Get help on the Ruby on Rails Tutorial at the
  <a href="https://www.railstutorial.org/help">Rails Tutorial help page</a>.
  To get help on this sample app, see the
  <a href="https://www.railstutorial.org/book"><em>Ruby on Rails Tutorial</em>
  book</a>.
</p>
```

---

### Testing

