## Week 2 Ruby

### Ruby OO - Class
```ruby
class Hello
    def howdy
         greeting=  “Hello, Alex!”
         puts greeting
    end
end
class Goodbye < Hello
     def solong
          greeting = “Goodbye, Alex!”
          puts greeting
      end
end
```

If we run this:

```ruby
friendly = Goodbye.new
friendly.howdy
friendly.solong
```

we will get:

```ruby
Hello, Alex!
Goodbye, Alex!
```

### Ruby - Variable
- no type declarations
    - `rmit = "rmit"`
- local variable
    - must start with a lowercase letter or with an underscore character
    - `pigfly`
    - `_pigfly`
- instance variable
    - always prefixed by a single at `(@)` sign   
    - `@pigfly = 9527`
- class variable
    - always prefixed by two at signs `(@@)`
    - `@@times = 0`
- global variable
    - *strongly discouraged*, source of 🐞
    - always prefixed by a dollar sign `($)`
    - `$amount = “0.00”`

---

### Ruby - String


