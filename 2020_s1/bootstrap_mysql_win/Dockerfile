# Dockerfile
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
RUN apt-get install libmysqlclient-dev -y
RUN apt-get install sqlite3 -y
RUN apt-get install libssl-dev libyaml-dev libsqlite3-dev autoconf libgmp-dev libgdbm-dev -y
RUN apt-get install libncurses5-dev automake libtool bison pkg-config libffi-dev -y
RUN mkdir /railsapp
RUN echo 'gem: --no-document' >> ~/.gemrc
EXPOSE 3000
WORKDIR /railsapp
ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock
RUN bundle install
ADD . /railsapp