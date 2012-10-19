require 'rubygems'
require 'rails'
require 'active_record'
require 'netzke-basepack'
require 'draper'
require 'bundler/setup'
require 'netzke-draper'
Bundler.require(:default)

require 'active_support/all'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.mock_with :rspec
end

class Book < ActiveRecord::Base
  def self.columns
    []
  end

  def self.primary_key
    :id
  end
end

class BookDecorator < Draper::Base
  decorates :book
end

class NovelDecorator < Draper::Base
  decorates :book
end

class DataAccessorComponent < Netzke::Base
  include Netzke::Basepack::DataAccessor

  def configure(c)
    c.model = 'Book'
  end
end

class DecoratedComponent < DataAccessorComponent
end

class StringDecoratorComponent < DataAccessorComponent
  def configure(c)
    super
    c.decorator = 'NovelDecorator'
  end
end

class ClassDecoratorComponent < DataAccessorComponent
  def configure(c)
    super
    c.decorator = NovelDecorator
  end
end

class UndecoratedComponent < DataAccessorComponent
  def configure(c)
    super
    c.decorator = false
  end
end
