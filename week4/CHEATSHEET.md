## Week 4 CHEATSHEET

### 5.1.1
- `curl -OL cdn.learnenough.com/kitten.jpg`
- `mv` command, move kitten.jpg to the correct asset directory for images (Section 5.2.1).
    - `mv kitten.jpg app/assets/images/`
- Image included using `<%= image_tag("kitten.jpg", alt: "kitten") %>` to the end of the page

```rails
<%= link_to image_tag("kitten.jpg", alt: "Kitten"),
            'http://rubyonrails.org/' %>
```

###  5.1.2
- adding the CSS in Listing 5.11 to custom.scss, hide all images in the application
    - `<%#= image_tag("kitten.jpg", alt: "Kitten") %>` 

```css
/* hiding images */
img {
  display: none;
}
```

- Verify with a web inspector

---

### 5.1.3
- Replace the default Rails head with the call to render shown in Listing 5.18. Hint: For convenience, cut the default header rather than just deleting it.
- `<%= render 'layouts/rails_default' %>`
- `touch app/views/layouts/_rails_default.html.erb`

- app/views/static_pages/home.html.erb
```html
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://www.railstutorial.org/">Ruby on Rails Tutorial</a>
  sample application.
</p>
```

### 5.2.2
```css
@import "bootstrap-sprockets";
@import "bootstrap";

/* mixins, variables, etc. */

$gray-medium-light: #eaeaea;

/* universal */

body {
  padding-top: 60px;
}

section {
  overflow: auto;
}

textarea {
  resize: vertical;
}

.center {
  text-align: center;
  h1 {
    margin-bottom: 10px;
  }
}

/* typography */

h1, h2, h3, h4, h5, h6 {
  line-height: 1;
}

h1 {
  font-size: 3em;
  letter-spacing: -2px;
  margin-bottom: 30px;
  text-align: center;
}

h2 {
  font-size: 1.2em;
  letter-spacing: -1px;
  margin-bottom: 30px;
  text-align: center;
  font-weight: normal;
  color: $gray-light;
}

p {
  font-size: 1.1em;
  line-height: 1.7em;
}


/* header */

#logo {
  float: left;
  margin-right: 10px;
  font-size: 1.7em;
  color: white;
  text-transform: uppercase;
  letter-spacing: -1px;
  padding-top: 9px;
  font-weight: bold;
  &:hover {
    color: white;
    text-decoration: none;
  }
}

/* footer */

footer {
  margin-top: 45px;
  padding-top: 5px;
  border-top: 1px solid $gray-medium-light;
  color: $gray-light;
  a {
    color: $gray;
    &:hover {
      color: $gray-darker;
    }
  }
  small {
    float: left;
  }
  ul {
    float: right;
    list-style: none;
    li {
      float: left;
      margin-left: 15px;
    }
  }
}
```

### 5.3.2
- `get  '/help',    to: 'static_pages#help', as: 'helf'`

```ruby
1) Error:
StaticPagesControllerTest#test_should_get_help:
NameError: undefined local variable or method `help_path' for #<StaticPagesControllerTest:0x0000560f014f6f58>
    test/controllers/static_pages_controller_test.rb:12:in `block in <class:StaticPagesControllerTest>'

4 runs, 6 assertions, 0 failures, 1 errors, 0 skips

test "should get helf" do
    get helf_path
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

Finished in 1.953250s, 2.0479 runs/s, 4.0957 assertions/s.

4 runs, 8 assertions, 0 failures, 0 errors, 0 skips
```

```ruby
A:  test "should get help" do
    get helP_path
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

get  '/help',    to: 'static_pages#help'
```

