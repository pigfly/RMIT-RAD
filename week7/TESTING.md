## week 7 testing made simple

### Testing in Rails
- The default rails application comes with its own testing framework. It is located in the “test” folder:

```bash
/test
    /fixtures
    /functional
    /integration
    /unit
```

- **Unit**: test a single rails model
- **Functional**: test a single rails controller
- **Integration**: test the interaction between multiple rails controllers

### Hello World

```rails
    >> rails new test_project
    >> rails generate model hello
    >> rails db:migrate
    >> vim test/unit/hello_test.rb
    >>
    require 'test_helper'
    
        class HelloTest < ActiveSupport::TestCase
            test "the truth" do
              assert true, "hello, this test passed"
            end
            def test_the_lie
                assert_equal 1, 2, "hello, this test failed"
            end
        end
        
    >> rails db:test:prepare
    >> rails test
```

1. Creating a new model using “rails generate” will automatically make a corresponding test file in “test/unit/modelname_test.rb”
2. Tests are grouped into classes. The class is defined to be a subclass of `“ActiveSupport::TestCase”` which defines all of the “assert” statements.
3. Each test is a function. Any function whose name begins with the characters “test” is assumed to be a test, and will be run when you type “rake test”. Notice that there are two ways to define a function. First, you can use the traditional “def function_name” syntax. However, ActiveSupport::TestCase defines a “test” function which takes a string name, replaces all the spaces with underscores, prepends “test_”, and performs an `“class_eval”` (ruby meta programming) to add the function to the class.
4. A test consists of normal ruby code + assert statements. A full list of available assert statements is in the Rails Guide.
5. rake db:test:prepare makes sure that the test database schema has the proper migrations. If you have pending migrations, this command will warn you appropriately.


### Functional Tests
In the example below, I am designing a web service to help me add numbers together. It will behave roughly like this:

```html
Request:
GET /add?num1=2&num2=4

Response:
200
Content-Type: text/plain
6
```

In the case that the input is invalid, it should return with a “400” Bad Request status code.

Here are the tests describing the behaviour of this web service:

```ruby
class MathControllerTest < ActionController::TestCase
  test "add when input is correct" do
      get :add, { 'num1' => -2, 'num2' => 4}
      assert_response 200
      assert_equal "2", @response.body
      assert_equal "text/plain", @response.content_type
  end
  test "add should return 400 when params invalid" do
      get :add, {'num2' => 'blah'}
      assert_response 400
  end
end
```

Note that like the Unit test cases, functional test cases are subclasses of `“ActionController::TestCase”`. However, Rails magically gives you access to some request/response functions and variables:

- Functions
    - `get`
    - `post`
    - `put`
    - `head`
- Hashes
    - `assign`: Any objects that are stored as instance variables for use in views.
    - `cookies`: Any cookies that are set.
    - `flash`: Any objects living in the flash.
    - `session`: Any object living in session variables.
- Variables:
    - `@controller`: The controller processing the request (the object, not the class)
    - `@request`: The most recent request
    - `@response`:   The most recent response

Here is the completed web service:

```ruby
class MathController < ApplicationController
  def add
      begin
          n1 = Integer(params[:num1])
          n2 = Integer(params[:num2])
          render :text => (n1+n2).to_s,
:content_type => "text/plain"
      rescue
          render :status => 400, :text => "Invalid Input"
      end
  end
end
```

And the routes:

```ruby
FunctionalTestExample::Application.routes.draw do
  match "add" => "math#add"
end
```


