Modula
======

About
-----
Interface with a SystemLogistics Automated Shelving System.

Initially support will be limited to storing and retreiving items.

The Modula storage units do not provide an API, but will monitor a MySQL database and look for changes. This app attempts to bridge the gap between your main app, and the storage unit.

Usage
-----

### Storing items

Items are stored by posting json order data to `/orders`. Multiple items can be included.

When an order is received, the following steps occur:

1. An *item* record is created.

  This is how the modula knows what you are storing.

2. An *item compartment* record is created.

  This tells the modula which type of compartment needs to be used.

3. An *Order Item* is created for each item.

  This allows you to send multiple items to be stored in a single request.

4. An *Order* is created.

  Your modula will begin to process the request.

```ruby
{
  "order": {
    "command": "P",
    "suspended": "0",
    "description": "something meaningful",
    "items_attributes": [
      {
        "compartment_type": "something-arbitrary",
        "description": "describe-this-item,
        "item_code": "a unique identifier for this item",
        "notes": "fragile",
        "quantity_requested": "10",
        "sub_code_a": "metadata",
        "sub_code_b": "metadata"
      },
      {
        "compartment_type": "something-arbitrary",
        "description": "describe-this-different-item,
        "item_code": "a unique identifier for this item",
        "notes": "tasty",
        "quantity_requested": "100",
        "sub_code_a": "metadata",
        "sub_code_b": "metadata"
      }
    ],
    "name": "a unique identifier for this order"
  }
}
```


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
