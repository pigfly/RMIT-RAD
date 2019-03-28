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
```html
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
  sample application.
</p>
```

- app/views/static_pages/help.html.erb
```html
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
- test/controllers/static_pages_controller_test.rb
```ruby
test "should get about" do
    get static_pages_about_url
    assert_response :success
end
```

- `rails test`
- config/routes.rb
```ruby
get  'static_pages/about'
```
- app/controllers/static_pages_controller.rb
```ruby
def about
end
```

- `touch app/views/static_pages/about.html.erb`
```html
<h1>About</h1>
<p>
  The <a href="https://www.railstutorial.org/"><em>Ruby on Rails
  Tutorial</em></a> is a
  <a href="https://www.railstutorial.org/book">book</a> and
  <a href="http://screencasts.railstutorial.org/">screencast series</a>
  to teach web development with
  <a href="http://rubyonrails.org/">Ruby on Rails</a>.
  This is the sample application for the tutorial.
</p>
```

- `rails test`
- `mv app/views/layouts/application.html.erb layout_file`
- test/controllers/static_pages_controller_test.rb
```ruby
assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
assert_select "title", "About | Ruby on Rails Tutorial Sample App"
``` 

- app/views/static_pages/home.html.erb
```html
<title>Home | Ruby on Rails Tutorial Sample App</title>
```

- app/views/static_pages/help.html.erb
```html
<title>Help | Ruby on Rails Tutorial Sample App</title>
```

- app/views/static_pages/about.html.erb
```html
<title>About | Ruby on Rails Tutorial Sample App</title>
```

- test/controllers/static_pages_controller_test.rb
```ruby
def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
end
assert_select "title", "Home | #{@base_title}"
...
```


