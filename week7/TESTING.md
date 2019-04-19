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
2. Each file has “require test_helper”. This imports a file located at “test/test_helper.rb”. This is especially useful if you want to define some custom helper functions for testing.
3. Tests are grouped into classes. The class is defined to be a subclass of `“ActiveSupport::TestCase”` which defines all of the “assert” statements. If you want to define custom “assert” statements, you can reopen the “ActiveSupport::TestCase” class in your “test_helper.rb”.
4. Each test is a function. Any function whose name begins with the characters “test” is assumed to be a test, and will be run when you type “rake test”. Notice that there are two ways to define a function. First, you can use the traditional “def function_name” syntax. However, ActiveSupport::TestCase defines a “test” function which takes a string name, replaces all the spaces with underscores, prepends “test_”, and performs an `“class_eval”` (ruby metaprogramming) to add the function to the class.
5. A test consists of normal ruby code + assert statements. A full list of available assert statements is in the Rails Guide.
6. rake db:test:prepare makes sure that the test database schema has the proper migrations. If you have pending migrations, this command will warn you appropriately.


