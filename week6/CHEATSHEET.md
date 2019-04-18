## week 6 cheatsheet

### Section 7.1.1

1. The controller and action of the params hash for `/about` are `static_pages` and `about`, respectively.

2.

```ruby
>> user = User.first 
  User Load (0.5ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<User id: 1, name: "Example User", email: "alex.jiang@g.com", created_at: "2018-01-21 04:05:46", updated_at: "2018-01-21 04:05:46", password_digest: "$2a$10$Nzw7IByN9Y23cUP3zPf/SOpcGTvPoOlN.eYPlF2ayRY...">
>> puts user.attributes.to_yaml
---
id: 1
name: Example User
email: user@example.com
created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &1 2019-01-21 04:05:46.891622000 Z
  zone: &2 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: *1
updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &3 2019-01-21 04:05:46.891622000 Z
  zone: *2
  time: *3
password_digest: "$2a$10$Nzw7IByN9Y23cUP3zPf/SOpcGTvPoOlN.eYPlF2ayRYPL6tgpfnje"
=> nil
>> y user.attributes
---
id: 1
name: Example User
email: user@example.com
created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &1 2019-01-21 04:05:46.891622000 Z
  zone: &2 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: *1
updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &3 2019-01-21 04:05:46.891622000 Z
  zone: *2
  time: *3
password_digest: "$2a$10$Nzw7IByN9Y23cUP3zPf/SOpcGTvPoOlN.eYPlF2ayRYPL6tgpfnje"
=> nil
```

### Section 7.1.2
1.

```erb
<%= @user.name %>, <%= @user.email %> <br>
Created at <%= @user.created_at %>, updated last at <%= @user.updated_at %>.
```

2. Refreshing the browser with the time code embedded (see below) reevaluates/redisplays the current time.

```erb
<%= @user.name %>, <%= @user.email %> <br>
Created at <%= @user.created_at %>, updated last at <%= @user.updated_at %>. <br>
Current Time: <%= Time.now %>.
```

### Section 7.1.3

1. Displaying the `params` hash as YAML (see below) looks exactly the same as the debug output in the HTML.


```
Started GET "/users/1" for 127.0.0.1 at 2018-01-20 23:20:03 -0500
Processing by UsersController#show as HTML
  Parameters: {"id"=>"1"}
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
Return value is: nil

[1, 10] in /Users/alexjiang/environment/sample_app/app/controllers/users_controller.rb
    1: class UsersController < ApplicationController
    2: 
    3: 	def show
    4: 		@user = User.find(params[:id])
    5: 		debugger
=>  6: 	end
    7: 
    8:   def new
    9:   end
   10: end
(byebug) puts params.to_yaml
--- !ruby/object:ActionController::Parameters
parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  controller: users
  action: show
  id: '1'
permitted: false
nil
```

2.

```
Started GET "/users/new" for 127.0.0.1 at 2018-01-20 23:22:43 -0500
Processing by UsersController#new as HTML
Return value is: nil

[1, 10] in /Users/alexjiang/environment/sample_app/app/controllers/users_controller.rb
    1: class UsersController < ApplicationController
    2: 
    3: 	def show
    4: 		@user = User.find(params[:id])
    5: 	end
    6: 
    7:   def new
    8:   	debugger
=>  9:   end
   10: end
(byebug) @user
nil
```

