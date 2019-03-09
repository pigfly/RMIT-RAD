## Week 1

### Rails ?
- an application framework
    - full stack: web server, actions, database
- development environment
    - rake, test
- open-source community
    - many plugins

    
### Convention
- database table: `users`
- model class: `User`
- file: `/app/models/user.rb`
- configuration files
- **model driven development**
    - `rails generate scaffold Post name:string title:string content:text`
- **pluralization**: cute but painful
- **magic**: implicit calls


### + & -
- great for:
    - rapid development
    - data intensive apps with rich UIs
- bad for
    - critical systems (eg, banking)
    - specialized data (eg, web search)   

