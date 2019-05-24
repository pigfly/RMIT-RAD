## week 8 cheatsheet
1.

```ruby
>> user = User.first
  User Load (0.5ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.org", created_at: "2019-01-21 21:24:43", updated_at: "2019-01-21 21:24:43", password_digest: "$2a$10$pYeW./EatWhQgNsFlkE1nOIlUmjLPu9IjBLxQAYfjce...", remember_digest: nil>
>> user.remember
   (0.3ms)  BEGIN
  SQL (51.2ms)  UPDATE "users" SET "updated_at" = $1, "remember_digest" = $2 WHERE "users"."id" = $3  [["updated_at", "2018-01-29 04:39:23.382813"], ["remember_digest", "$2a$10$WautEzRlvGWz2WyiRA6ukOkO5ddMAJt4Kr6zblyA.veO8re/LvctW"], ["id", 1]]
   (0.6ms)  COMMIT
=> true
>> user.remember_token
=> "iNlGdGeybz9yzt90jLPONA"
>> user.remember_digest
=> "$2a$10$WautEzRlvGWz2WyiRA6ukOkO5ddMAJt4Kr6zblyA.veO8re/LvctW"
```

2.

```ruby
>> user = User.first
  User Load (0.5ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.org", created_at: "2019-01-21 21:24:43", updated_at: "2019-01-29 04:55:49", password_digest: "$2a$10$pYeW./EatWhQgNsFlkE1nOIlUmjLPu9IjBLxQAYfjce...", remember_digest: "$2a$10$2pVtFKovRYJDn5QrWXh6jeMXfwuCxrGq40pt7S/ckeE...">
>> user.authenticated?('notokenyet')
=> false
>> user.remember
   (0.3ms)  BEGIN
  SQL (0.6ms)  UPDATE "users" SET "updated_at" = $1, "remember_digest" = $2 WHERE "users"."id" = $3  [["updated_at", "2019-01-29 04:59:40.255900"], ["remember_digest", "$2a$10$9jvDJhDMEG2mh9OfLx5E2O2g8JQSialxY1YYah8GJdqxeHOcfs1.q"], ["id", 1]]
   (0.8ms)  COMMIT
=> true
>> user.authenticated?(user.remember_token)
=> true
>> 
```

3.
![double logout error](https://raw.githubusercontent.com/pigfly/RMIT-RAD/master/week8/img/1.png)

![double browser logout error](https://raw.githubusercontent.com/pigfly/RMIT-RAD/master/week8/img/2.png)

Uncommenting the fixes does change the test suite from red to green:

```ruby
Finished in 0.54743s
24 tests, 68 assertions, 0 failures, 0 errors, 0 skips
...
Finished in 0.578573s, 41.4814 runs/s, 117.5305 assertions/s.
24 runs, 68 assertions, 0 failures, 0 errors, 0 skips
```

### Section 9.2
1. The checkbox is having its intended effect; checking it adds both a `remember_token` and a `user_id` cookie to the browser, and not checking it adds neither.
2.
```ruby
>> 1 == 2 ? 'no way' : 'phew!'
=> "phew!"
>> 2 == 2 ? 'that\'s better' : 'not gonna happen'
=> "that's better"
```

### Section 9.3.2
1. The test fails with the `authenticated?` part of the expression removed:

```ruby
Failure:
SessionsHelperTest#test_current_user_returns_nil_when_remember_digest_is_wrong [/Users/alex/environment/sample_app/test/helpers/sessions_helper_test.rb:17]:
Expected #<User id: 208889123, name: "Foo Bar", email: "foo@bar.com", created_at: "2019-02-03 15:42:48", updated_at: "2019-02-03 15:42:48", password_digest: "$2a$04$vpjPuDJWYiardb28TO1/yet4Tx6XudLZ.rjnrhDAEDK...", remember_digest: "$2a$04$pMwZWHcZ8RtD7o5M13M6ielnjUKyCf0P/.GvKlRqVK5..."> to be nil.
```


