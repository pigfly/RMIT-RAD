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

