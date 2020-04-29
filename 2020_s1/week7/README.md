## Heroku

- https://dry-sierra-06894.herokuapp.com/

### Setup
- install heroku CLI
- `heroku login`
  - optional: `ssh-keygen -t rsa -b 4096 -C "your_email@rmit.edu.au"`
- `heroku keys:add`
- go to your local repo, commit all changes in master
- `heroku create`
- `git push -u heroku master`
- `heroku run rails db:version`
- `heroku run rails --trace db:migrate`
- `heroku open`