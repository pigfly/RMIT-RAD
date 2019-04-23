## week 7 cheatsheet

### Section 8.1.1
1. `GET login_path` routes to the Sessions Controller's `show` action and `POST login_path` routes to the Sessions Controller's 'create` action.

2.

```bash
$ rails routes | grep 'users#'
   signup GET    /signup(.:format)         users#new
          POST   /signup(.:format)         users#create
    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
 new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit
     user GET    /users/:id(.:format)      users#show
          PATCH  /users/:id(.:format)      users#update
          PUT    /users/:id(.:format)      users#update
          DELETE /users/:id(.:format)      users#destroy
$ rails routes | grep 'sessions#'
    login GET    /login(.:format)          sessions#new
          POST   /login(.:format)          sessions#create
   logout DELETE /logout(.:format)         sessions#destroy
$ rails routes | grep 'users#' | wc -l
      10
$ rails routes | grep 'sessions#' | wc -l
       3
```

### Section 8.1.2
1. Because we addded the key `:url` to the `form_for`'s hash with the value `login_path`, the path the URL will be posting to is `/login`. in `config/routes.rb`, this path is routed to go to the `create` action in the sessions controller.

### Section 8.1.3
1.

```ruby
>> user = nil
=> nil
>> !!(user && user.authenticate('foobar'))
=> false
>> user = User.first
  User Load (0.7ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<User id: 6, name: "Alex Jiang", email: "alex.jiang@g.com", created_at: "2019-01-17 20:30:34", updated_at: "2019-01-17 20:39:54", password_digest: "$2a$10$PzRIAXrzLt7r22udGGJIAefVk7I.6VMXnuWc62mX2Th...">
>> !!(user && user.authenticate('foobaz'))
=> false
>> !!(user && user.authenticate('foobar'))
=> true
```

### Section 8.1.4
1. Verified that the flash message disappears when you click on a second page, away from the login view.

### Section 8.2.2
1.

```ruby
>> User.find_by(id: 1000)
  User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1000], ["LIMIT", 1]]
=> nil
```

2. Specifically note that no SQL is executed on the last `||=` used in conjunction with `@current_user`:

```ruby
>> session = {}
=> {}
>> session[:user_id] = nil                              
=> nil
>> @current_user ||= User.find_by(id: session[:user_id])
  User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."id" IS NULL LIMIT $1  [["LIMIT", 1]]
=> nil
>> session[:user_id] = User.first.id                    
  User Load (0.3ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> 1
>> @current_user ||= User.find_by(id: session[:user_id])
  User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
=> #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.org", created_at: "2018-01-21 21:24:43", updated_at: "2018-01-21 21:24:43", password_digest: "$2a$10$pYeW./EatWhQgNsFlkE1nOIlUmjLPu9IjBLxQAYfjce...">
>> @current_user ||= User.find_by(id: session[:user_id])
=> #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.org", created_at: "2018-01-21 21:24:43", updated_at: "2018-01-21 21:24:43", password_digest: "$2a$10$pYeW./EatWhQgNsFlkE1nOIlUmjLPu9IjBLxQAYfjce...">
```

### Section 8.2.4
1. Removing the `!` from the line !current_user.nil? (within the `logged_in?` method) does cause the tests in `test/integration/users_login_test.rb` to fail.
2. The tests again path when the `!` is reinstated.

### Section 8.2.5
1. The test suite become red if you comment out the `log_in` line in **Listing 8.25**.
2. The test suite is confirmed to toggle between red and green based on whether or not the `log_in` line in **Listing 8.24** is commented out or not.

### Section 8.3
1. Verified that the logout link works as expected. Once the redirect happens, the Account drop-down is replaced by the Log in link, which is what gets asserted in the last three lines of the test.
2. The session is correctly removed after logging out.

