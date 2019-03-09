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


### Restaurant Review example
- [melbourne coffee](https://www.google.com/search?q=melbourne+coffee)
#### Where to make these changes in MVC ?
1. increase font size of reviews
2. allow editing if logged in as author
3. change rating of zero to mean no rating

---

### ❌ Common mistake 
- put model code in controller

```ruby
class SitesController < ApplicationController
    def visit

        @address = params[:address]
        unless Site.exists?(["site = ?", @address])
            @site = Site.create(:site=>@address, :visits => 0)
        end
            @site = Site.find(:first,:conditions => ["site = ?", @address])
            if params.has_key?(:visit_time)
                @visit_time = params[:visit_time]
                unless @site.avg_visit_time.nil?
                    @site.avg_visit_time =
                    ((@site.avg_visit_time *
                    (@site.visits)) + @visit_time.to_i) /(@site.visits+1)
        else
            @site.avg_visit_time = @visit_time.to_i
        end
        @site.visits += 1
        @site.save
    end
end
```



