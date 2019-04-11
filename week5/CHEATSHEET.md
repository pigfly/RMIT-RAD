## week 5 cheatsheet

### Section 6.1.1

1. `db/schema.db` contains a similar `create_table` command to the migration file, along with other lines of code:

```ruby
ActiveRecord::Schema.define(version: 20180117172914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
```

2. Code contents of `db/schema.db` after running `$ rails db:rollback`:

```ruby
ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

end
```

3. After running `$ rails db:migrate`, `db/schema.rb` looks the same as listed in exercise 1.

### Section 6.1.2
1.

```ruby
>> user = User.new
=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>
>> user.class
=> User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime)
>> user.class.superclass
=> ApplicationRecord(abstract)
```

2.

```ruby
>> user.class.superclass.superclass
=> ActiveRecord::Base
```

### Section 6.1.3
1.

```ruby
>> user.name.class
=> String
>> user.email.class
=> String
```

2.

```ruby
>> user.created_at.class
=> ActiveSupport::TimeWithZone
>> user.updated_at.class
=> ActiveSupport::TimeWithZone
```

### Section 6.1.4
1.

```ruby
>> User.find_by(name: 'Josh Lusk')
  User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."name" = $1 LIMIT $2  [["name", "Josh Lusk"], ["LIMIT", 1]]
=> #<User id: 1, name: "Josh Lusk", email: "josh@example.com", created_at: "2018-01-17 17:52:01", updated_at: "2018-01-17 17:52:01">
>> User.find_by_name('Josh Lusk')
  User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."name" = $1 LIMIT $2  [["name", "Josh Lusk"], ["LIMIT", 1]]
=> #<User id: 1, name: "Josh Lusk", email: "josh@example.com", created_at: "2018-01-17 17:52:01", updated_at: "2018-01-17 17:52:01">
```

2.

```ruby
>> User.all.class
=> User::ActiveRecord_Relation
```

3.

```ruby
>> User.all.length
  User Load (0.5ms)  SELECT "users".* FROM "users"
=> 2
```

### Section 6.1.5
1.

```ruby
>> user.name = "Josh Lusk"
=> "Josh Lusk"
>> user.save
   (0.3ms)  SAVEPOINT active_record_1
  SQL (0.5ms)  UPDATE "users" SET "name" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["name", "Josh Lusk"], ["updated_at", "2018-01-17 18:09:58.956613"], ["id", 1]]
   (0.2ms)  RELEASE SAVEPOINT active_record_1
=> true
```

2.

```ruby
>> user.update_attributes(email: 'josh@example.com')
   (0.3ms)  SAVEPOINT active_record_1
  SQL (0.5ms)  UPDATE "users" SET "email" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["email", "josh@example.com"], ["updated_at", "2018-01-17 18:10:25.000923"], ["id", 1]]
   (0.2ms)  RELEASE SAVEPOINT active_record_1
=> true
```

3.

```ruby
>> user.created_at = 1.year.ago
=> Tue, 17 Jan 2017 18:10:51 UTC +00:00
>> user.save
   (0.3ms)  SAVEPOINT active_record_1
  SQL (0.6ms)  UPDATE "users" SET "created_at" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["created_at", "2017-01-17 18:10:51.168168"], ["updated_at", "2018-01-17 18:10:53.677700"], ["id", 1]]
   (0.3ms)  RELEASE SAVEPOINT active_record_1
=> true
```

### Section 6.2.1
1.

```ruby
>> User.new(name: "Example User", email: "user@example.com").valid?
=> true
```
2.
```ruby
>> User.new.valid?
=> true
```

### Section 6.2.2
1.

```ruby
>> u = User.new
=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>
>> u.valid?
=> false
>> u.errors.full_messages
=> ["Name can't be blank", "Email can't be blank"]
```

2.

```ruby
>> u.errors.messages
=> {:name=>["can't be blank"], :email=>["can't be blank"]}
>> u.errors.messages.class == Hash
=> true
>> u.errors[:email]
=> ["can't be blank"]
```

