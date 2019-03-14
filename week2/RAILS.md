## Week 2 Rails

### Rails - handy command
- format: `rails [command] [args]`
    - `rails new <project>`
    - `rails generate <asset | model | resource etc.> <parameters>`
    - `rails destroy <asset | model | resource etc.> <parameters>`
- “rake” is Ruby’s make system
    - `rake -T`
    - `rake db:setup; rake db:migrate; rake db:drop:all`
    - `rake test; rake test:uncommitted`
- NOTE ❗️
    - Many common tasks come built-in with rails but you can always develop custom rake tasks to automate your own work

### Rails - routing
- docs: [rails routing](http://guides.rubyonrails.org/routing.html)
- documentation in your `routes.rb` file
- Router
    - Maps a URI to methods in controllers
        - e.g. `post "home/login" => "home#login"`
    - generating paths and URLs - no hard-coding of URLs
    
#### Resourceful Routing
- `rails generate resource book title:string author:string price:number`
- Check `config/routes.rb` file for `resources :books`

| HTTP Verb | Path            | action  | used for                                 |
|-----------|-----------------|---------|------------------------------------------|
| GET       | /books          | index   | display a list of all books              |
| GET       | /books/new      | new     | return HTML form for creating a new book |
| GET       | /books/:id      | show    | display a specific book                  |
| GET       | /books/:id/edit | edit    | return HTML form for editing a book      |
| PUT       | /books          | update  | update a specific book                   |
| DELETE    | /books          | destroy | delete a specific book                   |
| POST      | /books          | create  | create a new book                        |


#### Non-Resourceful Routing
- Static routes
    - `post /home/login => “home#login”`
    - `get /home/index`
- Dynamic segments
    - `match ":controller/" => ":controller#index"`
    - http://localhost:3000/books will map to `BooksController.index`

#### Helper Methods for Routing in MVC
- books_path returns /books
- new_book_path returns /books/new
- edit_book_path(:id) returns /books/:id/edit
- book_path(:id) returns /books/:id

#### Inspecting and Testing Routes
- `rake routes`

#### Namespaces in Resourceful Routing
```ruby
namespace :admin do
    resources :posts, :comments
end
```

