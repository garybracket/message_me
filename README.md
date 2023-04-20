# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby 3.02
* Rails 6.1.6.1

-System dependencies-
WSL / Windows Subsystem for Linux or a Linux machine itself
Redis-server installed on Linux / WSL
Redis-server must be running or messages will fail and app will crash.

Configure this locally:
git clone this repository
bundle install
rails db:migrate
rails assets:precompile


this will install all the necessary components and dependencies for the app itself


You will also need the redis service running in the background. You can install redis-server into WSL by doing this:
assuming you already installed WSL, you can open command prompt or powershell and type wsl to launch it.
once you are logged in run the following command
sudo apt update
you'll need to enter the password you set for yourself when you installed WSL
once update is complete run
sudo apt install redis-server
hit y to accept the space usage
once it's done installing, launch redis-server by typing command
redis-server

once redis-server is running in background, start rails server in cmd prompt or powershell with command
rails s
now browse to 127.0.0.1 to get into app!

note, if you close WSL redis-server, the app will crash eventually when it tries to read messages from the chatroom. must leave open.

