## Attention
- This serves a backup for people to fail to use Docker on very "dedicated" platform
- **Do not use this box unless you have no choice !**
- **Make sure your BIOS setting has hyper-V setting enabled**

## Building the Vagrant Enviornment
0. https://www.vagrantup.com/, https://www.virtualbox.org/
1. clone this repo 
2. Run `cd 2020_s1/box_vagrant`
3. Run `vagrant plugin install vagrant-vbguest` to install the plugin to link vagrant with virtualbox
4. create a folder called *app* under 2020_s1/box_vagrant
5. Run `vagrant up` to starts and provisions the vagrant environment
6. Run `vagrant provision` to provisions the vagrant machine or if the step 1 fails to provision.

## Accessing the Vagrant Environment
1. Run `vagrant ssh` to ssh into the vagrant box
2. Run `cd /app` to access the app directory
3. Run `gem install rails -v 5.2.4.1` to install rails
4. Run `rails _5.2.4.1_ new . --force --no-deps --database=postgresql` to install a fresh rails app
5. Run `bundle install` to install all dependency gems
6. Run `rails db:create` to create database
7. Run `rails s -b 0.0.0.0 -p 3000` to run rails server
2. hit `http://0.0.0.0:3000`


### VirtualBox Guide
1. Download Virtual Box https://www.virtualbox.org/
2. Clone this repo 
3. Download the image from https://tinyurl.com/snt2z8z
4. Import RAD2020.ova through VB (Do not create)
5. Start RAD2020
6. password: 123456 

### Cheat Sheet
- docker
  - `docker-compose run --rm --service-port web bash`
  - `rails s -b 0.0.0.0`
  - `exit`
  - `docker-compose down`
- vagrant
  - `vagrant up`
  - `vagrant provision`
  - `vagrant ssh`
  - `vagrant halt`

### Mac
- `sudo /Library/Application\ Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh restart`
- `sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist`
- `System Preferences > Security & Privacy > Privacy > Full Disk Access`
  - `Command-Shift-G.`
  - `/sbin/nfsd`
- `System Preferences > Security & Privacy > Privacy > Grant Vagrant Kext`