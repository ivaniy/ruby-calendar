# Calendar


1. Install rvm
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```
```
\curl -L get.rvm.io | bash -s stable
```
```
source ~/.rvm/scripts/rvm
```
```
rvm requirements
```

2. Install ruby 2.5.1
```
rvm install 2.5.1
```
```
rvm use 2.5.1
```

3. Install Ruby on Rails
```
gem install rails -v 5.2
```

4. Install NodeJS
```
sudo apt-get install nodejs
```

5. Install mySQL
```
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
```
```
sudo service mysql start
```

6. Install git
```
sudo apt-get install git
```

7. Clone project
```
git clone https://github.com/anastasiabalaban/calendar
```
```
cd calendar
```

8. Install bundler
```
gem install bundler
```

9. Install necessary gems
```
bundle
```

10. Install yarn
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```
```
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```
```
sudo apt-get update && sudo apt-get install yarn
```

11. Create file config/database.yml
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  socket: /tmp/mysql.sock
  host: 127.0.0.1

development:
  <<: *default
  database: calendar_development

test:
  <<: *default
  database: calendar_test

production:
  <<: *default
  database: calendar_production
  username: root
  password: <%= ENV['CALENDAR_DATABASE_PASSWORD'] %>
```

12. Create database
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```
For production (if database calendar_production wasn’t created):
```
rails db:create db:migrate db:seed RAILS_ENV=production
```

13. Compile assets
```
rails assets:precompile
```

14. Install passenger and nginx
```
sudo apt-get install -y dirmngr gnupg
```
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
```
```
sudo apt-get install -y apt-transport-https ca-certificates
```
```
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
```
```
sudo apt-get update
```
```
sudo apt-get install -y nginx-extras libnginx-mod-http-passenger
```
```
if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
```
```
sudo ls /etc/nginx/conf.d/mod-http-passenger.conf
```
```
sudo service nginx start
```

15. Passenger and Nginx configuration
```
sudo nano /etc/nginx/conf.d/mod-http-passenger.conf
```
Change the passenger_ruby line to point to your ruby executable:
```
passenger_ruby /home/anastasia/.rvm/rubies/ruby-2.5.1/bin/ruby;  # your path
```

16. Add the Nginx host
```
sudo nano /etc/nginx/sites-enabled/default
```
Add to this file:
```
server {
	listen 80 default_server;
	listen [::]:80 default_server;
	
	server_name localhost;
              passenger_enabled on;
              rails_env    production;
              root        /home/anastasia/Projects/calendar/public;   # your path
}
```
Remove ‘location’ from this file.
```
sudo service nginx restart
```

17. Run tests:
```
rspec
```



### Useful links:
- 1-2: https://rvm.io/ 
- 1-2: https://habr.com/post/120504/ 
- 3: https://rubyonrails.org/ 
- 4: https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/ 
- 5: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04 
- 6-7: https://git-scm.com/book/en/v2
- 8-9: https://bundler.io/
- 10: https://yarnpkg.com/lang/en/docs/install/#debian-stable 
- 11-12: http://rusrails.ru/rails-database-migrations 
- 13: http://rusrails.ru/asset-pipeline 
- 14-16: https://gorails.com/deploy/ubuntu/18.04
