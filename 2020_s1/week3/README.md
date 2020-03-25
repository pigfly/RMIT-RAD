## Cheat Sheet

1. `docker-compose run --rm --service-port web bash`
2. `rails db:create`
3. `docker-compose run web bundle show`
4. `docker-compose run web bundle install --without production`
5. `app/controllers/application_controller.rb`

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

11. `app/views/static_pages/home.html.erb`, `app/views/static_pages/help.html.erb`
12. `config/routes.rb`
13. `touch app/views/static_pages/about.html.erb`