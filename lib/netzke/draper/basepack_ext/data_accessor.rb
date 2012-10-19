module Netzke
  module Basepack
    module DataAccessor

      def data_adapter
        @data_adapter ||= data_class && Netzke::Basepack::DataAdapters::AbstractAdapter.adapter_class(data_class).new(data_class, decorator_class)
      end

      # Retrieves the decorator class depending on configuration
      # and model class
      #
      # @return [Class, FalseClass]
      def decorator_class
        if @decorator_class.nil?
          @decorator_class ||= if config[:decorator].is_a?(String)
            config[:decorator].constantize
          elsif config[:decorator].is_a?(Class)
            config[:decorator]
          elsif config.has_key?(:decorator)
            false
          elsif Netzke::Draper::Configuration.decorate_by_default
            begin
              "#{data_class}Decorator".constantize
            rescue NameError
              false
            end
          else
            false
          end
        end
        @decorator_class
      end
    end
  end
end
