require 'netzke/basepack/data_accessor'
require 'netzke/basepack/data_adapters/abstract_adapter'
require 'netzke/basepack/data_adapters/active_record_adapter'

require 'netzke/draper/configuration'
require 'netzke/draper/basepack_ext/data_accessor'
require 'netzke/draper/basepack_ext/data_adapters/abstract_adapter'
require 'netzke/draper/basepack_ext/data_adapters/active_record_adapter'

module Netzke
  module Draper

    class << self

      def configure(&block)
        Netzke::Draper::Configuration.configure(&block)
      end

    end
  end
end