### Section 7.1.4
1. The MD5 hash associated with the image for my gravatar email address is [a61b37d367dff8110f986469327d1cc4](https://secure.gravatar.com/avatar/a61b37d367dff8110f986469327d1cc4).
2. The code in listing `7.12` does correctly manipulate the size of the image based on the keyword argument.
3. The code in listing `7.13` is confirmed to be able to be used in place of the code in listing `7.12`.

### Section 7.2.1
1.

```ruby
undefined method `nome' for #<User:0x00007f82d2cf2220>
Did you mean?  name
```

2. `foobar` would be a bad choice for the block variable (currently `f`) because while `f` can me mapped to `form` as a good shorthand variable, `foobar` is simply a placeholder word that in no way relates to `form`.

### Section 7.2.2
1. [*Learn Enough HTML to be Dangerous*](http://learnenough.com/html-tutorial) does not include a server-side component that, in most simple examples, would be required to demonstrate the function of a `form` tag.

### Section 7.3.2
1. Debug information (from `/signup?admin=1` path) displayed below:

```
--- !ruby/object:ActionController::Parameters
parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  admin: '1'
  controller: users
  action: new
permitted: false
```

### Section 7.3.3
1. Changing the min password length to 5 updates the error message to read: `Password is too short (minimum is 5 characters)`.
2. We've pointed the `signup` route to `users#new`, but the call to render the `new` view from the `create` action results in the path being `/users` (see **Table 7.1**).

### Section 7.3.4
1.

```ruby
test "invalid signup information" do
  get signup_path
  assert_no_difference 'User.count' do
  post users_path, params: { user: { name: "",
                                     email: "user@invalid",
                                     password:              "foo",
                                     password_confirmation: "bar" } }
  end
  assert_template 'users/new'
  assert_select 'div#error_explanation'
  assert_select 'div.alert.alert-danger'
  assert_select "li", "Name can't be blank"
  assert_select "li", "Email is invalid"
  assert_select "li", "Password confirmation doesn't match Password"
  min_validation = User.validators_on(:password).find do |v|
    v.options.key?(:minimum)
  end
  min_length = min_validation.options[:minimum]
  assert_select "li", "Password is too short (minimum is #{min_length} characters)"
end
```

2. The tests are still green because pointing `post /signup` to `users#create` just add *another way to navigate to that route*, it does not invalidate the use of `post /users` as a means to trigger the `users#create` action.

3. The tests are still green aftering modifying the `new.html.erb` users view to match **Listing 7.2.6**.

4. Adding `assert_select 'form[action="/signup"]'` as the second assertion in the `users_signup` integration test helps verify that the sign up form is `POST`ing to the `/signup` route, not the `/users` route.

### Section 7.4.1
1.

```ruby
>> user = User.find(2) # User created on form submission (2nd overall user)
  User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
=> #<User id: 2, name: "alex jiang", email: "alex.jiang@g.com", created_at: "2019-01-21 21:06:43", updated_at: "2019-01-21 21:06:43", password_digest: "$2a$10$7jQSCRZ4z8h0eBRnqWYk5.8r4ZFzUKuYvFylU/gxCVt...">
>> user.attributes                                                         
=> {"id"=>2, "name"=>"alex jiang", "email"=>"alex.jiang@g.com", "created_at"=>Sun, 21 Jan 2018 21:06:43 UTC +00:00, "updated_at"=>Sun, 21 Jan 2018 21:06:43 UTC +00:00, "password_digest"=>"$2a$10$7jQSCRZ4z8h0eBRnqWYk5.8r4ZFzUKuYvFylU/gxCVt0ypb6DRime"}
```

2. Verified that by updating **Listing 7.28** and submitting a valid user that `redirect_to user_url(@user)` has the same effect as `redirect_to @user`.

### Section 7.4.2
1.

```ruby
>> "#{:success}"
=> "success"
```

2. The section of the flash iteration that sets the class names for the `div` could be rewritten as follows:

```erb
<div class="<%= "alert alert-#{message_type}" %>">
```

### Section 7.4.3
1. Verified the user was successfully created as in **Listing 7.32**.
2. Verified that the Gravatar correctly appear for a new user created with my personal email address.

### Section 7.4.4
1. The line `assert_not flash.empty?` was added to the bottom of the signup validity test.
2. All tests still pass after implementing the change in **Listing 7.35**.
3. The tests do fail when the `redirect_to` line in commented out of the User controller's `create` method (action).
4. If `@user.save` is returning false, most likely the validations are catching incorrect user information that is trying to be saved (triggered when `User.count` is not one more that it was before).


