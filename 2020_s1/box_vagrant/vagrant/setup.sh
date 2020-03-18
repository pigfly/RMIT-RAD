#!/usr/bin/env bash
# install javascript runtime, which is required by gem `uglifier`
sudo apt-get install -y nodejs nodejs-legacy npm

# install postgresql
sudo apt-get install -y postgresql postgresql-contrib postgresql-client libpq-dev
# create superuser using current linux user
sudo -u postgres createuser -s -e `whoami`

# gem install
cd /app
gem install bundler