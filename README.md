Modula
======

About
-----
Interface with a SystemLogistics Automated Shelving System.

Initially support will be limited to storing and retreiving items

* Developed by Dev Fu!, LLC.  http://devfu.com

Installation
------------

    git clone git@github.com:dalegregory/modula.git
    cd modula
    bundle install
    cp config/database.sample.yml config/database.yml
    rake db:schema:load
    ./script/server

Testing
-------

    # this will run all of the RSpec specifications, located in ./spec
    bundle exec rake spec

* Specs are organized into Models & Request specs (/spec/models, /spec/request)
* Model Factories are located in /spec/factories.rb

Tools
-----

These are some of the tools we're using as a convention in this project

RSpec:: We use this for all of our testing.  http://rspec.info
Factory Girl:: This is used for easily creating models from tests.  http://github.com/thoughtbot/factory_girl
