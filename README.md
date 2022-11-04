# README

## Introduction ##

InfinityWorks is a multiform application that holds an events calendar with event details, point tracker, link page, and supports mentorships between different users. Admins can create events with descriptions and passcodes, and users can attend these events at the time specified by the admin, which add to their overall points. Links can be added by admins as well. Mentorships between different users allow goals to be created and tracked by both mentor and mentee

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 

## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Download latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* Simple_Calendar - Download latest version at https://github.com/excid3/simple_calendar

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/AnkithP2/BGSA-InfinityWorks.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd BGSA-InfinityWorks`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

<!-- ## Environmental Variables/Files ##

** Add instructions/description if your application requires it. -->

## Deployment ## 

For a new app run the following commands:
- heroku create -a example-app
- git remote -v

For an existing app run the following commands:
- heroku git:remote -a example-app

Rename the remote:
- git remote rename heroku heroku-staging

Deploy the code:
- git push heroku main

Deploy the code from a branch other than main:
- git push heroku testbranch:main

## CI/CD ##

GitHub automatically will conduct the continuous integration, upon a push. Heroku will automatically deploy when the commands are run above.

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.