### Section 6.2.3
1.

```ruby
>> user = User.new(name: "a" * 51, email: "a" * 244 + "@example.com")
=> #<User id: nil, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...", email: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...", created_at: nil, updated_at: nil>
>> user.valid?
=> false
```

2.

```ruby
>> user.errors.full_messages
=> ["Name is too long (maximum is 50 characters)", "Email is too long (maximum is 255 characters)"]
```

### Section 6.2.4

1.

```bash
$ rails test:models
Started with run options --seed 41153

Run options: --seed 41153--=---=---=---=---=--] 0% Time: 00:00:00,  ETA: ??:??:??

# Running:

.....  7/6: [===============================      ] 85% Time: 00:00:00,  ETA: 00:.  7/7: [====================================] 100% Time: 00:00:00, Time: 00:00:00
.
Finished in 0.04103s
7 tests, 16 assertions, 0 failures, 0 errors, 0 skips



Finished in 0.054347s, 128.8020 runs/s, 294.4045 assertions/s.
7 runs, 16 assertions, 0 failures, 0 errors, 0 skips
```

### Section 6.2.5
1. Solution presented in **Listing 6.33**.
2. The `before_save` callback can be written as `before_save { email.downcase! }` to modify the email attribute directly.

### Section 6.3.2
1.

```ruby
>> user = User.new(name: "Example User", email: "user@example.com")
=> #<User id: nil, name: "Example User", email: "user@example.com", created_at: nil, updated_at: nil, password_digest: nil>
>> user.valid?
  User Exists (1.6ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER($1) LIMIT $2  [["email", "user@example.com"], ["LIMIT", 1]]
=> false
```

2.

```ruby
>> user.errors.full_messages
=> ["Password can't be blank"]
>>
```
### Section 6.3.3
1.

```ruby
>> user = User.new(name: "Example User", email: "user@example.com", password: "a" * 5, password_confirmation: "a" * 5)
=> #<User id: nil, name: "Example User", email: "user@example.com", created_at: nil, updated_at: nil, password_digest: "$2a$10$2YbdzqoPAuIralVqoHzaBO.PfPqA2547P.UxMYgEy9D...">
>> user.valid?
  User Exists (0.6ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER($1) LIMIT $2  [["email", "user@example.com"], ["LIMIT", 1]]
=> false
```

2.

```ruby
>> user.errors.full_messages
=> ["Password is too short (minimum is 6 characters)"]
```

### Section 6.3.4
1.

```ruby
>> user = User.find_by(email: "jlusk@example.com")
  User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2  [["email", "jlusk@example.com"], ["LIMIT", 1]]
=> #<User id: 6, name: "Josh Lusk", email: "jlusk@example.com", created_at: "2018-01-17 20:30:34", updated_at: "2018-01-17 20:30:34", password_digest: "$2a$10$PzRIAXrzLt7r22udGGJIAefVk7I.6VMXnuWc62mX2Th...">
```

2. The call to `save` did not work because the validations around the `password` virtual attribute were not met.

```ruby
>> user.name = "Josh H. Lusk"
=> "Josh H. Lusk"
>> user.save
   (0.3ms)  BEGIN
  User Exists (0.6ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER($1) AND ("users"."id" != $2) LIMIT $3  [["email", "jlusk@example.com"], ["id", 6], ["LIMIT", 1]]
   (0.2ms)  ROLLBACK
=> false
>> user.errors.full_messages
=> ["Password can't be blank", "Password is too short (minimum is 6 characters)"]
```

3.

```ruby
>> user.update_attribute(:name, "Josh H. Lusk")
   (0.3ms)  BEGIN
  SQL (0.7ms)  UPDATE "users" SET "name" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["name", "Josh H. Lusk"], ["updated_at", "2018-01-17 20:39:54.809455"], ["id", 6]]
   (2.3ms)  COMMIT
=> true
```

