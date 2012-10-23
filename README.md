# netzke-draper [<img src="https://secure.travis-ci.org/scho/netzke-draper.png" />](http://travis-ci.org/scho/netzke-draper)

netzke-draper is a simple extension for all [netzke](http://netzke.org/) components, that use the [data accessor](https://github.com/nomadcoder/netzke-basepack/blob/master/lib/netzke/basepack/data_accessor.rb) module (e.g. GridPanel). It automatically decorates your record(s) with a given decorator or one that matches the default naming convention.

## Installation

In Rails 3 add this to your gem file and run the ```bundle``` command.

```
gem 'netzke-draper'
```

## Usage

Simply set the class of your decorator of choice in the netzke configure method.

## Example

Given the following grid panel:

```ruby
class BooksGridPanel < Netzke::Basepack::GridPanel

  def configure(c)
    c.model = 'Book'
    c.decorator = 'BookDecorator'
  end

end
```

and a decorator class for your book model:

```ruby
class BookDecorator < Draper::Base

  decorates :book

  def funky_title
    "#{title} - BOOM!"
  end

end
```

Now you can use all decorator methods (in this case ```funky_title```) in your column definitions of the grid panel, since it automatically wraps all records with your decorator: 

```ruby
class BooksGridPanel < Netzke::Basepack::GridPanel

  # [...]

  column :funky_title do |c|
    c.text = "Funky Title"
  end
end
```

### Which decorator will be used?

1. If you define a decorator in your config, that one will be used:

  ```ruby
  def configure(c)
      c.decorator = 'YourDecorator'
  end
  ```

2. If no decorator is defined, it will try to gues your decorator's class by appending 'Decorator' to your model class.

3. If you set ```c.decorator``` to false, it won't decorate anything, even if a guess would be successful.

4. You can also disable the default usage of a decorator with an initializer. In this case, only if there is an explicit definition of a decorator in the configuration, it will decorate your records:

  ```ruby
  # config/initializers/netzke-draper.rb
  Netzke::Draper.configure do |config|
      config.decorate_by_default = false
  end
  ```

## Contributing to netzke-draper
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Georg Meyer. See LICENSE.txt for
further details.
