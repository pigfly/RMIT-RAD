## Cheat Sheet

1. `docker-compose build`
2. `docker-compose up`
3. `docker-compose run --rm web rails db:create`
4. `docker-compose run web bundle show`
5. `docker-compose run web bundle install --without production`
6. `app/controllers/application_controller.rb`

```ruby
protect_from_forgery with: :exception

    def hello     
       render html: "hello, world!"   
    end
```

7. `config/routes.rb`

```ruby
root 'application#hello'
```

8. `docker-compose run web rails generate controller StaticPages home help`
9. `docker-compose run web rails destroy controller StaticPages home help`
10. `docker-compose run web rails test`

```ruby
test "should get about" do     
    get static_pages_about_url     
    assert_response :success   
  end 
```