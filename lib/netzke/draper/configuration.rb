module Netzke
  module Draper
    module Configuration

      def self.reset_config
        configure do |config|
          config.decorate_by_default = true
        end
      end

      def self.configure
        yield self
      end

      def self.decorate_by_default
        @decorate_by_default
      end

      def self.decorate_by_default=(value)
        @decorate_by_default = value
      end

    end
  end
end

# Set default values
Netzke::Draper::Configuration.reset_config
